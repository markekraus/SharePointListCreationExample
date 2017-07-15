# Example SharePoint List Generation Script

This script demonstrates using a `settings.psd1` configuration file to build a SharePoint Online List with the SharePointPnPPowerShellOnline Module.

This is meant only as an example and this project will not be maintained.

This script was originally used to create a List that housed all of OneDrive for Business URL's in a ~5000 user Office 365 Tenant. There is a separate script (not included here) which pulls in all the users from our on-prem Active Directory and then queries SharePoint Online to get their personal URL's for OneDrive for Business.

# Features

* Creates a SharePoint Online List named `OneDrive URL's`
* Adds The following Fields
  - `UserPrincipalName (UPN)`
  - `First Name`
  - `Last Name`
  - `SamAccountName`
  - `OneDrive URL`
  - `ObjectGUID`
* Hides the default `Title` Field
* Removes the Default `Title` Field from the default list view
* Enables Indexing for the following fields:
  - `UserPrincipalName (UPN)`
  - `First Name`
  - `Last Name`
  - `ObjectGUID`
* Creates views which limit the list to alphabetical groups (e.g. UPN's beginning with A-E)

