#Config Variables
$SiteURL = "$SiteURL"
$TemplateFile = "$File_Path\RLT_RTW_App_Site_ListSchemas.xml"
 
#Connect to PNP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
Write-Host "Creating List(s) from Template File..."
Apply-PnPProvisioningTemplate -Path $TemplateFile

