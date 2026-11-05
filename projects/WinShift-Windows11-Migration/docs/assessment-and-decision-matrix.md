# Endpoint Assessment & Decision Matrix

This is a **fictional exercise**, not a production inventory.

| Asset | Hardware screening | Application/vendor status | Instrument dependency | Proposed disposition |
|---|---|---|---|---|
| WS-001 | Meets minimum precheck | Approved | None | Upgrade candidate after pilot |
| WS-002 | Unsupported processor | Approved | None | Replacement candidate |
| LAB-003 | Meets minimum precheck | Vendor approval pending | USB serial controller | Blocked — vendor test |
| LAB-004 | Meets minimum precheck | Legacy 32-bit driver unverified | Instrument control software | Blocked — compatibility |
| WS-005 | TPM missing | Approved | None | Replacement / remediation review |

## Rules

- A passing minimum-hardware precheck is **not** production upgrade approval.
- Verify supported CPUs, Secure Boot capability, DirectX/WDDM, disk/system partition layout and application support.
- Confirm attached devices, COM port settings, USB drivers, printer queues, instrument certificates and network permissions where applicable.
- No laboratory cutover until relevant application owner and instrument vendor approve.
- Track evidence link, owner, last check date, decision, remediation, rollback owner and final sign-off per endpoint.
