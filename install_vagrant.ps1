# Install chocolatey and make
$choco_install = choco --version
if($choco_install -eq ""){
    Write-host "Instaling chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    
}

#Install Make
Write-Host "Instaling vagrant..."
choco install virtualbox -y
choco install virtualbox-guest-additions-guest.install -y
choco install vagrant -y


#Configure Virtualization features
Write-Host "Enable virtualization features..."
Disable-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM" -N
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -N
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -N
Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -N
bcdedit /set hypervisorlaunchtype off

Write-Host "Your PC will restart in 5 seconds..."
Start-Sleep 5
Restart-Computer