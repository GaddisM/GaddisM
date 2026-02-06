 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Gaddis Munezero
    LinkedIn        : linkedin.com/in/m-gaddis/
    GitHub          : github.com/GaddisM
    Date Created    : 2026-02-06
    Last Modified   : 2026-02-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-AU-000500).ps1 
#>

#  CODE ARE HERE
# Define registry path and values
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$ValueName = "MaxSize"
$ValueData = 0x00008000  # 32768 KB (32 MB)
$ValueType = "DWord"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the MaxSize DWORD value
New-ItemProperty `
    -Path $RegPath `
    -Name $ValueName `
    -Value $ValueData `
    -PropertyType $ValueType `
    -Force | Out-Null

Write-Output "Application Event Log MaxSize has been set to 32768 KB."
 
