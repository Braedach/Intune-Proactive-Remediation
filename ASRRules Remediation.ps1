<#
   This is a trial remediation script to determine errors in ASR and correct them
   There is a simple detection script that is attached
   This script is to be placed in the Proactive Remediation of MEM.

   Note that the Microsoft Group Policy remediation caught an initial failure but this needs
   to be tested with time

   Created 02-07-2021


#>

#SET VARIABLES




#ACTUAL CODE

try
    {
    Get-ScheduledTask | ? {$_.TaskName -eq ‘PushLaunch’} | Start-ScheduledTask
    exit 0
    }
catch
    {
    Write-Error "Impossible Error"
    }
