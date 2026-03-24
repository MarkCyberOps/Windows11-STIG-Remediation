<#
.SYNOPSIS
    Disables Print Spooler service.

.NOTES
    Author          : Mark Tuazon
    LinkedIn        : linkedin.com/in/mark-t-83a52b145/
    GitHub          : github.com/MarkCyberOps
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : 151440
    STIG-ID         : WN11-00-000350

.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : Mark Tuazon
    Systems Tested  : Windows 11 Pro 25H2
    PowerShell Ver. : 5.1

.USAGE
    Run with administrative privileges.
   Example:
    PS C:\> .\07-WN11-00-000350_Disable-Spooler.ps1
#>

Write-Output "Checking Print Spooler service..."

$service = Get-Service -Name Spooler

Write-Output "Current Status: $($service.Status)"
Write-Output "Startup Type: $((Get-WmiObject -Class Win32_Service -Filter "Name='Spooler'").StartMode)"

Write-Output "Applying remediation..."

# Stop service
if ($service.Status -ne "Stopped") {
    Stop-Service -Name Spooler -Force
}

# Disable service
Set-Service -Name Spooler -StartupType Disabled

Start-Sleep -Seconds 2

Write-Output "Validating service status..."

$updated = Get-Service -Name Spooler

Write-Output "Updated Status: $($updated.Status)"
Write-Output "Updated Startup Type: $((Get-WmiObject -Class Win32_Service -Filter "Name='Spooler'").StartMode)"

if ($updated.Status -eq "Stopped") {
    Write-Output "STIG remediation successful."
} else {
    Write-Output "Remediation failed."
}
