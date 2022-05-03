# PowerShell-Modules
ps module collection

## Example Usage of Write-Log after placing the module in a valid directory listed in $env:PSModulePath

```
Import-Module Write-Log
$dateStamp = Get-Date -f "dd-MMM-yyyy"
$logFile = "C:\Logs\audit_$($dateStamp).log"

Try {
    Get-Service -Name "ssms" -ErrorAction:Stop
} catch{
    Write-Log -LogMessage "Failed to get ssms service" -LogLevel:FATAL -LogFile $logFile
}
```

## Accessing examples
`Get-Help Convert-SIDToUser -Examples`
```
NAME
    Convert-SIDToUser

SYNOPSIS
    Convert an SID to AD Username

    -------------------------- EXAMPLE 1 --------------------------

    PS>Convert-SIDToUser -SID 'S-1-5-21-1407069869-2091015551-532272213-20313476'


    -------------------------- EXAMPLE 2 --------------------------

    PS>Convert-SIDToUser -SID @(((Get-LocalUser).where{($_.Name -eq 'FOO')} | Select-Object -ExpandProperty SID).value)
```
