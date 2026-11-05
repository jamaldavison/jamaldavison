# Read-only smoke tests; not a substitute for business application acceptance.
[CmdletBinding()]
param([string]$DnsName='example.com',[string]$SharePath,[string]$OutputPath='.\validation.json')
$checks = @()
function Add-Result($Name,$Status,$Detail) {
  $script:checks += [pscustomobject]@{ Test=$Name; Status=$Status; Detail=$Detail }
}
try {
  $os = Get-CimInstance Win32_OperatingSystem -ErrorAction Stop
  Add-Result 'Operating system' 'Observed' "$($os.Caption) build $($os.BuildNumber)"
} catch { Add-Result 'Operating system' 'Unknown' $_.Exception.Message }
try {
  $addresses = @(Resolve-DnsName -Name $DnsName -ErrorAction Stop | Where-Object IPAddress | Select-Object -ExpandProperty IPAddress)
  if ($addresses.Count -gt 0) { Add-Result 'DNS resolution' 'Pass' ($addresses -join ', ') }
  else { Add-Result 'DNS resolution' 'Fail' 'No address records' }
} catch { Add-Result 'DNS resolution' 'Fail' $_.Exception.Message }
if ($SharePath) {
  try { Add-Result 'Network share' $(if (Test-Path -LiteralPath $SharePath) {'Pass'} else {'Fail'}) $SharePath }
  catch { Add-Result 'Network share' 'Fail' $_.Exception.Message }
} else { Add-Result 'Network share' 'NotTested' 'Provide an approved SharePath' }
Add-Result 'Instrument connectivity' 'ManualReview' 'Approved vendor-specific interface test required'
Add-Result 'Business applications' 'ManualReview' 'Application-owner functional acceptance required'
Add-Result 'Backup / rollback verification' 'ManualReview' 'Review evidence from approved procedure'
$report = [pscustomobject]@{ TestedAt=(Get-Date).ToString('o'); Machine=$env:COMPUTERNAME; Checks=$checks }
$report | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $OutputPath -Encoding UTF8
$checks | Format-Table -AutoSize
