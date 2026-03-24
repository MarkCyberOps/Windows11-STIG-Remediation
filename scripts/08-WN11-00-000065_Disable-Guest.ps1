<#
.SYNOPSIS
    Disables Guest account.

.NOTES
    Author          : Mark Tuazon
    LinkedIn        : linkedin.com/in/mark-t-83a52b145/
    GitHub          : github.com/MarkCyberOps
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000065

.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : Mark Tuazon
    Systems Tested  : Windows 11 Pro 25H2
    PowerShell Ver. : 5.1

.USAGE
    Run with administrative privileges.
    Example:
    PS C:\> .\08-WN11-00-000065_Disable-Guest.ps1
#>

Write-Output "Checking Guest account status..."

$user = Get-LocalUser -Name "Guest"

Write-Output "Guest account enabled: $($user.Enabled)"

if ($user.Enabled -eq $true) {
    Write-Output "Disabling Guest account..."
    Disable-LocalUser -Name "Guest"
} else {
    Write-Output "Guest account already disabled."
}

Start-Sleep -Seconds 2

Write-Output "Validating..."

$userCheck = Get-LocalUser -Name "Guest"
Write-Output "Guest account enabled: $($userCheck.Enabled)"

if ($userCheck.Enabled -eq $false) {
    Write-Output "STIG remediation successful."
} else {
    Write-Output "Remediation failed."
}
