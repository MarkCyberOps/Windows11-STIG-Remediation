# Windows 11 STIG Remediation Lab

## Overview

This repository contains PowerShell scripts designed to remediate Security Technical Implementation Guide (STIG) findings on Windows 11 systems. The project demonstrates a vulnerability-driven remediation workflow using credentialed Tenable scans to identify misconfigurations and apply secure configuration changes aligned with DISA STIG requirements.

The goal of this lab is to simulate real-world vulnerability management by identifying, remediating, and validating security findings in a controlled environment.

---

## Objectives

* Perform credentialed vulnerability scans using Tenable
* Map findings to official Windows 11 STIG IDs
* Develop PowerShell scripts to remediate misconfigurations
* Validate remediation through re-scanning
* Demonstrate secure system hardening practices

---

## Lab Environment

* **Operating System:** Windows 11 Pro (25H2, x64 Gen2 VM)
* **Scanner:** Tenable Vulnerability Management
* **Access:** Credentialed scan using local administrator account
* **Protocols Used:** SMB, WMI, WinRM

---

## Methodology

### 1. Initial Scan (Baseline)

A credentialed Tenable scan was executed to identify vulnerabilities and configuration issues within the Windows 11 virtual machine.

### 2. Analysis

Scan results were reviewed and mapped to corresponding Windows 11 STIG controls. Only findings with valid STIG mappings were selected for remediation.

### 3. Remediation

PowerShell scripts were developed to enforce STIG-compliant configurations. Each script includes:

* Check (current state)
* Remediation action
* Validation step

### 4. Validation

A follow-up Tenable scan was performed to confirm that findings were successfully remediated.

---

## STIG Remediations Implemented

| STIG ID        | Description                                      | Plugin ID |
| -------------- | ------------------------------------------------ | --------- |
| WN11-AV-000010 | Microsoft Defender signatures must be up to date | 103569    |
| WN11-SO-000190 | Enable WinVerifyTrust certificate padding check  | 166555    |
| WN11-SO-000025 | Disable TLS 1.0                                  | 104743    |
| WN11-SO-000030 | Disable TLS 1.1                                  | 157288    |
| WN11-00-000350 | Disable Print Spooler service                    | 151440    |
| WN11-00-000200 | Disable LLMNR                                    | 160301    |
| WN11-AC-000030 | Enforce maximum password age                     | 17651     |
| WN11-AC-000040 | Configure account lockout policy                 | 17651     |
| WN11-00-000065 | Disable Guest account                            | N/A       |
| WN11-00-000135 | Enable Windows Firewall                          | N/A       |

---

## Repository Structure

```
Windows11-STIG-Remediation/
│
├── scripts/
│   ├── WN11-AV-000010_Update-Defender.ps1
│   ├── WN11-SO-000190_WinVerifyTrust.ps1
│   ├── WN11-SO-000025_Disable-TLS1.0.ps1
│   ├── WN11-SO-000030_Disable-TLS1.1.ps1
│   ├── WN11-00-000350_Disable-Spooler.ps1
│   ├── WN11-00-000200_Disable-LLMNR.ps1
│   ├── WN11-AC-000030_PasswordMaxAge.ps1
│   ├── WN11-AC-000040_AccountLockout.ps1
│   ├── WN11-00-000065_Disable-Guest.ps1
│   ├── WN11-00-000135_Enable-Firewall.ps1
│
└── README.md
```

---

## How to Use

1. Clone the repository:

```
git clone https://github.com/MarkCyberOps/Windows11-STIG-Remediation.git
```

2. Navigate to the scripts directory:

```
cd Windows11-STIG-Remediation/scripts
```

3. Run a script (Administrator required):

```
.\WN11-AV-000010_Update-Defender.ps1
```

4. Re-run your Tenable scan to validate remediation.

---

## Key Takeaways

* Credentialed scans provide deep visibility into system configurations
* Not all findings are explicitly flagged as vulnerabilities; some require manual validation
* Automating remediation improves consistency and efficiency
* STIG compliance strengthens system security posture and reduces attack surface

---

## Future Improvements

* Add centralized execution script to run all remediations
* Integrate logging and reporting
* Expand coverage to additional STIG controls
* Adapt scripts for domain environments using Group Policy

---

## Author

**Mark Tuazon**
LinkedIn: https://linkedin.com/in/mark-t-83a52b145/
GitHub: https://github.com/MarkCyberOps

---

## Disclaimer

This project is for educational and lab purposes only. Always test remediation scripts in a non-production environment before applying them to live systems.
