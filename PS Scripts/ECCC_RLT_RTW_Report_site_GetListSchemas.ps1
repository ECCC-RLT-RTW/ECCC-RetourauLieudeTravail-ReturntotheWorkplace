#Config Variables
$SiteURL = "$SiteURL"
$ListNames = @("ActiveDirectory_Dashboard", "Date_Dashboard", "AccessRequest_Dashboard", "AccessRequest_Trace", "Building", "Equipment_Dashboard", "Floor","VisitorLog_Trace")
$ListsOutputFile = "$File_Path\RLT_RTW_Reporting_Site_ListSchemas.xml"
 
#Connect to PNP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
#Get the List schemas from the Site Templates and export to XML file
$Templates = Get-PnPProvisioningTemplate -OutputInstance -Handlers Lists -ListsToExtract $ListNames 
Save-PnPProvisioningTemplate -InputInstance $Templates -Out ($ListsOutputFile)	

