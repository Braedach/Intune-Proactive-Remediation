<#
   Code sourced from here:  https://thecollective.eu/blog/implement-workarounds-for-pinter-nightmare-with-mem/
   Code copyright of THIJS LECOMTE

   Remediation script for Printnightmare

   Code not used as Microsoft issued patch (thats not complete)

#>




$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\"
$RegKey = "RegisterSpoolerRemoteRpcEndPoint"
$RegValue = 2

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