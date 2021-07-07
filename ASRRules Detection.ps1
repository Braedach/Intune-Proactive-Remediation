<#
   This is a trial detection script to determine errors in ASR and correct them
   There is a simple remediation script that is attached
   This script is to be placed in the Proactive Remediation of MEM.
   Created 02-07-2021


#>

#SET VARIABLES

$regpath = "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager"
$ASRSetting =  "01443614-cd74-433a-b99e-2ecdc07bfc25=1|26190899-1602-49e8-8b27-eb1d0a1ce869=1|3b576869-a4ec-4529-8536-b80a7769e899=1|
                5beb7efe-fd9a-4556-801d-275e5ffc04cc=1|75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84=1|7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c=1|
                92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b=1|9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2=1|b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4=1|
                be9ba2d9-53ea-4cdc-84e5-9b1eeee46550=1|c1db55ab-c21a-4637-bb3f-a12568109d35=1|d1e49aac-8f56-4280-b9ba-993a6d77406c=1|
                d3e037e1-3eb8-44c8-a917-57927947596d=1|d4f940ab-401b-4efc-aadc-ad5f3c50688a=1|e6db77e5-3df2-4cf1-b95a-636979351e5b=1"
$ASRSettingActual = Get-ItemPropertyValue -Path $regpath -Name 'ASRRules'

#DEBUG VARIABLES

Write-Output $regpath
Write-Output $ASRSetting
Write-Output $ASRSettingActual


If ($ASRSetting = $ASRSettingActual)
    {
    Write-Output "String does match"
    #Write-Output $ASRSettingActual
    exit 0
    }
else
    {
    Write-Output "String doesnt match"
    #Write-Output $ASRSettingActual
    exit 1
    }
