# AzureADFailedSignIns
Get Azure Active Directory failed sign-ins from Graph API

Query Microsoft Graph API for incorrect login or password sign-ins. We filter for specifit Event ID of 50126 that's "Invalid username or password". You could change this inside the script. The script uses Azure AD user's credentials in clear text, so make sure it's stored properly.

Prerequisites:
1. Azure Active Directory premium 1 (P1) license
2. Azure AD User has directory role Report Reader
3. Application right Read all audit log data
4. ADAL v3 

Preparation:
1. Run PowerShell command to install ADAL module
Install-Package ADAL.PS
2. Get Tenant ID that is Directory ID from Azure AD properties at https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Properties
3. Register application for you Azure AD at https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/RegisteredAppsPreview
3.1. Get Application (client) ID from Application properties
3.3. Make sure to check under app's Authentication Default client type Yes (Application is public client)
3.4. Make sure to grant API permission of AuditLog.Read.All to the application 
 
