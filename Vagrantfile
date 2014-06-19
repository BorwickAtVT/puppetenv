# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.

  # config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder ".", "/vagrant", :disabled => true

  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end

  config.vm.define 'alpha', primary: true do |alpha|
    alpha.vm.box = "freebsd-10.box"
    alpha.vm.hostname = 'alpha'
    alpha.vm.network "private_network", ip: "10.1.0.2"

    alpha.vm.provision 'shell', path: 'vagrant-scripts/freebsd-10/setup.sh'
    alpha.vm.provision 'shell', path: 'vagrant-scripts/freebsd-10/puppetmaster.sh'
  end

  config.vm.define 'bravo' do |bravo|
    bravo.vm.box = "freebsd-10.box"
    bravo.vm.hostname = 'bravo'
    bravo.vm.network "private_network", ip: "10.1.0.3"

    bravo.vm.provision 'shell', path: 'vagrant-scripts/freebsd-10/setup.sh'
    bravo.vm.provision 'shell', path: 'vagrant-scripts/freebsd-10/puppetclient.sh'
  end

  config.vm.define 'charlie' do |bravo|
    bravo.vm.box = "centos-6.5.box"
    bravo.vm.hostname = 'charlie'
    bravo.vm.network "private_network", ip: "10.1.0.4"

    bravo.vm.provision 'shell', path: 'vagrant-scripts/centos-6.5/setup.sh'
    bravo.vm.provision 'shell', path: 'vagrant-scripts/centos-6.5/puppetclient.sh'
  end

end
