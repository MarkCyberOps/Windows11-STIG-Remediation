<#
.SYNOPSIS
    Disables LLMNR.

.NOTES
    Author          : Mark Tuazon
    LinkedIn        : linkedin.com/in/mark-t-83a52b145/
    GitHub          : github.com/MarkCyberOps
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : 160301
    STIG-ID         : WN11-00-000200

.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : Mark Tuazon
    Systems Tested  : Windows 11 Pro 25H2
    PowerShell Ver. : 5.1

.USAGE
    Run with administrative privileges.

    Example:
    PS C:\> .\06-WN11-00-000200_Disable-LLMNR.ps1
#>

$path = "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient"

Write-Output "Checking LLMNR configuration..."

$current = Get-ItemProperty -Path $path -Name EnableMulticast -ErrorAction SilentlyContinue

if ($null -eq $current) {
    Write-Output "LLMNR setting not configured (non-compliant)."
} else {
    Write-Output "Current EnableMulticast value: $($current.EnableMulticast)"
}

Write-Output "Applying remediation..."

New-Item -Path $path -Force | Out-Null
Set-ItemProperty -Path $path -Name EnableMulticast -Value 0 -Type DWord

Start-Sleep -Seconds 2

Write-Output "Validating configuration..."

$new = Get-ItemProperty -Path $path -Name EnableMulticast
Write-Output "Updated EnableMulticast value: $($new.EnableMulticast)"

if ($new.EnableMulticast -eq 0) {
    Write-Output "STIG remediation successful."
} else {
    Write-Output "Remediation failed."
}
