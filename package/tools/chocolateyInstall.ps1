$package = 'CrystalReports2010Runtime'

$params = @{
  packageName = $package;
  fileType = 'msi';
  silentArgs = '/quiet';
  url = 'https://downloads.businessobjects.com/akdlm/crnetruntime/clickonce/CRRuntime_32bit_13_0_24.msi';
  url64bit = 'https://downloads.businessobjects.com/akdlm/crnetruntime/clickonce/CRRuntime_64bit_13_0_24.msi';

  checksum = '116283c08b3d6693e7d91b8d1165e373f67dffcb2945189642f2195428bc2ecd';
  checksumType = 'sha256';
  checksum64 = '6c0f08531133081c1389df04f98b3894f6137c454ac2d5756368c84a98fb64cb';
  checksumType64 = 'sha256';
}

Install-ChocolateyPackage @params

# http://forums.iis.net/p/1174672/1968094.aspx
# it turns out that even on x64, x86 clr types should also be installed
# or SMO breaks
$IsSytem32Bit = (($Env:PROCESSOR_ARCHITECTURE -eq 'x86') -and `
  ($Env:PROCESSOR_ARCHITEW6432 -eq $null))
if (!$IsSytem32Bit)
{
  $params.url64bit = $params.url
}
Install-ChocolateyPackage @params
