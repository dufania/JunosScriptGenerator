

#Scripted by JV

$CRQ = Read-Host -Prompt 'CRQ'

function address-set
{
Write-Host "This script will generate a text file in the format CRQ_ddmmyyyy.txt" -ForegroundColor Yellow
$FileName = (Get-Date).tostring("-dd-MM-yyyy")            
$File= "$Home\Documents\CRQ$CRQ$Filename.txt"
$FromZone = Read-Host -Prompt 'set security policies from-zone'
$ToZone= Read-Host -Prompt 'Input the to-zone'
$Policy = read-Host -Prompt 'Enter Policy Number'
$SourceAddress = Read-Host -Prompt 'Source Address'
$DstAddress = Read-Host -Prompt 'Destination Address'
$Application = Read-Host -Prompt 'Application'
$myString = @"

set security policies from-zone $FromZone to-zone $ToZone policy $Policy match source-address $SourceAddress 
set security policies from-zone $FromZone to-zone $ToZone policy $Policy match destination-address $DstAddress  
set security policies from-zone $FromZone to-zone $ToZone policy $Policy match application $Application 
set security policies from-zone $FromZone to-zone $ToZone policy $Policy then permit
set security policies from-zone $FromZone to-zone $ToZone policy $Policy then log session-init
set security policies from-zone $FromZone to-zone $ToZone policy $Policy then log session-close

"@
$myString | out-file -Append $file
}

function application-set

{
Write-Host "This script will generate a text file in the format CRQ_ddmmyyyy.txt" -ForegroundColor Yellow
$FileName = (Get-Date).tostring("-dd-MM-yyyy")            
$File= "$Home\Documents\CRQ$CRQ$Filename.txt"
$GrpAppName = Read-Host -Prompt 'Address Name for the Group'
$App1= Read-Host -Prompt 'App 1'
$App2 = Read-Host -Prompt 'App 2'
$App3= Read-Host -Prompt 'App 3'
$App4 = Read-Host -Prompt 'App 4'
$App5 = Read-Host -Prompt 'App 5'
$myString = @"

set applications application-set $GrpAppName application $App1
set applications application-set $GrpAppName application $App2
set applications application-set $GrpAppName application $App3
set applications application-set $GrpAppName application $App4
set applications application-set $GrpAppName application $App5

"@
$myString | out-file -Append $file
}


function firewall-rules
{
Write-Host "This script will generate a text file in the format CRQ_ddmmyyyy.txt" -ForegroundColor Yellow

$FileName = (Get-Date).tostring("-dd-MM-yyyy")            
$File= "$Home\Documents\CRQ$CRQ$Filename.txt"
$FromZone = Read-Host -Prompt 'set security policies from-zone'
$ToZone= Read-Host -Prompt 'Input the to-zone'
$Policy = read-Host -Prompt 'Enter Policy Number'
$SourceAddress = Read-Host -Prompt 'Source Address'
$DstAddress = Read-Host -Prompt 'Destination Address'
$Application = Read-Host -Prompt 'Application'
$myString = @"

set security policies from-zone $FromZone to-zone $ToZone policy $Policy match source-address $SourceAddress
set security policies from-zone $FromZone to-zone $ToZone policy $Policy match destination-address $DstAddress 
set security policies from-zone $FromZone to-zone $ToZone policy $Policy match application $Application 
set security policies from-zone $FromZone to-zone $ToZone policy $Policy then permit
set security policies from-zone $FromZone to-zone $ToZone policy $Policy then log session-init
set security policies from-zone $FromZone to-zone $ToZone policy $Policy then log session-close

"@
sleep 3
$myString | out-file -Append $file
}

 #Areyousure function. Alows user to select y or n when asked to exit. Y exits and N returns to main menu.  
 function areyousure {$areyousure = read-host "Are you sure you want to exit? (y/n)"  
           if ($areyousure -eq "y"){exit}  
           if ($areyousure -eq "n"){mainmenu}  
           else {write-host -foregroundcolor red "Invalid Selection"   
                 areyousure  
                }  
                     } 
  #Mainmenu function. Contains the screen output for the menu and waits for and handles user input.  
 function mainmenu{  
  cls  
 echo "---------------------------------------------------------"  
 echo ""  
 echo ""  
 echo "    Junos Rule Generator"  
 echo ""
 echo "    1. Add an Application Set"  
 echo "    2. Add an Address Set" 
 echo "    3. Add Firewall rules" 
 echo "    4. Exit"  
 echo ""  
 echo ""  
 echo "---------------------------------------------------------"  
 $answer = read-host "Please Make a Selection"  
 if ($answer -eq 1){application-set}  
 if ($answer -eq 2){address-set}  
 if ($answer -eq 3){firewall-rules}  
 if ($answer -eq 4){areyousure}  
 else {write-host -ForegroundColor Yellow "Enter to Continue"  
       sleep 3  
       mainmenu  
      }  


                }  
 mainmenu  



