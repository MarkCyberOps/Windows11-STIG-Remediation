<#
.SYNOPSIS
    Ensures Windows Firewall is enabled on all profiles (Domain, Private, Public).

.NOTES
    Author          : Mark Tuazon
    LinkedIn        : linkedin.com/in/mark-t-83a52b145/
    GitHub          : github.com/MarkCyberOps
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000135

.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : Mark Tuazon
    Systems Tested  : Windows 11 Pro 25H2
    PowerShell Ver. : 5.1

.USAGE
    Run with administrative privileges.

    Example:
    PS C:\> .\01-WN11-00-000135_Enable-Firewall.ps1

    Workflow:
    1. Run initial Tenable credentialed scan.
    2. Execute this script to enforce firewall configuration.
    3. Re-run scan to validate remediation.
#>

# =========================
# 🔍 CHECK
# =========================
Write-Output "Checking Windows Firewall status..."

$profiles = Get-NetFirewallProfile

$profiles | Select Name, Enabled

# =========================
# 🛠️ REMEDIATION
# =========================
if ($profiles.Enabled -contains $false) {
    Write-Output "Remediating: Enabling Windows Firewall on all profiles..."

    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
}
else {
    Write-Output "No remediation required. Firewall already enabled on all profiles."
}

# =========================
# ✅ VALIDATION
# =========================
Write-Output "Validating firewall status..."

$updatedProfiles = Get-NetFirewallProfile
$updatedProfiles | Select Name, Enabled

if ($updatedProfiles.Enabled -notcontains $false) {
    Write-Output "STIG remediation successful: Firewall is enabled on all profiles."
}
else {
    Write-Output "Remediation failed: One or more profiles are still disabled."
}
