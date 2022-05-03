function Write-Log {
    
<#
    .SYNOPSIS
    Write to a log file

    .DESCRIPTION
    Handles log creation and appends the passed message to the log file when called

    .PARAMETER LogMessage
    Specifies the message to write

    .PARAMETER LogLevel
    Specifies the logging level ("INFO","WARN","ERROR","FATAL")
    Useful if using tools like CMTrace to read log files

    .PARAMETER LogFile
    Specifies the log file path

    .INPUTS
    System.String

    .OUTPUTS
    None.

    .EXAMPLE
    PS> Write-Log -LogMessage "Error starting ssms service" -LogLevel:ERROR -LogFile C:\AuditLogs\16-Jan-2022Audit.log

#>
    [cmdletbinding(SupportsShouldProcess)] # Allows for -WhatIf processing
    Param(
        [Parameter(Mandatory)]
        [string] $LogMessage,

        [Parameter(Mandatory = $false)]
        [ValidateSet ("INFO","WARN","ERROR","FATAL")]
        [string] $LogLevel = "INFO", #Default to INFO if not provided

        [Parameter(Mandatory)]
        [string] $LogFile
    )
    $TimeStamp = (Get-Date).ToUniversalTime().ToString("yyyy/MM/dd HH:mm:ss")

    $NewLogLine = '{0},{1},{2}' -f $TimeStamp, $LogLevel, $LogMessage
    Write-Verbose $NewLogLine -Verbose

    if (Test-Path -path $logFile){
        Add-Content -path $logFile -value $NewLogLine
    } else {
        New-Item -Path $logFile -ItemType:File -Force -Confirm:$false
        Add-Content -path $logFile -Value $NewLogLine
    }
}

Export-ModuleMember -Function Write-Log
