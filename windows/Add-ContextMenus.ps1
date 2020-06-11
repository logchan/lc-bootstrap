New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null

# Adapted from https://stackoverflow.com/a/35843420
$import = '[DllImport("ntdll.dll")] public static extern int RtlAdjustPrivilege(ulong a, bool b, bool c, ref bool d);'
$ntdll = Add-Type -Member $import -Name NtDll -PassThru
$privileges = @{ SeTakeOwnership = 9; SeBackup =  17; SeRestore = 18 }
foreach ($i in $privileges.Values) {
    $null = $ntdll::RtlAdjustPrivilege($i, 1, 0, [ref]0)
}

function Get-UserSid {
    $user = [System.Security.Principal.WindowsIdentity]::GetCurrent().User
    $user = New-Object System.Security.Principal.SecurityIdentifier($user)
    return $user
}

function Has-Ownership {
    param (
        [Parameter(Mandatory=$true)]
        $path
    )

    $acl = Get-Acl $path
    $owner = $acl.Owner
    $user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    return $owner -eq $user
}

function Take-Ownership {
    # path should have from HKCR:\Some\Path
    param (
        [Parameter(Mandatory=$true)]
        $path
    )

    if (Has-Ownership $path) {
        return
    }

    $root = $path.SubString(0, $path.IndexOf(":"))
    $subPath = $path.SubString($path.IndexOf(":")+2)
    $root = @{
        HKCR = "ClassesRoot"
        HKCC = "CurrentConfig"
        HKCU = "CurrentUser"
        HKLM = "LocalMachine"
        HKU = "Users"
    }[$root]

    $key = [Microsoft.Win32.Registry]::$root.OpenSubKey($subPath, [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree, [System.Security.AccessControl.RegistryRights]::TakeOwnership)
    $user = Get-UserSid
    $acl = New-Object System.Security.AccessControl.RegistrySecurity
    $acl.SetOwner($user)
    $key.SetAccessControl($acl)

    $rule = New-Object System.Security.AccessControl.RegistryAccessRule($user, 'ChangePermissions', 'Allow')
    $acl.AddAccessRule($rule)
    $key.SetAccessControl($acl)

    $acl = Get-Acl $path
    $rule = New-Object System.Security.AccessControl.RegistryAccessRule($user, 'SetValue', 'Allow')
    $acl.AddAccessRule($rule)
    Set-Acl $path $acl
}

## Remove built-in open with PowerShell

$psKey = "HKCR:\Directory\Background\shell\Powershell"
Take-Ownership $psKey

$propName = "ShowBasedOnVelocityId"
$props = Get-ItemProperty -Path $psKey
if ($props.$propName) {
    Rename-ItemProperty -Path $psKey -Name $propName -NewName "HideBasedOnVelocityId"
}

reg.exe import .\context-menus.reg