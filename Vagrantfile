# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 49162, host: 49162
  config.vm.network "forwarded_port", guest: 49161, host: 49161
  config.vm.network "forwarded_port", guest: 8000, host: 28000
  config.vm.network "forwarded_port", guest: 8080, host: 28080
  config.vm.network "forwarded_port", guest: 8181, host: 28181
  config.vm.network "forwarded_port", guest: 8443, host: 28443

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network "private_network", ip: "10.0.2.15"
  #config.vm.network "public_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./data", "/vagrant_data"

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

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "fix-no-tty", type: "shell" do |s|
    s.privileged = false
    s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end  
  config.vm.provision "shell", inline: <<-SHELL
    #echo 'export http_proxy=http://proxy.de.softlab.net:8080' >> .bashrc
    #echo 'export https_proxy=http://proxy.de.softlab.net:8080' >> .bashrc

    sudo su
    #echo 'Acquire::http::Proxy "http://proxy.de.softlab.net:8080";' >> /etc/apt/apt.conf.d/08proxy
    #echo 'Acquire::https::Proxy "http://proxy.de.softlab.net:8080";' >> /etc/apt/apt.conf.d/08proxy
    #echo 'Acquire::ftp::Proxy "http://proxy.de.softlab.net:8080";' >> /etc/apt/apt.conf.d/08proxy

    #mkdir /etc/systemd/system/docker.service.d
    #echo '[Service]' >> /etc/systemd/system/docker.service.d/http-proxy.conf
    #echo 'Environment="HTTP_PROXY=http://proxy.de.softlab.net:8080/"' >> /etc/systemd/system/docker.service.d/http-proxy.conf

    #export http_proxy=http://proxy.de.softlab.net:8080
    #export https_proxy=http://proxy.de.softlab.net:8080

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    apt-key fingerprint 0EBFCD88
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    apt-get update
    apt-get install -y docker-ce
    usermod -aG docker ubuntu

    wget https://github.com/openshift/origin/releases/download/v1.3.3/openshift-origin-client-tools-v1.3.3-bc17c1527938fa03b719e1a117d584442e3727b8-linux-64bit.tar.gz
    tar xfz openshift-origin-client-tools-v1.3.3-bc17c1527938fa03b719e1a117d584442e3727b8-linux-64bit.tar.gz
    mv openshift*/oc /usr/local/bin/
  SHELL
end
