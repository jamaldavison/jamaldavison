# Conservative Windows 11 precheck. Does not approve a production migration.
[CmdletBinding()]
param([Parameter(Mandatory)][string]$InventoryPath,[string]$OutputPath = '.\readiness.json')
$ErrorActionPreference = 'Stop'
$d = Get-Content -LiteralPath $InventoryPath -Raw | ConvertFrom-Json
$checks = @()
function Add-Check($Name,$Result,$Detail) {
  $script:checks += [pscustomobject]@{ Check=$Name; Result=$Result; Detail=$Detail }
}
if ($null -eq $d.RAMBytes) { Add-Check 'RAM >= 4 GB' 'Unknown' 'RAM unavailable' }
elseif ([double]$d.RAMBytes -ge 4GB) { Add-Check 'RAM >= 4 GB' 'Pass' 'Minimum memory met' }
else { Add-Check 'RAM >= 4 GB' 'Fail' 'Below minimum memory' }
$disk = @($d.Disks | Where-Object { $null -ne $_.Size -and [double]$_.Size -ge 64GB })
if (@($d.Disks).Count -eq 0) { Add-Check 'Storage >= 64 GB' 'Unknown' 'No fixed disk data' }
elseif ($disk.Count -gt 0) { Add-Check 'Storage >= 64 GB' 'Pass' 'At least one fixed volume meets capacity; verify actual system disk' }
else { Add-Check 'Storage >= 64 GB' 'Fail' 'No inventoried fixed volume meets minimum' }
if ($null -eq $d.FirmwareTypeCode) { Add-Check 'UEFI firmware' 'Unknown' 'Firmware information missing' }
elseif ([int]$d.FirmwareTypeCode -eq 2) { Add-Check 'UEFI firmware' 'Pass' 'UEFI detected' }
else { Add-Check 'UEFI firmware' 'Fail' 'Legacy firmware detected' }
if ($null -eq $d.TPMPresent) { Add-Check 'TPM 2.0' 'Unknown' 'TPM information missing' }
elseif (-not $d.TPMPresent) { Add-Check 'TPM 2.0' 'Fail' 'TPM not present' }
elseif ([string]$d.TPMSpecVersion -match '(^|,\s*)2\.0') { Add-Check 'TPM 2.0' 'Pass' 'TPM 2.0 reported' }
else { Add-Check 'TPM 2.0' 'Fail' 'TPM version unconfirmed' }
Add-Check 'Supported CPU' 'ManualReview' 'Compare exact model against current Microsoft-supported processors'
Add-Check 'Secure Boot / graphics / drivers' 'ManualReview' 'Validate firmware capability and supported display driver'
Add-Check 'Applications / instruments / vendors' 'ManualReview' 'Require documented vendor and owner sign-off'
$fails = @($checks | Where-Object Result -eq 'Fail').Count
$status = if ($fails -gt 0) { 'RemediateOrReplace' } else { 'PendingManualAndVendorValidation' }
$result = [pscustomobject]@{ ComputerName=$d.ComputerName; Decision=$status; Checks=$checks; ProductionApproved=$false }
$result | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $OutputPath -Encoding UTF8
$result | Format-List ComputerName,Decision,ProductionApproved
$checks | Format-Table -AutoSize
