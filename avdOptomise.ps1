 # OS Optimizations for Azure Virtual Desktop
 write-host 'AIB Customization: OS Optimizations for WVD'

$folderName = '6dgAvdOptimise'
$folderLocation = 'C:\'

$path=$folderLocation+$folderName

$VDOTUrl = "https://morriavd.blob.core.windows.net/avd/Virtual-Desktop-Optimization-Tool-main.zip"
$VDOTPath = $path+"\Virtual-Desktop-Optimization-Tool-main.zip"

New-Item -Path $path -ItemType Directory

Invoke-WebRequest -Uri $VDOTUrl -OutFile $VDOTPath -Verbose

Expand-Archive -LiteralPath $VDOTPath -DestinationPath $path -Force -Verbose

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force -Verbose

Set-Location -Path $path

.\Virtual-Desktop-Optimization-Tool-main\Windows_VDOT.ps1 -Optimizations All -AdvancedOptimizations All -AcceptEULA -Verbose
