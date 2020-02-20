# $credential = Get-AutomationPSCredential -Name "o365connection"
# Connect-MicrosoftTeams -credential $credential

$group = New-Team -MailNickname "TestTeam" -displayname "Test Teams" -Visibility "private"
Add-TeamUser -GroupId $group.GroupId -User "user100@contoso.onmicrosoft.com"
Add-TeamUser -GroupId $group.GroupId -User "user101@contoso.onmicrosoft.com"
Add-TeamUser -GroupId $group.GroupId -User "user102@contoso.onmicrosoft.com"
New-TeamChannel -GroupId $group.GroupId -DisplayName "日報"
New-TeamChannel -GroupId $group.GroupId -DisplayName "質問"

Write-Host $group.GroupId