# Escalation Matrix

| Issue | First-line analysis | Escalate to | Required evidence |
|---|---|---|---|
| Windows 11 unsupported CPU / TPM | Hardware inventory, firmware checks | Endpoint engineering / hardware vendor | Model, CPU, TPM and BIOS revision |
| Laboratory application fails | Application logs, supported version check | Application owner / software vendor | Version, error text, test steps |
| Instrument communication fails | Approved cables, interface and driver review | Instrument owner / OEM | Interface settings, device status, driver version |
| Domain or security policy failure | Network and identity checks | AD / Entra / security teams | Error message, timestamps, endpoint policy status |
| DNS, DHCP or file-share failure | IP configuration and name resolution | Network / infrastructure team | Sanitized IP/DNS output and test results |
| Missing or inaccessible data | Stop deployment, verify backup status | Backup/recovery owner and change manager | Backup job ID, permitted restore logs |
| Change window exceeded | Stop/rollback assessment | Change manager / business owner | Timeline, risks, rollback estimate |

Protect employee and instrument details in escalation notes. Record decisions and owner acknowledgment.
