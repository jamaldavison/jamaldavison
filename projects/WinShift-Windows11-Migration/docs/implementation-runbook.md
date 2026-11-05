# Controlled Windows 11 Deployment Runbook (Portfolio Simulation)

## Prerequisites (go/no-go)

- Approved change record: affected device, owner, schedule, impact, contacts and business sign-off.
- Complete sanitized asset assessment; hardware/driver readiness independently verified.
- Application and laboratory instrument compatibility confirmed by authorized owners/vendors.
- Approved, successful backup and a **tested** restoration route.
- Available replacement system and approved Windows 11 enterprise image / management configuration.
- Rollback trigger, decision authority and recovery time window documented.

## Preparation

1. Confirm user and lab operator availability, device identity and impact window.
2. Record approved application list, version, licenses, interfaces, COM/network configuration and required files.
3. Verify backup success and recovery media; **never store passwords or recovery keys in the repo**.
4. Export only approved user/application configurations via authorized procedures.
5. Confirm change board approval and stakeholders notified.

## Execution

1. Stop dependent applications and instruments according to vendor procedure.
2. Perform approved upgrade or replace device with a standards-compliant Windows 11 build.
3. Join the approved enterprise domain / Entra management as prescribed by policy.
4. Apply approved security configuration, endpoint management, OS updates and encryption policies.
5. Install supported packages and correct instrument drivers using vendor-approved instructions.
6. Restore approved data and configurations; validate license activation and interface mappings.

## Acceptance tests

- Windows 11 version, patch compliance and endpoint protection status
- Domain/identity logon and least-privilege permissions
- DNS, DHCP, application servers, printers, mapped network shares
- Critical business and laboratory software launch and workflow
- Instrument communication, data capture, serial/USB/Ethernet mapping
- User/owner sign-off with recorded evidence

## Rollback / escalation

If a critical instrument, security control or business workflow fails, stop the cutover. Notify change owner and lab/application owner; restore the approved prior state using the tested procedure or revert to the retained workstation. Record downtime, incident, root cause, next action and final sign-off. Never assume an in-place OS downgrade is safe or possible without a separately tested rollback plan.

## Closeout

Update asset inventory, attach sanitized validation evidence, log exceptions and owners, and close the change only after authorization.
