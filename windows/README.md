# Windows

Below is a checklist of Windows 10 configuration items.

## Automated by scripts

### Add-ContextMenus.ps1

1. Includes context-menus.reg
1. Remove the built-in "Open PowerShell here" command (because it has no icon)
1. Add four commands: "Open [Admin] (PowerShell | cmd) here" (with icons)
1. Add "Copy full name" command

### Set-MousePrecision.ps1

1. Turn off "enhance pointer precision" (effective immediately, but does not affect future boots)

### Set-PowerPlan.ps1

1. Choose the "High performance" power plan
1. Set "turns off screen" and "sleep" to never (plugged in)
1. Set lock screen idle time to 30 minutes
1. Disable hibernate

### tweaks.reg

1. Allow changing lock screen idle time in Advanced Power Options
1. Remove the "3D Objects" library folder
1. Set taskbar icons to "Never combine"
1. Show known extensions
1. Start explorer to "This PC" instead of "Quick Access"
1. Remove "Move to OneDrive" command1
1. Disable "enhance pointer precision" (effective at next reboot)
1. Disable recent files in start

## Manual

### Disable OneDrive entirely

1. Enable the group policy: Computer Configuration | Administrative Templates | Windows Components | OneDrive > Prevent the usage of OneDrive for file storage

2. Uninstall OneDrive

### Software installation

1. Currently managed by a "bootstrap" software collection