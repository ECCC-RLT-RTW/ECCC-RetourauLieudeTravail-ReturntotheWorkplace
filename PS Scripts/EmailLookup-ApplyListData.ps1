#Config Variables
$SiteURL = "$SiteURL"
$ListName = "EmailLookup"
$CSVFolder = "$File_Path\"
$CSVFields=@("Title","EmailAddress","O365LoginName") # Not currently being used below
###!!! CSV Fields need to be hard coded in script below. 
###To Do: investigate using for loop to iterate through columns 
 
#Get the CSV file contents
$CSVData = Import-Csv -Path ($CSVFolder + $ListName + ".csv") -header "Title","EmailAddress","O365LoginName" -delimiter "|"
 
#Connect to site
Connect-PnPOnline $SiteUrl -UseWebLogin
 
#Iterate through each Row in the CSV and import data to SharePoint Online List
foreach ($Row in $CSVData)
{
	if ($Row.Title -ne "Title")	
	{

		Add-PnPListItem -List $ListName -Values @{"Title" = $($Row.Title);		
                            "EmailAddress" = $($Row.EmailAddress);
                            "O365LoginName" = $($Row.O365LoginName);}
    }
}
