clear
$strPath = "$HOME\Documents\Test.xls"
$password = 1111
$sheetname = "sheet1"
$searchString = "dc=domainName,dc=company,DC=net"
$objExcel = New-Object -ComObject Excel.Application
$objExcel.Visible = $false
 If (!([string]::IsNullOrEmpty($password))) {
$WorkBook = $objExcel.Workbooks.Open($strPath,0,0,5,$password)
} else {
$WorkBook = $objExcel.Workbooks.Open($strPath)
}
$worksheet = $workbook.sheets.item($sheetname)
$UsedRange = $worksheet.UsedRange
ForEach($Row in ($UsedRange.Rows|Select -skip 5)){
   
   If (!([string]::IsNullOrEmpty($Row.Cells.Item(1).Value2))) {
    $empid= [int]$Row.Cells.Item(1).Value2 * 1
    $ADList = $(Get-ADUser -Filter { (EmployeeID -eq $empid) -or (EmployeeNumber -eq $empid) } -SearchBase $searchString)
    If (!([string]::IsNullOrEmpty($ADList.Name))) {
    Write-Output $($ADList.Name + "`t-`t" + $ADList.Enabled + "`t using EMPID")
    } Else
    {
     $empid= [int]$Row.Cells.Item(5).Value2 * 1
     $ADList = $(Get-ADUser -Filter {(EmployeeID -eq $empid) -or (EmployeeNumber -eq $empid) } -SearchBase $searchString)
      Write-Output $($ADList.Name + "`t-`t" + $ADList.Enabled + "`t using ASSIGNMENT#")
    }
   } ElseIf (!([string]::IsNullOrEmpty($Row.Cells.Item(17).Value2))) {
    $mailid= $Row.Cells.Item(17).Value2.trim()
    $ADList = $(Get-ADUser -Filter {EmailAddress -like $mailid } -SearchBase $searchString)
    Write-Output $($ADList.Name + "`t-`t" + $ADList.Enabled  + "`t using EMAIL")

   } 
}

$objExcel.quit()
