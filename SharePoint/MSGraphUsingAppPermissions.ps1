Connect-PnPOnline -AppId '<クライアントID>' -AppSecret '<クライアントシークレット>' -AADDomain '<テナントID>'
$token = Get-PnPAccessToken
$url = "https://graph.microsoft.com/v1.0/users"
$headerParams = @{'Authorization' = "Bearer $token" }
$contentType = "application/json"
$response = Invoke-RestMethod -uri $url -Method Get -header $headerParams -ContentType $contentType
$response.value | Export-Csv -Path .\users.csv -Encoding UTF8 -NoTypeInformation
