$subkey = "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\"
$ndpKey = [Microsoft.Win32.RegistryKey]::OpenBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine,[Microsoft.Win32.RegistryView]::Registry32).OpenSubKey($subkey)
$releaseKey = $ndpKey.GetValue("Release")

if ($releaseKey -ge 528040){$version = "4.8 or later"}
elseif ($releaseKey -ge 461808){$version = "4.7.2"}
elseif ($releaseKey -ge 461308){$version = "4.7.1"}
elseif ($releaseKey -ge 460798){$version =  "4.7"}
elseif ($releaseKey -ge 394802){$version =  "4.6.2"}
elseif ($releaseKey -ge 394254){$version =  "4.6.1"}
elseif ($releaseKey -ge 393295){$version =  "4.6"}
elseif ($releaseKey -ge 379893){$version =  "4.5.2"}
elseif ($releaseKey -ge 378675){$version =  "4.5.1"}
elseif ($releaseKey -ge 378389){$version =  "4.5"}
else {$version =  "No 4.5 or later version detected"}

Write-Host ".NET Framework Version:" $version
Write-Host "Release Key:" $releaseKey
