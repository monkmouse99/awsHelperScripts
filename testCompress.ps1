function Compress-Subfolders
{
    param
    (
        [Parameter(Mandatory = $true)][string] $InputFolder,
        [Parameter(Mandatory = $true)][string] $OutputFolder
    )

    $subfolders = Get-ChildItem $InputFolder | Where-Object { $_.PSIsContainer }

    ForEach ($s in $subfolders) 
    {
        $path = $s
        $path
        Set-Location $path.FullName
        $fullpath = $path.FullName
        $pathName = $path.BaseName

        #Get all items 
        $items = Get-ChildItem

        $zipname = $path.name + ".zip"
        $zippath = $outputfolder + $zipname
        Compress-Archive -Path $items -DestinationPath $zippath
    }
}
