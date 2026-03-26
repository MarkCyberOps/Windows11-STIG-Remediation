<#
.SYNOPSIS
    Configures account lockout policy.
    
.NOTES
    Author          : Mark Tuazon
    LinkedIn        : linkedin.com/in/mark-t-83a52b145/
    GitHub          : github.com/MarkCyberOps
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : 17651
    STIG-ID         : WN11-AC-000040
    
.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : Mark Tuazon
    Systems Tested  : Windows 11 Pro 25H2
    PowerShell Ver. : 5.1

.USAGE
    Run with administrative privileges.

    Example:
    PS C:\> .\10-WN11-AC-000040_AccountLockout.ps1
#>

Write-Output "Checking current account lockout policy..."

net accounts

Write-Output "Applying remediation..."

net accounts /lockoutthreshold:3
net accounts /lockoutduration:15
net accounts /lockoutwindow:15

Start-Sleep -Seconds 2

Write-Output "Validating updated policy..."

net accounts
