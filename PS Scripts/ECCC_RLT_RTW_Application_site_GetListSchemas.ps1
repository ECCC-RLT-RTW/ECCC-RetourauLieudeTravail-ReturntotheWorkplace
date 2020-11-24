#Config Variables
$SiteURL = "$SiteURL"
$ListNames = @("BuildingEmails", "EmailLookup", "LoginLog", "TextTemplate", "VisitorAttestation", "AccessRequest", "Building","Floor","EmailQueue", "UserSetting","VisitorLog")
$ListsOutputFile = "$File_Path\RLT_RTW_App_Site_ListSchemas.xml"
 
#Connect to PNP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
#Get the List schemas from the Site Templates and export to XML file
$Templates = Get-PnPProvisioningTemplate -OutputInstance -Handlers Lists -ListsToExtract $ListNames 
Save-PnPProvisioningTemplate -InputInstance $Templates -Out ($ListsOutputFile)	

