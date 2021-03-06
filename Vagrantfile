# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  config.vm.define "salt-master" do |salt_master|
    salt_master.vm.box = "ubuntu/trusty64"
    salt_master.vm.network "public_network", ip: "10.10.10.1"
    salt_master.vm.synced_folder "./salt", "/srv/salt"
    salt_master.vm.synced_folder "./pillar", "/srv/pillar"
    salt_master.vm.provision "shell", inline: <<-SHELL
    	wget -O - https://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
    	echo "deb http://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest trusty main" > /etc/apt/sources.list.d/saltstack.list
    	apt-get update
    	apt-get install -y salt-master
    SHELL
  end

  config.vm.define "salt-minion1" do |salt_minion1|
    salt_minion1.vm.box = "ubuntu/trusty64"
    salt_minion1.vm.network "public_network", ip: "10.10.10.2"
    salt_minion1.vm.provision "shell", inline: <<-SHELL
    	wget -O - https://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
    	echo "deb http://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest trusty main" > /etc/apt/sources.list.d/saltstack.list
    	apt-get update
    	apt-get install -y salt-minion
      echo "master: 10.10.10.1\nid: salt-minion1" > /etc/salt/minion.d/local.conf
      rm /etc/salt/minion_id
      service salt-minion restart
    SHELL
  end

  config.vm.define "salt-minion2" do |salt_minion2|
    salt_minion2.vm.box = "ubuntu/trusty64"
    salt_minion2.vm.network "public_network", ip: "10.10.10.3"
    salt_minion2.vm.provision "shell", inline: <<-SHELL
    	wget -O - https://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
    	echo "deb http://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest trusty main" > /etc/apt/sources.list.d/saltstack.list
    	apt-get update
    	apt-get install -y salt-minion
      echo "master: 10.10.10.1\nid: salt-minion2" > /etc/salt/minion.d/local.conf
      rm /etc/salt/minion_id
      service salt-minion restart
    SHELL
  end

  config.vm.define "salt-confd" do |salt_confd|
    salt_confd.vm.box = "ubuntu/trusty64"
    salt_confd.vm.network "public_network", ip: "10.10.10.3"
    salt_confd.vm.provision "shell", inline: <<-SHELL
      wget -O - https://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
      echo "deb http://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest trusty main" > /etc/apt/sources.list.d/saltstack.list
      apt-get update
      apt-get install -y salt-minion
      echo "master: 10.10.10.1\nid: salt-confd" > /etc/salt/minion.d/local.conf
      rm /etc/salt/minion_id
      service salt-minion restart
    SHELL
  end

end
