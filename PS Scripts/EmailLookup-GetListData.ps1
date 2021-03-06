#Config Variables
$SiteURL = "$SiteURL"
$ListName = "EmailLookup"
$CSVFields=@("Title","EmailAddress","O365LoginName");  
 
## Export List to CSV ##  
function ExportList  
{  
    try  
    {  
        # Get all list items using PnP cmdlet  
        $listItems=(Get-PnPListItem -List $ListName -Fields $CSVFields).FieldValues  
        $outputFilePath="$File_Path\"+$ListName+".csv"  
  
        $hashTable=@()  
 
        # Loop through the list items  
        foreach($listItem in $listItems)  
        {  
            $obj=New-Object PSObject              
            $listItem.GetEnumerator() | Where-Object { $_.Key -in $CSVFields }| ForEach-Object{ $obj | Add-Member Noteproperty $_.Key $_.Value}  
            $hashTable+=$obj;  
            $obj=$null;  
        }  
        $hashtable | export-csv -Encoding Unicode $outputFilePath -NoTypeInformation  -Delimiter "|"
     }  
     catch [Exception]  
     {  
        $ErrorMessage = $_.Exception.Message         
        Write-Host "Error: $ErrorMessage" -ForegroundColor Red          
     }  
}  
 
#Connect to PNP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
## Call the Function  
ExportList  
 
## Disconnect the context  
Disconnect-PnPOnline  

Exit
 
