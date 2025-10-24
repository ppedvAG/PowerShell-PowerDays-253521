# Skriptsignierung


Erstellen eines SelfSigned Certificates zum lokalen Testen
```powershell
New-SelfSignedCertificate -Subject 'CN=PowerShell Code Signing Cert' -Type 'CodeSigning' -CertStoreLocation 'Cert:\CurrentUser\My' -HashAlgorithm 'sha256'
```
Abfragen und speichern eines Zertifikates in einer Variable für CodeSigning
```powershell
 $cert= Get-ChildItem -Path Cert:\CurrentUser\My\ -CodeSigningCert |Select-Object -First 1
 ```
 Signieren des Skriptes mit dem vorher abgefragten Zertifikate
 ```powershell
Set-AuthenticodeSignature -Certificate $cert -FilePath 'C:\KursRepo\Beispielskripte\SkriptSigned.ps1'
 ```