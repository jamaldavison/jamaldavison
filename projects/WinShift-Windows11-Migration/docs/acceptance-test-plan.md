# Windows 11 Workstation Acceptance Tests

| ID | Test | Expected result | Evidence owner |
|---|---|---|---|
| AT-01 | Confirm Windows 11 build and patch level | Approved OS baseline | Endpoint engineer |
| AT-02 | Check domain/Entra sign-in | Authorized user signs in | IAM / desktop |
| AT-03 | Validate encryption and endpoint protection | Meets enterprise policy | Security |
| AT-04 | DNS and DHCP configuration | Expected scope and name resolution | Network |
| AT-05 | Validate network shares and permissions | Approved resources available | Infrastructure |
| AT-06 | Run business application launch/workflow | Application owner accepts | App owner |
| AT-07 | Test instrument interface communications | Device operates to vendor acceptance criteria | Lab owner / vendor |
| AT-08 | Test printers and peripherals | Approved functions work | Desktop engineer |
| AT-09 | Confirm approved data and configuration migration | Required content available | User / app owner |
| AT-10 | Confirm backup and rollback evidence | Verified recovery provisions | Change manager |

**Pass criteria:** Every critical test has a completed, signed result. Any failed critical test triggers a go/no-go decision and documented rollback or escalation. No sample results in this repository are actual production evidence.
