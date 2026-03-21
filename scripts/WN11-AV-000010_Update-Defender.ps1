<#
.SYNOPSIS
    Enables certificate padding check to mitigate WinVerifyTrust vulnerability.

.NOTES
    Author          : Mark Tuazon
    LinkedIn        : linkedin.com/in/mark-t-83a52b145/
    GitHub          : github.com/MarkCyberOps
    Date Created    : 2026-03-21
    Last Modified   : 2026-03-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : 166555
    STIG-ID         : WN11-SO-000190

.TESTED ON
    Date(s) Tested  : 2026-03-21
    Tested By       : Mark Tuazon
    Systems Tested  : Windows 11 Pro 25H2
    PowerShell Ver. : 5.1

.USAGE
  $path = "HKLM:\Software\Microsoft\Cryptography\Wintrust\Config"
New-Item -Path $path -Force | Out-Null
Set-ItemProperty -Path $path -Name EnableCertPaddingCheck -Value 1 -Type DWord

Write-Output "WinVerifyTrust padding check enabled."
