<#
   Code sourced from here:  https://thecollective.eu/blog/implement-workarounds-for-pinter-nightmare-with-mem/
   Code copyright of THIJS LECOMTE

   Code modified from here :  https://support.microsoft.com/en-us/topic/kb5005010-restricting-installation-of-new-printer-drivers-after-applying-the-july-6-2021-updates-31b91c02-05bc-4ada-a7ea-183b129578a7

   Detection script for Printnightmare KB5005010

   Code not used but under investigation.

#>



$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint"
$RegKey = "RestrictDriverInstallationToAdministrators"
$RegValue = 1

try{
    if(!(Test-Path $RegPath -ErrorAction Stop)){
        Write-Host "Path doesn't exist"
        Exit 1
    }
    $key = Get-ItemProperty -Path $RegPath | Select-Object -Property $RegKey -ErrorAction Stop
    if($key."$RegKey" -eq $RegValue){
        Write-Host "Key has correct value" 
        Exit 0
    }
    else{
        Write-Host "Key has incorrect value or doesn't exist"
        Exit 1
    }
}
catch{
    Write-Host "Key doesn't exist"
    Exit 1
}