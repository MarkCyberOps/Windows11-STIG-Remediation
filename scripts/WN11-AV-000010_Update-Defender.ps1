<#
.SYNOPSIS
    Ensures Microsoft Defender Antivirus signatures are up to date.

.NOTES
    Author          : Mark Tuazon
    LinkedIn        : linkedin.com/in/mark-t-83a52b145/
    GitHub          : github.com/MarkCyberOps
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : 103569
    STIG-ID         : WN11-AV-000010

.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : Mark Tuazon
    Systems Tested  : Windows 11 Pro 25H2
    PowerShell Ver. : 5.1

.USAGE
    PS C:\> .\WN11-AV-000010_Update-Defender.ps1
#>

Write-Output "Updating Microsoft Defender signatures..."
Update-MpSignature
Write-Output "Update complete."
