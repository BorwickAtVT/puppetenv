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


  # `alpha` box can be either CentOS or FreeBSD. Comment out whichever
  # one you do not want:

  # --- alpha as CentOS:
  config.vm.define 'alpha', primary: true do |alpha|
    alpha.vm.synced_folder ".", "/vagrant", :nfs => true, id: "vagrant-root"
    alpha.vm.box = "centos-7.box"
    alpha.vm.hostname = 'alpha'
    alpha.vm.network "private_network", ip: "10.1.0.2"

    alpha.vm.provision 'shell', path: 'vagrant-scripts/centos-7/setup.sh'
    alpha.vm.provision 'shell', path: 'vagrant-scripts/centos-7/theforeman.sh'

    alpha.vm.network :forwarded_port, guest: 80, host: 8080
  end

  # # --- alpha as FreeBSD:
  # config.vm.define 'alpha', primary: true do |alpha|
  #   alpha.vm.synced_folder ".", "/vagrant", :nfs => true, id: "vagrant-root"
  #   alpha.vm.box = "freebsd-10.box"
  #   alpha.vm.hostname = 'alpha'
  #   alpha.vm.network "private_network", ip: "10.1.0.2"

  #   alpha.vm.provision 'shell', path: 'vagrant-scripts/freebsd-10/setup.sh'
  #   alpha.vm.provision 'shell', path: 'vagrant-scripts/freebsd-10/puppetmaster.sh'
  # end

  config.vm.define 'bravo' do |bravo|
    bravo.vm.box = "freebsd-10.box"
    bravo.vm.hostname = 'bravo'
    bravo.vm.network "private_network", ip: "10.1.0.3"

    bravo.vm.provision 'shell', path: 'vagrant-scripts/freebsd-10/setup.sh'
    bravo.vm.provision 'shell', path: 'vagrant-scripts/freebsd-10/puppetclient.sh'
  end

  config.vm.define 'charlie' do |charlie|
    charlie.vm.synced_folder ".", "/vagrant", :nfs => true, id: "vagrant-root"

    charlie.vm.box = "centos-7.box"
    charlie.vm.hostname = 'charlie'
    charlie.vm.network "private_network", ip: "10.1.0.4"

    charlie.vm.provision 'shell', path: 'vagrant-scripts/centos-7/setup.sh'
    charlie.vm.provision 'shell', path: 'vagrant-scripts/centos-7/puppetclient.sh'
  end



  # credit to https://stefanwrobel.com/how-to-make-vagrant-performance-not-suck
  config.vm.provider "virtualbox" do |v|
    host = RbConfig::CONFIG['host_os']

    # Give VM 1/4 system memory & access to all cpu cores on the host
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else # sorry Windows folks, I can't help you
      cpus = 2
      mem = 1024
    end

    v.customize ["modifyvm", :id, "--memory", mem]
    v.customize ["modifyvm", :id, "--cpus", cpus]
  end

end
