Add-Type -Path 'C:\Program Files\WindowsPowerShell\Modules\ADAL.PS\3.19.8.1\Microsoft.IdentityModel.Clients.ActiveDirectory.3.19.8\Microsoft.IdentityModel.Clients.ActiveDirectory.dll'
$authority = 'https://login.microsoftonline.com/<TENANTID>'
$clientId = '<CLIENTID>'
$APIEndpoint = 'https://graph.microsoft.com/v1.0/auditLogs/signIns?&$filter=status/errorCode eq 50126'

$credential = New-Object Microsoft.IdentityModel.Clients.ActiveDirectory.UserPasswordCredential('<AZUREADUSERLOGIN', 'AZUREADUSERPASSWORD')

$authContext = New-Object Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext($authority)

$authenticationResult = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContextIntegratedAuthExtensions]::AcquireTokenAsync($authContext, 'https://graph.microsoft.com/', $clientId, $credential).Result

$token = $authenticationResult.CreateAuthorizationHeader()

$header = @{'Content-Type' = 'application\json';'Authorization' = $token}

$results = Invoke-RestMethod -Headers $header -Uri $APIEndpoint -UseBasicParsing -ContentType "application/json" -Method "Get"

$signins = $results.value | select userPrincipalName, ipAddress, @{Name='errorCode';Expression={$_.status.errorCode}},@{Name='failureReason';Expression={$_.status.failureReason}}, createdDateTime, @{Name='countryOrRegion';Expression={$_.location.countryOrRegion}}
