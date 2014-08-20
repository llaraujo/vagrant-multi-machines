# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

Vagrant.configure("2") do |config|

	proj = (JSON.parse(File.read(__dir__ + '/_config/vagrant.json')))

	## Machines
	proj['machines'].each do |machine|

		machine_name 			= machine[0]
		machine_data 			= machine[1]
		machine_provider 	= machine_data['provider']

		## define machines
		config.vm.define machine_name do |conf|

			conf.vm.box = machine_data['box']
			conf.vm.box_url = machine_data['box_url']

			## if machine is a aws provider

			if machine_provider['aws'] && machine_provider['aws']['active'] == true

				conf.vm.provider :aws do |aws, override|

					aws.ami = machine_provider['aws']['ami']
					aws.region = machine_provider['aws']['region']
					aws.instance_type = machine_provider['aws']['instance_type']
					aws.security_groups = machine_provider['aws']['security_groups']

					aws.access_key_id = machine_provider['aws']['access_key_id']
					aws.secret_access_key = machine_provider['aws']['secret_access_key']
					aws.keypair_name = machine_provider['aws']['keypair_name']

					override.ssh.username = machine_provider['aws']['ssh']['username']
					override.ssh.private_key_path = machine_provider['aws']['ssh']['private_key_path']

				end

			else

				## Local machine

				conf.vm.host_name = machine_data['host']
				conf.vm.network :private_network, ip: machine_data['ip']

				conf.vm.provider :virtualbox do |vb|
	        vb.customize ["modifyvm", :id,
	        							"--memory", machine_data['memory'],
	        							"--cpuexecutioncap", machine_data['cpuexecutioncap']]

	        vb.cpus = machine_data['cpus']

	      end

	      ## ports
				machine_data['ports'].each do |port|

					conf.vm.network :forwarded_port,
						host: port['host'],
						guest: port['guest'],
						ip: port['ip']

				end

				## PROVIDER: chef
				if machine_provider['chef'] && machine_provider['chef']['active'] == true

					## PROVIDER: omnibus
					config.omnibus.chef_version = :latest

					config.vm.provision :chef_solo do |chef|

						## recipes each
						machine_provider['chef']['recipes'].each do |recipe|
							chef.add_recipe(recipe)
						end

						## chef config json
						chef.json = machine_provider['chef']['json']

					end

				end

				## PROVIDER: shell user root
				if machine_provider['shell'] && machine_provider['shell']['root']

					if machine_provider['shell']['root']['active'] == true

						config.vm.provision "shell", path: machine_provider['shell']['root']['file']

					end

				end

				## PROVIDER: shell user vagrant
				if machine_provider['shell'] && machine_provider['shell']['vagrant']

					if machine_provider['shell']['vagrant']['active'] == true

						config.vm.provision "shell", path: machine_provider['shell']['vagrant']['file'], privileged: false

					end

				end


			end

		end

	end


end
