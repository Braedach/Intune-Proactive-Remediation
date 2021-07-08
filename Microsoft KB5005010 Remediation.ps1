<#
   Code sourced from here:  https://thecollective.eu/blog/implement-workarounds-for-pinter-nightmare-with-mem/
   Code copyright of THIJS LECOMTE

   Code modified from here :  https://support.microsoft.com/en-us/topic/kb5005010-restricting-installation-of-new-printer-drivers-after-applying-the-july-6-2021-updates-31b91c02-05bc-4ada-a7ea-183b129578a7

   Remediation script for Printnightmare KB5005010


   Code not used but under investigation

#>




$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint"
$RegKey = "RestrictDriverInstallationToAdministrators"
$RegValue = 1

if(!(Test-Path $RegPath -ErrorAction Stop)){
    New-Item $RegPath
    Write-Host "Created path"
}
try{
    Set-ItemProperty -Path $RegPath -Name $RegKey -Value $RegValue
    Write-Host "Key has been set"

    Restart-Service -Name "Spooler" -force
    Write-Host "Spooler has been reset"
}
catch{
    Write-Error "Error setting key"
}