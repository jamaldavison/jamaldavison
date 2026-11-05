# Project WinShift — Windows 11 Enterprise Migration & Endpoint Readiness

**Portfolio simulation by Jamal Davison | Desktop Engineering | PowerShell | Windows 10/11 | Change Management**

> This is a fictional 150-endpoint enterprise case study with synthetic examples. It is **not** a claim that 150 production devices were migrated. Scripts are assessment aids for authorized test systems only.

## Business scenario

A fictional organization operates 150 Windows 10 computers across offices, shared spaces, and laboratories. Some systems control specialized instruments. The organization needs a controlled Windows 11 migration that protects business continuity, preserves application and instrument compatibility, and provides traceable evidence of testing and approvals.

## Workstreams

1. **Discover:** Inventory model, serial, OS, RAM, storage, CPU, TPM, firmware, installed software and peripherals.
2. **Assess:** Flag hardware gaps, unsupported applications, driver concerns, licensing and vendor dependencies.
3. **Decide:** Categorize each endpoint as upgrade candidate, replacement candidate or blocked pending verification.
4. **Prepare:** Validate backup and recovery, approve change records, confirm replacement workstation specifications.
5. **Deploy:** Build a standard Windows 11 workstation, enroll it in approved management and domain controls, restore permitted configurations.
6. **Validate:** Test DNS, network shares, instruments, printing, services, permissions and business applications.
7. **Close:** Collect acceptance evidence, update the inventory and document escalation or rollback.

## Deliverables

- `scripts/Get-WorkstationInventory.ps1`: local inventory collection
- `scripts/Test-Windows11Readiness.ps1`: conservative minimum-hardware precheck
- `scripts/Test-PostMigration.ps1`: DNS, network and OS validation
- `docs/assessment-and-decision-matrix.md`: disposition and vendor blockers
- `docs/implementation-runbook.md`: preparation, cutover, acceptance and rollback
- `data/sample-workstations.csv`: synthetic portfolio assets

## Read-only local workflow

Run only on your own authorized Windows test computer using Windows PowerShell 5.1 or PowerShell 7:

```powershell
.\scripts\Get-WorkstationInventory.ps1 -OutputPath .\inventory.json
.\scripts\Test-Windows11Readiness.ps1 -InventoryPath .\inventory.json -OutputPath .\readiness.json
.\scripts\Test-PostMigration.ps1 -DnsName example.com -OutputPath .\validation.json
```

The readiness utility is **not** a Microsoft PC Health Check substitute; the supported CPU list, Secure Boot, graphics drivers, application/vendor support and business approval require separate verification. All sample data is fictional.

## Decision gates

| Gate | Required evidence | Failure route |
|---|---|---|
| Hardware | CPU supported, TPM 2.0, UEFI, memory, storage, graphics and firmware checks | Replace or remediate |
| Software | Application owner / vendor confirms Windows 11-supported version and licensing | Hold and escalate |
| Instruments | Approved driver, interface and instrument-control validation | Hold laboratory cutover |
| Recovery | Backup success and documented restore/rollback procedure | No-go |
| Change | Approved ticket, owner, schedule and communication | No-go |
| Acceptance | OS, network, business apps, permissions, device communication validated | Rollback or incident |

## Interview narrative

"I built a Windows 11 migration-readiness simulation that combines PowerShell inventory and hardware screening with application compatibility, change approval, recovery planning and post-cutover testing. The key decision is knowing when an endpoint is technically ready and when application or laboratory dependencies make an upgrade unsafe."

## Privacy and safety

Never commit real workstation serial numbers, employee names, credentials, recovery keys or production application configuration. Test scripts in an isolated lab before enterprise use. This project is a portfolio demonstration, not a production-approved deployment package.
