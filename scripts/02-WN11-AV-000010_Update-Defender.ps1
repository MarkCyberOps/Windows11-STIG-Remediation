<#
.SYNOPSIS
    Ensures Microsoft Defender Antivirus signatures are up to date.

.NOTES
    Author          : Mark Tuazon
    LinkedIn        : linkedin.com/in/mark-t-83a52b145/
    GitHub          : github.com/MarkCyberOps
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.1
    CVEs            : N/A
    Plugin IDs      : 103569
    STIG-ID         : WN11-AV-000010

.TESTED ON
    Systems Tested  : Windows 11 Pro 25H2

.USAGE
    Run with administrative privileges.

    Example:
    PS C:\> .\02-WN11-AV-000010_Update-Defender.ps1
#>

Write-Output "Checking Defender signature status..."

$before = Get-MpComputerStatus
Write-Output "Current Signature Version: $($before.AntivirusSignatureVersion)"
Write-Output "Last Updated: $($before.AntivirusSignatureLastUpdated)"

Write-Output "Attempting to update signatures..."

try {
    Update-MpSignature -ErrorAction Stop
}
catch {
    Write-Output "Standard update failed. Attempting fallback method..."
    & "$env:ProgramFiles\Windows Defender\MpCmdRun.exe" -SignatureUpdate
}

Start-Sleep -Seconds 5

$after = Get-MpComputerStatus
Write-Output "Updated Signature Version: $($after.AntivirusSignatureVersion)"
Write-Output "Last Updated: $($after.AntivirusSignatureLastUpdated)"
