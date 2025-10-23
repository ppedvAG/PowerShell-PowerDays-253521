function Test-Scope
{
    [cmdletBinding()]
    param(
        
    )
    Write-Host -Object $Message -ForegroundColor Green
    $Message = "Dies ist eine Testausgabe aus der Modullogik."
    Write-Host -Object $Message -ForegroundColor Green
}