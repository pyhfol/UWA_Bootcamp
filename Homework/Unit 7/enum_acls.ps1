$directory = Get-ChildItem | select -ExpandProperty name
foreach ($dir in $directory) {
    get-acl $dir
    }