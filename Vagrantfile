Vagrant.configure('2') do |config|
    config.vm.define :storage_server do |machine|
        machine.vm.box = "bento/ubuntu-18.04"
        machine.vm.hostname = "lpi_lab"
        machine.vm.network :private_network, ip: "192.168.56.109"
        machine.vm.provider :virtualbox do |v|
            v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            v.customize ["modifyvm", :id, "--memory", 2048]
            v.customize ["modifyvm", :id, "--name", "storageserver"]
        end      
    end
end
