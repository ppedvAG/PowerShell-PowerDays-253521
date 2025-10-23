[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -Path $PSItem -PathType Container})]
[string]$Path,

[ValidateLength(5,20)]
[string]$DirName = "TestFiles2",

[ValidateRange(1,99)]
[int]$FileCount = 9,

[ValidateRange(1,99)]
[int]$DirCount = 2,

[switch]$Force
)

$TestFilesDirPath = Join-Path -Path $Path -ChildPath $DirName
if(Test-Path -Path $TestFilesDirPath -PathType Container)
{
    if($Force)
    {
        Remove-Item -Path $TestFilesDirPath -Recurse -Force
    }
    else
    {
        Write-Host -ForegroundColor Red -Object "Ordner bereits vorhanden"
        exit
    }
}

$TestFilesDir = New-Item -Path $Path -Name $DirName -ItemType Directory

for($i = 1; $i -le $FileCount; $i++)
{
    $Filenumber = "{0:D2}" -f $i
    $Filename = "File$Filenumber.txt"

    New-Item -Path $TestFilesDir.FullName -Name $Filename -ItemType File
}

for($i = 1; $i -le $DirCount; $i++)
{
    $Dirnumber = "{0:D2}" -f $i
    $Dirname = "Dir$Dirnumber"

    $subdir = New-Item -Path $TestFilesDir.FullName -Name $Dirname -ItemType Directory

    for($j = 1; $j -le $FileCount; $j++)
    {
        $Filenumber = "{0:D2}" -f $j
        $Filename = "$Dirname-File$Filenumber.txt"

        New-Item -Path $Subdir.FullName -Name $Filename -ItemType File
    }
}

