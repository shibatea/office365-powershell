[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]
    $groupId,

    [Parameter(Mandatory = $true)]
    [array]
    $removeUsers
)

# $credential = Get-AutomationPSCredential -Name "o365connection"
# Connect-MicrosoftTeams -credential $credential

try {
    Get-Team -GroupId $groupId | Out-Null
}
catch {
    Write-Host "target team not found."
    exit -1
}

$removeUsers | ForEach-Object { 
    try {
        Remove-TeamUser -GroupId $groupId -User $_ 
    }
    catch [Microsoft.TeamsCmdlets.PowerShell.Custom.ErrorHandling.ApiException] {
        if ($_.Exception.ErrorCode -eq 404) {
            Write-Host "target user not found."
        }
    }
    catch {
        Write-Host "Unknown error"
    }
}
