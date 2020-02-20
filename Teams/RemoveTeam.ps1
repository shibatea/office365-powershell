[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]
    $groupId
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

try {
    Remove-Team -GroupId $groupId
}
catch {
    Write-Host "Unknown error"
}