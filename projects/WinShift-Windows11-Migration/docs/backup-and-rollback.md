# Backup, Recovery & Rollback Checklist

The following is a **controlled-process template**, not a backup script.

## Before change

- [ ] Inventory the device, business applications, instrument settings and dependencies.
- [ ] Obtain written approval from the user, system owner and change authority.
- [ ] Determine which local data, certificates and configurations may lawfully be backed up.
- [ ] Use the enterprise's approved backup tooling and secure storage.
- [ ] Verify backup completion, integrity and accessibility.
- [ ] Test representative restoration or document an already validated recovery procedure.
- [ ] Identify replacement device, install media, necessary drivers and licensing.
- [ ] Record rollback owner, trigger thresholds and restore-time expectations.

## Recovery triggers

Initiate a stop/rollback decision if a critical laboratory instrument stops communicating, a licensed business application fails, endpoint security is noncompliant, essential user data is missing, or an authorized acceptance owner rejects the new workstation.

## Recovery options

1. **Replacement cutover:** Reconnect retained legacy workstation if safe and explicitly approved.
2. **Image-based recovery:** Restore the verified baseline via approved enterprise recovery media.
3. **Configuration restore:** Use approved captured settings after application-owner validation.

Do not assume Windows Update's uninstall option will undo all upgrades, drivers, or application changes.

## After rollback

Document incident ID, decision maker, timestamps, observed issue, restored functionality, remaining risk, stakeholder communication and next pilot date. Store production evidence in enterprise-managed systems—not a public GitHub repository.
