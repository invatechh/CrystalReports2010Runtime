# HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\
$msiId = '{817393F4-AAE9-4217-B3BF-C94D79D20F6B}'
$msiId64 = '{1C7E45D8-4CC3-4FBE-8C20-4A1E5B5B8236}'

$package = 'CrystalReports2010Runtime'

if ([IntPtr]::Size -eq 8) { Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msiId64 /qb" -validExitCodes @(0) }
else { Uninstall-ChocolateyPackage $package 'MSI' -SilentArgs "$msiId /qb" -validExitCodes @(0) }

