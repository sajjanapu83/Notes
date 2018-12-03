$Right = [System.Security.AccessControl.FileSystemRights]"Read" 
$InheritanceFlag = [System.Security.AccessControl.InheritanceFlags]::None 
$PropagationFlag = [System.Security.AccessControl.PropagationFlags]::InheritOnly  
$objType =[System.Security.AccessControl.AccessControlType]::Allow 

$objUser = New-Object System.Security.Principal.NTAccount("DomainName\Users") 
$objACE = New-Object System.Security.AccessControl.FileSystemAccessRule `
    ($objUser, $Right, $InheritanceFlag, $PropagationFlag, $objType) 
$objACL = Get-ACL "$HOME\Downloads\Test" 
$objACL.RemoveAccessRuleAll($objACE) 
Set-ACL "$HOME\Downloads\Test" -aclobject $objACL


$FoldersList=@("user1","user2")
$UsersList=@("domain1\user1","domain1\user2")
$i = 0
ForEach ($folder in $FoldersList) {
$user = $UsersList[$i]
$objACL = Get-ACL "$HOME\Downloads\Test\$folder" 
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule($user,"FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
$objACL.AddAccessRule($rule) 
#$objACL.RemoveAccessRuleAll($rule) 
Set-ACL "$HOME\Downloads\Test\$folder" -aclobject $objACL
$OthersList = $UsersList | Where-Object { $_ –ne "$user" }
 ForEach ($other in $OthersList) {
   $objACL = Get-ACL "$HOME\Downloads\Test\$folder" 
   $rule = New-Object System.Security.AccessControl.FileSystemAccessRule($other,"FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
   $objACL.RemoveAccessRuleAll($rule) 
   Set-ACL "$HOME\Downloads\Test\$folder" -aclobject $objACL
 }
 
Write-Output "OthersList = $OthersList"
$i = $i + 1
}
