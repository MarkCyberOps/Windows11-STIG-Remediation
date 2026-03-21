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
    Run with administrative privileges.

    Example:
    PS C:\> .\WN11-AV-000010_Update-Defender.ps1

    Workflow:
    1. Run initial Tenable credentialed scan.
    2. Execute this script.
    3. Re-run scan to confirm remediation.
#>

# CHECK
$status = Get-MpComputerStatus
Write-Output "Antivirus Signature Version: $($status.AntivirusSignatureVersion)"

# REMEDIATION
Update-MpSignature

# VALIDATION
$status2 = Get-MpComputerStatus
Write-Output "Updated Signature Version: $($status2.AntivirusSignatureVersion)"
