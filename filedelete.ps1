$file = Get-ChildItem 'D:\Backup\*.BAK'
#$file = Get-ChildItem -path 'C:\users\raviraj\Solutions\scripting_assessment\*.BAK'
$deletionDate = (Get-Date).AddDays(-7)

if($file.CreationTime -lt $deletionDate){
    write-output "File created on: $($file.CreationTime.ToString('dd-MM-yyyy'))"
    write-output "Deleting File...."
    $file.Delete()
    write-output "Deleted"
} else {
    write-output "$($file.Name) was created on: $($file.CreationTime.ToString('dd-MM-yyyy')), cannot delete untill $($file.CreationTime.AddDays(7).ToString('dd-MM-yyyy'))"
}