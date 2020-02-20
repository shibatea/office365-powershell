$ErrorActionPreference = "Stop"

try {
  # New-DistributionGroup -Type "Security" -Name "tashibata-0220"
  Add-DistributionGroupMember -Identity "tashibata-0220" -BypassSecurityGroupManagerCheck -confirm:$false -Member "hoge@contoso.onmicrosoft.com"
}
# catch [Microsoft.TeamsCmdlets.PowerShell.Custom.ErrorHandling.ApiException] {
#   if ($_.Exception.ErrorCode -eq 404) {
#     Write-Output "target user not found."
#     break;
#   }
#   else {
#     $ErrorMessage = $_.Exception.Message
#     $StackTrace = $_.Exception.StackTrace
#     Write-Output "Error Occurred: Message: $ErrorMessage, stack: $StackTrace."
#   }
# }
catch {
  $ErrorMessage = $_.Exception.Message
  $StackTrace = $_.Exception.StackTrace
  Write-Output "Error Occurred: Message: $ErrorMessage, stack: $StackTrace."
}
finally {
  Write-Output "End!!!"
}
