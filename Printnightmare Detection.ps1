﻿<#
   Code sourced from here:  https://thecollective.eu/blog/implement-workarounds-for-pinter-nightmare-with-mem/
   Code copyright of THIJS LECOMTE

   Detection script for Printnightmare

   Code not used as Microsoft issued patch (thats not complete)

#>



$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\"
$RegKey = "RegisterSpoolerRemoteRpcEndPoint"
$RegValue = 2

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