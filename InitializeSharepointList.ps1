#Requires -Modules SharePointPnPPowerShellOnline
<#
    .SYNOPSIS
        Creates the SharePoint list to house the OneDrive URL information.
    
    .DESCRIPTION
        Creates the SharePoint list to house the OneDrive URL information.
        This removes "disables" the Title field as well as creates several list views
#>

# Import Settings
$Settings = Import-LocalizedData -FileName "Settings.psd1"
$CredentialFile = $Settings.SharePoint.CredentialFile
$SharePointSite = $Settings.SharePoint.Site
$SharePointListName = $Settings.SharePoint.ListName
$Fields = $Settings.SharePoint.ListFields
$IndexFields = $Settings.SharePoint.IndexFields
$Views = $Settings.SharePoint.Views
$BeginsWithItemTemplate = $Settings.SharePoint.BeginsWithItemTemplate
$QueryTemplate = $Settings.SharePoint.QueryTemplate

# Connect to SharePoint
$Credentials = Import-Clixml -Path $CredentialFile
$Params = @{
    url         = $SharePointSite
    Credentials = $Credentials
}
Connect-PnPOnline @Params

# Create List
New-PnPList -Title $SharePointListName -Template 'genericlist' -EnableContentTypes

# Create Fields
$CreatedFields = foreach ($Field in $Fields) {
    Add-PnPField -List $SharePointListName @Field 
}

# Hide Title
$TitleField = Get-PnPField -List $SharePointListName -Identity 'Title'
$TitleField.SetShowInDisplayForm($false)
$TitleField.SetShowInEditForm($false)
$TitleField.SetShowInNewForm($false)
$TitleField.set_Hidden($true)
$TitleField.set_Required($false)
$TitleField.Update()
$Context = $TitleField.Context
$Context.ExecuteQuery()

# Remove Title from default list view
$List = Get-PnPList -Identity $SharePointListName
$Context = $List.Context
$DefaultView = $List.DefaultView
$ViewFields = $DefaultView.ViewFields
$Context.Load($ViewFields)
$Context.ExecuteQuery()
$ViewFields.Remove("LinkTitle")
$DefaultView.Update()
$Context.ExecuteQuery()

# Enable indexing on index fields
foreach ($IndexField in $IndexFields) {
    $Field = Get-PnPField -List $SharePointListName -Identity $IndexField
    $Field.Indexed = $true
    $Field.Update()
    $Context = $Field.Context
    $Context.ExecuteQuery()
}

# Create Views

foreach ($View in $Views) {
    $BeginsWithItems = ''
    # The Or operator cannot handle more than 2 tests so they have to be nested
    1..($View.BeginsWith.Count - 1) | ForEach-Object {$BeginsWithItems += '<Or>' }
    $Count = 1
    foreach ($BeginningCharacter in $View.BeginsWith) {
        $BeginsWithItems += $BeginsWithItemTemplate -f $View.FilterProperty, $BeginningCharacter
        if ($Count -gt 1) { $BeginsWithItems += '</Or>'}
        $Count++
    }
    $Query = $QueryTemplate -f $View.FilterProperty, $BeginsWithItems
    $Params = @{
        List         = $SharePointListName 
        Title        = $View.Title 
        Fields       = $View.Fields 
        Query        = $Query 
        SetAsDefault = $View.SetAsDefault
        Paged        = $View.Paged        
    }
    Add-PnPView @Params
}