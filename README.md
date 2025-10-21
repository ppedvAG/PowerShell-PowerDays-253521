# PowerShell-PowerDays-253521

KursRepository zu Kurs PowerShell - Grundkurs automatisierte Administration der ppedv AG

[Kursblatt](https://ppedv.de/schulung/kurse/PowershellAdministrationWindowslWMIActiveDirectoryIIS7cmdletspipelinesPs1Skripte.aspx)
### Agenda:
- Einführung
    - PowerShell Versionen
        - **5**, 6, 7
    - Anwendungen
        - Shell
        - ISE
        - Terminal (ab Windows11 default, ansonsten nachinstallierbar)
- Hilfe zur Selbsthilfe
  ```powershell 
  Get-Help
  Get-Command
  Get-Member
  ```
  - Verwendung von -WhatIf / -Confirm
    - WhatifPreference
    - ConfirmPreference
- cmdlet
    - Aufbau Verb-Noun
- Module
- Variablen
- Operationen
- Formatierung  der Ausgabe mit
    ```powershell
    Format-Tabe
    Format-List
    Format-Wide
    ```
- Einfache Ausgabe
    ```powershell
    Out-Host
    Out-File
    Out-Printer
    ```
- PipeLine1