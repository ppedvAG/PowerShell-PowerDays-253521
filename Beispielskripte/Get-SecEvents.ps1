<#
.SYNOPSIS
 Dieses Skript frägt Security Events ab
.DESCRIPTION
 Dieses Skript kann Events aus dem Security Log Abfragen wie zb Events zum Thema Anmeldung, Abmeldung oder auch fehlgeschlagene Anmeldungen.
.PARAMETER EventId
 Mithilfe dieses Parameters wird definiert welche EventId abgefragt wird. Es stehen folgende Werte zur Auswahl:
 4624: Anmeldung
 4625: fehlgeschlagene Anmeldung
 4634: Abmeldung
.Parameter Newest
 Dieser Parameter definiert wie viele aktuelle Events ausgegeben werden. 
.EXAMPLE
 Get-SecEvents.ps1 -EventId 4624


   ProviderName: Microsoft-Windows-Security-Auditing

TimeCreated                     Id LevelDisplayName Message
-----------                     -- ---------------- -------
23.10.2025 11:29:26           4624 Informationen    Ein Konto wurde erfolgreich angemeldet....
23.10.2025 11:28:31           4624 Informationen    Ein Konto wurde erfolgreich angemeldet....
23.10.2025 11:28:31           4624 Informationen    Ein Konto wurde erfolgreich angemeldet....
23.10.2025 11:28:26           4624 Informationen    Ein Konto wurde erfolgreich angemeldet....
23.10.2025 11:27:26           4624 Informationen    Ein Konto wurde erfolgreich angemeldet....

.LINK
 https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#syntax-for-comment-based-help-in-scripts
#>
[cmdletBinding()]
param(
[Parameter(Mandatory= $true)]
[ValidateSet(4624,4625,4634)]
[int]$EventId,

[ValidateRange(5,10)]
[int]$Newest = 5,

[ValidateScript({Test-NetConnection -ComputerName $PSItem -CommonTCPPort WINRM -InformationLevel Quiet})]
[string]$Computername = "localhost"
)
# Die Validates sind Eigenschaften der Variablen und werden auch im Skript weiter geprüft
#$EventId = 3
Write-Verbose -Message "Zusätzliche optionale Ausgaben"
Write-Verbose -Message "Es wurde die EventId $EventId übergeben"
Write-Debug -Message "Vor der eigentlichen Abfrage"
Get-WinEvent -LogName Security -ComputerName $Computername | Where-Object -FilterScript {$PSItem.ID -eq $EventId} | Select-Object -First $Newest
Write-Verbose -Message "Nach Abfrage"
Write-Debug -Message "Nach Abfrage"