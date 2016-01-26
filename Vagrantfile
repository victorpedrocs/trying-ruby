# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "leopard/rwtrusty64"
	#config.vm.network :forwarded_port, guest: 3001, host: 3001
	#config.vm.network :forwarded_port, guest: 3000, host: 3000
 # config.vm.network :forwarded_port, guest: 1080, host: 1080

	config.vm.provider "virtualbox" do |v|
		v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
		v.memory = 2048
#		v.gui = true
	end
end
