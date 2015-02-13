# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # Use Ubuntu Trusty (14.x) 64-bit
  config.vm.box = "ubuntu/trusty64"

  # Virtualbox GUI
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.gui = true
    v.customize ['modifyvm', :id, '--usb', 'on']
  end

  # Install Dependencies (window manager, java, etc)
  config.vm.provision :shell, path: "scripts/install_deps.sh"

  # Configure bashrc
  config.vm.provision :shell, path: "scripts/bash_config.sh"

  # Install Docker
  config.vm.provision :shell, path: "scripts/install_docker.sh"
end
