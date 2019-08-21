# Azure AD Failed Sign-ins
Get Azure Active Directory failed sign-ins from Graph API

Query Microsoft Graph API for incorrect login or password sign-ins. We filter for specifit Event ID of **50126** that's `Invalid username or password`. You could change this inside the script. The script uses Azure AD user's credentials in clear text, so make sure it's stored properly.

Prerequisites:
1. Azure Active Directory premium 1 (P1) license
1. Azure AD User has Report Reader directory role
1. Application right Read all audit log data
1. ADAL v3 

Preparation:
1. Run PowerShell command to install ADAL module
   >Install-Package ADAL.PS
1. Get Tenant (Authority) ID that is Directory ID from Azure AD properties at https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Properties
1. Create Azure AD user and assign him Report Reader role 
1. Register application for you Azure AD at https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/RegisteredAppsPreview
   1. Get Application (Client) ID from Application properties
   1. Make sure to check under app's Authentication Default client type Yes (Application is public client)
   ![AzureAD App Public Client](/images/azuread-app-registration-01.PNG)
   1. Make sure to grant API permission of AuditLog.Read.All to the application
   ![AzureAD App API Permission](/images/azuread-app-registration-02.PNG)
1. Edit the script and supply your
   1. `TENANTID` and `CLIENTID`for Tenant (Authority) and Application (Client)
   1. `AZUREADUSERLOGIN` and `AZUREADUSERPASSWORD` for Azure AD User with correct role
 
