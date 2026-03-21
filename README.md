# Windows 11 STIG Remediation Lab

## Overview

This repository demonstrates a vulnerability-driven remediation workflow using PowerShell to enforce DISA STIG compliance on Windows 11 systems. Findings were identified through credentialed Tenable scans, remediated using scripted controls, and validated through post-remediation scans.

The project simulates real-world vulnerability management practices, focusing on detection, remediation, and validation.

---

## Objectives

* Perform credentialed vulnerability scans using Tenable
* Map findings to Windows 11 STIG controls
* Automate remediation using PowerShell
* Validate fixes through re-scanning
* Demonstrate system hardening techniques

---

## Lab Environment

* **OS:** Windows 11 Pro (25H2, x64 Gen2 VM)
* **Scanner:** Tenable Vulnerability Management
* **Access:** Credentialed scan (Local Administrator)
* **Protocols:** SMB, WMI, WinRM

---

## Remediation Methodology

1. **Initial Scan**
   Conducted a credentialed Tenable scan to establish baseline vulnerabilities.

2. **Analysis & Mapping**
   Findings were mapped to official Windows 11 STIG IDs.

3. **Remediation**
   PowerShell scripts were developed and executed to enforce compliance.

4. **Validation**
   A follow-up scan confirmed remediation effectiveness.

---

## Remediation Order

The following order was used to ensure system stability and dependency awareness:

1. Firewall configuration
2. Microsoft Defender health
3. System integrity controls
4. Cryptographic hardening
5. Network hardening
6. Service reduction
7. Account and authentication policies

---

## Implemented STIG Controls

| Order | STIG ID        | Description                  | Plugin ID |
| ----- | -------------- | ---------------------------- | --------- |
| 1     | WN11-00-000135 | Enable Windows Firewall      | N/A       |
| 2     | WN11-AV-000010 | Update Defender signatures   | 103569    |
| 3     | WN11-SO-000190 | WinVerifyTrust padding check | 166555    |
| 4     | WN11-SO-000025 | Disable TLS 1.0              | 104743    |
| 5     | WN11-SO-000030 | Disable TLS 1.1              | 157288    |
| 6     | WN11-00-000200 | Disable LLMNR                | 160301    |
| 7     | WN11-00-000350 | Disable Print Spooler        | 151440    |
| 8     | WN11-00-000065 | Disable Guest Account        | N/A       |
| 9     | WN11-AC-000030 | Password Policy (Max Age)    | 17651     |
| 10    | WN11-AC-000040 | Account Lockout Policy       | 17651     |

---

## Repository Structure

```text
scripts/      -> PowerShell remediation scripts (ordered execution)
evidence/     -> Screenshots and validation artifacts
README.md     -> Project documentation

Windows11-STIG-Remediation/
│
├── scripts/
│   ├── 01-WN11-00-000135_Enable-Firewall.ps1
│   ├── 02-WN11-AV-000010_Update-Defender.ps1
│   ├── 03-WN11-SO-000190_WinVerifyTrust.ps1
│   ├── 04-WN11-SO-000025_Disable-TLS1.0.ps1
│   ├── 05-WN11-SO-000030_Disable-TLS1.1.ps1
│   ├── 06-WN11-00-000200_Disable-LLMNR.ps1
│   ├── 07-WN11-00-000350_Disable-Spooler.ps1
│   ├── 08-WN11-00-000065_Disable-Guest.ps1
│   ├── 09-WN11-AC-000030_PasswordMaxAge.ps1
│   ├── 10-WN11-AC-000040_AccountLockout.ps1
│
├── evidence/
│   ├── 01-initial-scan/
│   ├── 02-findings/
│   ├── 03-remediation/
│   ├── 04-validation-scan/
│   ├── 05-after-findings/
│   └── README.md
│
└── README.md
```

---

## Evidence Structure

The `/evidence` directory is organized by remediation phase:

```text
01-initial-scan      -> Baseline scan results (dashboard view)
02-findings          -> Individual STIG findings (before)
03-remediation       -> Script execution evidence
04-validation-scan   -> Post-remediation scan summary
05-after-findings    -> Verified fixes per STIG
```

---

## How to Use

1. Clone the repository:

```
git clone https://github.com/MarkCyberOps/Windows11-STIG-Remediation.git
```

2. Navigate to scripts:

```
cd scripts
```

3. Run scripts in order (Administrator required):

```
.\01-WN11-00-000135_Enable-Firewall.ps1
.\02-WN11-AV-000010_Update-Defender.ps1
...
```

4. Re-run Tenable scan to validate remediation.

---

## Before and After Results

Initial scan identified multiple high and medium severity findings.
After remediation:

* High vulnerabilities reduced to zero
* Medium vulnerabilities reduced to zero
* System aligned with STIG baseline

Detailed evidence is available in the `/evidence` directory.

---

## Key Takeaways

* Credentialed scans provide deep configuration visibility
* Not all issues are automatically flagged; manual validation is required
* Automation improves consistency and repeatability
* Structured remediation reduces attack surface effectively

---

## Future Improvements

* Centralized execution script
* Logging and reporting enhancements
* Expanded STIG coverage
* Domain/GPO integration

---

## Author

Mark Tuazon

LinkedIn: https://linkedin.com/in/mark-t-83a52b145/

GitHub: https://github.com/MarkCyberOps

---

## Disclaimer

This project is for educational and lab purposes only.
Test all scripts in a non-production environment before deployment.
