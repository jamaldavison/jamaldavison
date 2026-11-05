# Manual Test Cases for the Portfolio Lab

These tests require an authorized Windows workstation or isolated VM. They are **not yet recorded as executed**.

## Test A — Inventory output

1. Run `Get-WorkstationInventory.ps1 -OutputPath .\inventory.json`.
2. Verify valid JSON, OS and model information, and that incomplete CIM/WMI fields show as missing rather than guessed.
3. Verify the output contains no credentials.
4. Redact identifiers before publishing any demonstration evidence.

## Test B — Windows 11 precheck

1. Run `Test-Windows11Readiness.ps1 -InventoryPath .\inventory.json -OutputPath .\readiness.json`.
2. Inspect RAM, disk, firmware and TPM checks.
3. Confirm CPU, Secure Boot, graphics and application/vendor compatibility remain manual review items.
4. Confirm `ProductionApproved` stays `false` even if preliminary hardware checks pass.

## Test C — Post-migration smoke test

1. Supply an authorized DNS target and, optionally, an approved share path.
2. Verify DNS success/failure reporting without changing system configuration.
3. Confirm instrument and business application tests remain manual review items.
4. Preserve results only in an approved private evidence location.

## Test D — Laboratory blocker

1. Use the synthetic `LAB-003` row in the sample dataset.
2. Record vendor approval as pending.
3. Confirm the disposition is blocked until instrument driver and communications testing complete.

## Test E — Recovery decision

1. Simulate a failed instrument acceptance test using a tabletop exercise.
2. Document who can authorize rollback.
3. Explain the approved rollback method, communications and closeout without modifying a production machine.
