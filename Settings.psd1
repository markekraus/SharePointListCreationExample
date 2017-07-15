@{  
    SharePoint = @{
        # File containing the credentials to use for SharePoint Online
        CredentialFile         = "C:\scripts\Credentials\SharePointAdminCreds.xml"
        # Site URL of the SharePoint Site where the SharePoint List will be housed
        Site                   = 'https://adatum.sharepoint.com/sites/it/'
        # SharePoint Online Admin URL, used to look up OneDrive URL's 'https://<tenant>-admin.sharepoint.com' 
        AdminUrl               = 'https://adatum-admin.sharepoint.com' 
        # Name of the SharePoint list that will house the OneDrive URL's
        ListName               = "OneDrive URL's"
        # Template string for Items in list view queries
        BeginsWithItemTemplate = '<BeginsWith><FieldRef Name="{0}" /><Value Type="Text">{1}</Value></BeginsWith>'
        # Template string for list view queries
        QueryTemplate          = '<OrderBy><FieldRef Name="{0}" /></OrderBy><Where>{1}</Where>'
        # Fields which will be Indexed
        IndexFields            = @(
            'UserPrincipalName'
            'ObjectGUID'
            'GivenName'
            'Surname'
        )
        # Fields to define with Add-PnPField
        ListFields             = @(
            @{
                DisplayName      = 'UserPrincipalName (UPN)'
                InternalName     = 'UserPrincipalName'
                type             = 'Text'
                AddToDefaultView = $true
            }
            @{
                DisplayName      = 'First Name'
                InternalName     = 'GivenName'
                type             = 'Text'
                AddToDefaultView = $true
            }
            @{
                DisplayName      = 'Last Name'
                InternalName     = 'Surname'
                type             = 'Text'
                AddToDefaultView = $true
            }
            @{
                DisplayName      = 'SamAccountName'
                InternalName     = 'SamAccountName'
                type             = 'Text'
                AddToDefaultView = $true
            }
            @{
                DisplayName      = 'OneDrive URL'
                InternalName     = 'OneDriveUrl'
                type             = 'URL'
                AddToDefaultView = $true
            }
            @{
                DisplayName      = 'ObjectGUID'
                InternalName     = 'ObjectGUID'
                type             = 'Text'
                AddToDefaultView = $false
            }
        )
        # Views to add
        # FilterProperty is the property that will be sorted by and which will be filtered on
        # BeginsWith is letters or numbers that the FilterProperty must begin with to appear in the view
        Views                  = @(
            @{
                Title          = 'UPN #'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'UserPrincipalName'
                BeginsWith     = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
            }
            @{
                Title          = 'UPN A-E'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $True
                Paged          = $true
                FilterProperty = 'UserPrincipalName'
                BeginsWith     = 'A', 'B', 'C', 'D', 'E'
            }
            @{
                Title          = 'UPN F-L'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'UserPrincipalName'
                BeginsWith     = 'F', 'G', 'H', 'I', 'J', 'K', 'L'
            }
            @{
                Title          = 'UPN M-R'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'UserPrincipalName'
                BeginsWith     = 'M', 'N', 'O', 'P', 'Q', 'R'
            }
            @{
                Title          = 'UPN S-Z'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'UserPrincipalName'
                BeginsWith     = 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
            }
            @{
                Title          = 'First Name #'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'GivenName'
                BeginsWith     = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
            }
            @{
                Title          = 'First Name A-E'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'GivenName'
                BeginsWith     = 'A', 'B', 'C', 'D', 'E'
            }
            @{
                Title          = 'First Name F-L'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'GivenName'
                BeginsWith     = 'F', 'G', 'H', 'I', 'J', 'K', 'L'
            }
            @{
                Title          = 'First Name M-R'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'GivenName'
                BeginsWith     = 'M', 'N', 'O', 'P', 'Q', 'R'
            }
            @{
                Title          = 'First Name S-Z'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'GivenName'
                BeginsWith     = 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
            }
            @{
                Title          = 'Last Name #'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'Surname'
                BeginsWith     = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
            }
            @{
                Title          = 'Last Name A-E'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'Surname'
                BeginsWith     = 'A', 'B', 'C', 'D', 'E'
            }
            @{
                Title          = 'Last Name F-L'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'Surname'
                BeginsWith     = 'F', 'G', 'H', 'I', 'J', 'K', 'L'
            }
            @{
                Title          = 'Last Name M-R'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'Surname'
                BeginsWith     = 'M', 'N', 'O', 'P', 'Q', 'R'
            }
            @{
                Title          = 'Last Name S-Z'
                Fields         = 'UserPrincipalName', 'GivenName', 'Surname', 'SamAccountName', 'OneDriveUrl'
                SetAsDefault   = $false
                Paged          = $true
                FilterProperty = 'Surname'
                BeginsWith     = 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
            }
        )
    }
}