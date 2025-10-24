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