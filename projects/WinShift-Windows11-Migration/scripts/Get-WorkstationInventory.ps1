# Read-only workstation inventory. Run only on authorized Windows endpoints.
[CmdletBinding()]
param([string]$OutputPath = '.\inventory.json')
$ErrorActionPreference = 'Stop'
function Try-Cim([string]$Class) {
  try { Get-CimInstance -ClassName $Class -ErrorAction Stop }
  catch { $null }
}
$os = Try-Cim 'Win32_OperatingSystem'
$cs = Try-Cim 'Win32_ComputerSystem'
$bios = Try-Cim 'Win32_BIOS'
$cpu = @(Try-Cim 'Win32_Processor')
$disks = @(Try-Cim 'Win32_LogicalDisk' | Where-Object { $_.DriveType -eq 3 })
$tpm = try { Get-Tpm -ErrorAction Stop } catch { $null }
$firmware = try { (Get-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control').PEFirmwareType } catch { $null }
$apps = @()
$uninstall = @('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*')
foreach ($path in $uninstall) {
  $apps += @(Get-ItemProperty -Path $path -ErrorAction SilentlyContinue | Where-Object DisplayName | Select-Object DisplayName,DisplayVersion,Publisher)
}
$report = [pscustomobject]@{
  AssessmentTimestamp = (Get-Date).ToString('o')
  ComputerName = $env:COMPUTERNAME
  Manufacturer = $cs.Manufacturer
  Model = $cs.Model
  OS = $os.Caption
  OSVersion = $os.Version
  OSBuild = $os.BuildNumber
  RAMBytes = $cs.TotalPhysicalMemory
  CPU = @($cpu | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors)
  BIOSVersion = $bios.SMBIOSBIOSVersion
  FirmwareTypeCode = $firmware
  TPMPresent = if ($null -ne $tpm) { $tpm.TpmPresent } else { $null }
  TPMSpecVersion = if ($null -ne $tpm) { $tpm.SpecVersion } else { $null }
  Disks = @($disks | Select-Object DeviceID,Size,FreeSpace)
  Applications = @($apps | Sort-Object DisplayName -Unique)
  Note = 'Peripheral and lab instrument interfaces require manual validation; this output may contain sensitive inventory data.'
}
$report | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $OutputPath -Encoding UTF8
Write-Host "Inventory captured to $OutputPath. Redact identifiers before sharing."
