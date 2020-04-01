$regProxy='HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings';
$paramsProxy=gp $regProxy;
$proxyEnableValue=$paramsProxy.ProxyEnable;
sp $regProxy -name ProxyEnable -value (1-$proxyEnableValue);

if ((1-$proxyEnableValue) -eq 0) {
  $msg="PROXY DESATIVADO!";
}
else {
  $msg="PROXY ATIVADO!";
}

$Shell = New-Object -ComObject "WScript.Shell"
$Shell.Popup($msg, 0, "PROXY", 0)

