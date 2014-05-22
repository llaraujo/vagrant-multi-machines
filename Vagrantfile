# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

Vagrant.configure("2") do |config|

	proj = (JSON.parse(File.read("vagrant.json")))

	## Machines
	proj['machines'].each do |machine|

		machine_name = machine[0]
		machine_data = machine[1]

		## define machines
		config.vm.define machine_name do |conf|

			conf.vm.box = machine_data['box']
			conf.vm.box_url = machine_data['box_url']

			## hostmanager
	    conf.vm.provision :hostmanager
			conf.hostmanager.enabled = true
			conf.hostmanager.manage_host = true
			conf.hostmanager.ignore_private_ip = false
			conf.hostmanager.include_offline = true

			conf.vm.hostname = machine_data['host']
			conf.vm.network :private_network, ip: machine_data['ip']
			conf.hostmanager.aliases = machine_data['aliases']

			conf.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", machine_data['memory']]
        vb.customize ["modifyvm", :id, "--name", machine_name]
      end

		end

	end


end
