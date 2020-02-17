Vagrant.configure('2') do |config|
    $docker_install = <<-SCRIPT
    sudo apt-get remove -y docker docker-engine docker.io containerd runc 
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker docker-compose
    sudo usermod -aG docker vagrant
    echo "cd /vagrant" >> /home/vagrant/.profile
    SCRIPT
    config.vm.provision "shell", inline: $docker_install
    config.vm.define :storage_server do |machine|
        machine.vm.box = "bento/ubuntu-18.04"
        machine.vm.hostname = "storageserver"
        machine.vm.network :private_network, ip: "192.168.56.109"
        machine.vm.provider :virtualbox do |v|
            v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            v.customize ["modifyvm", :id, "--memory", 2048]
            v.customize ["modifyvm", :id, "--name", "storageserver"]
        end      
    end
end