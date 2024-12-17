param(
    #��������
    [string]$url,

    #���ص�ѹ�����Ĵ��·����������ѹ�������ƣ�����C:\Users\fanyong\Desktop
    [string]$savePath,

    #ѹ�������ƣ�����chrome-win64
    [string]$archive,

    #ִ�����ƣ�����chrome.exe chrome chromium
    [string]$executableName
  )
$ErrorActionPreference = 'Stop'
$array = @("firefox.exe")
if ($array -contains $executableName) {
    #�ǻ�������
    Write-Host "Downloading firefox browser"
    $wc = New-Object net.webclient
    #����
    $wc.Downloadfile($url, "$savePath\$archive.exe")
    Write-Host "install firefox browser"
    #���û�������
    $env:__compat_layer = 'RunAsInvoker'
    #��װexe�ļ�
    $process = Start-Process -FilePath "$savePath\$archive.exe" -ArgumentList "/ExtractDir=$savePath" -NoNewWindow -Wait -PassThru
    #ɾ��ѹ����
    Remove-Item "$savePath\$archive.exe"
    if (Test-Path "$savePath\core\$executableName") {
            (Get-Item "$savePath\core\$executableName").VersionInfo
        }  else {
            Write-Host "ERROR: failed to install firefox"br
            exit 1
        }
}else{
    Write-Host "Downloading chrome browser"
    $wc = New-Object net.webclient
    #����
    $wc.Downloadfile($url, "$savePath\$archive.zip")
    Write-Host "Unzipping Chrome Browser"

    #��ѹ�ļ�
    Expand-Archive -LiteralPath "$savePath\$archive.zip" -DestinationPath "$savePath"
    #ɾ��ѹ����
    Remove-Item "$savePath\$archive.zip"
    #����
    if (Test-Path "$savePath\$archive\$executableName") {
        (Get-Item "$savePath\$archive\$executableName").VersionInfo
    }  else {
        Write-Host "ERROR: failed to install Google Chrome Beta"
        exit 1
    }
}


