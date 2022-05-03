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
