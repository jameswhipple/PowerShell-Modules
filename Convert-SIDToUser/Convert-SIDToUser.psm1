function Convert-SIDToUser {
<#
    .SYNOPSIS
    Convert an SID to AD Username

    .PARAMETER SID
    Specifies the SID

    .INPUTS
    System.Object

    .OUTPUTS
    System.Object

    .EXAMPLE
    PS> Convert-SIDToUser -SID 'S-1-5-21-1407069869-2091015551-532272213-20313476'

#>
[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    $SID #skip defining a type, let powershell handle it https://stackoverflow.com/questions/58431906/can-a-powershell-function-handle-multiple-input-types
)

$objSID = New-Object System.Security.Principal.SecurityIdentifier($SID)
$objUser = $objSID.Translate([System.Security.Principal.NTAccount])
$objUser #dont need to include return https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_return?view=powershell-7.2

}

Export-ModuleMember -Function Convert-SIDToUser