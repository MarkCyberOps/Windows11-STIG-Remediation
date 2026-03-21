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
#>

$path = "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient"

New-Item -Path $path -Force | Out-Null
Set-ItemProperty -Path $path -Name EnableMulticast -Value 0 -Type DWord

Write-Output "LLMNR disabled."
