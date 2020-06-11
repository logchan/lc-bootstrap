## Activate "High performance" plan

# TODO: Known issue: getting by name fails when system language is not English
$plan = Get-WmiObject -Class win32_powerplan -Namespace root\cimv2\power | Where-Object { $_.ElementName -eq "High performance" }
$plan = $plan.InstanceID
if ($plan -match "Microsoft:PowerPlan\\{([\w\-]+)}") {
    $plan = $Matches.1
    powercfg.exe /setactive $plan
}

## Set "turns off screen" and "sleep" to never (plugged in)
powercfg.exe /x monitor-timeout-ac 0
powercfg.exe /x standby-timeout-ac 0

## Set lock screen idle time to 30 minutes
powercfg.exe /setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 7516b95f-f776-4464-8c53-06167f40cc99 8ec4b3a5-6868-48c2-be75-4f3044be88a7 1800

## Disable hibernate
powercfg.exe /h off