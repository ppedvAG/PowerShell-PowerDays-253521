function Test-Scope
{
    [cmdletBinding()]
    param(
        
    )
    Write-Debug -Message "Debughaltepunkt"
    Write-Host -Object $Message -ForegroundColor Green
    $Message = "Dies ist eine Testausgabe aus der Modullogik."
    Write-Host -Object $Message -ForegroundColor Green
}

function Test-TryCatch
{
[cmdletBinding()]
param(
)
    try
    {
        1/0
    }
    catch
    {
        Write-Verbose -Message "Geteilt durch 0 wird nicht"
    }
    finally
    {
        Write-Verbose -Message "Wird immer ausgeführt egal ob ein Fehler aufgetreten ist oder nicht"
    }
}

function Test-BeginProcessEnd
{
<#
.SYNOPSIS
 Test BPE
#>
[cmdletBinding()]
param(
    [Parameter(ValueFromPipeLine=$true,ValueFromPipeLineByPropertyName=$true)]
    [string]$Name,

    [Parameter(ValueFromPipeLineByPropertyName=$true)]
    [string]$Displayname
)
 begin 
 {
    Write-Host -Object "Wird einmal zum Start ausgeführt zb zur Initialisierung von Variablen" -BackgroundColor White -ForegroundColor Blue
    $i = 1
 }
 process
 {
    Write-Verbose -Message "Wird für jedes objekt ausgeführt"
    if($i%2 -eq 0)
    {
        $Color = "Black"
    }
    else
    {
        $color = "White"
    }
    Write-Host -Object "Parameter Name: $Name" -ForegroundColor $Color
    Write-Host -Object "Parameter Displayname: $Displayname" -ForegroundColor $Color
    $i++
 }
 end
 {
    Write-Host -Object "Wird einmal zum Schluss ausgeführt" -BackgroundColor White -ForegroundColor Blue
 }

}