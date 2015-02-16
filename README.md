SUMMARY
---

The purpose of this project is primarily to build a puppet testing
environment.

HOWTO
---

1. Install VirtualBox.

2. Download http://www.packer.io and add the binaries to your PATH.

3. Install vagrant. **For CentOS 7 NFS support, you need to be using Vagrant > 1.6.5.**

        # This should get you started:
        git clone https://github.com/mitchellh/vagrant
		bundle install
		sudo gem install

4. Install `vagrant-bindfs`:

        vagrant plugin install vagrant-bindfs

5. `make`

6. Clone the puppet repo that you want to work on into `puppet-config` e.g.

        git clone https://github.com/BorwickAtVT/puppet-config

6. `vagrant up`

7. If needed, you can run `make clean`. (Note this is more like a
   "distclean" and will wipe everything except ISO downloads.)

SWITCHING TO CENTOS PUPPET MASTER
---

In `Vagrantfile`, there is a commented-out section for having the Vagrant master
be a CentOS box rather than a FreeBSD one. If you'd like to use CentOS as the
puppetmaster, comment out the FreeBSD alpha section and uncomment the CentOS
alpha section.

UPDATING
---

If you're using a previous version and are ready to erase what you've
been working on, run `make clean`.

CREDITS
---

https://github.com/douglaswth/dt-freebsd-packer/ was extremely
helpful!

http://blog.codeship.io/2013/11/07/building-vagrant-machines-with-packer.html

https://github.com/gwagner/packer-centos/blob/master/http_directory/anaconda-ks.cfg
