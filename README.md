SUMMARY
---

The purpose of this project is primarily to build a puppet testing
environment.

HOWTO
---

1. Install VirtualBox.

2. Download http://www.packer.io and add the binaries to your PATH.

3. Install vagrant

5. `make`

6. `vagrant up`

7. If needed, you can run `make clean`. (Note this is more like a
   "distclean" and will wipe everything.)

CREDITS
---

https://github.com/douglaswth/dt-freebsd-packer/ was extremely
helpful!

http://blog.codeship.io/2013/11/07/building-vagrant-machines-with-packer.html

https://github.com/gwagner/packer-centos/blob/master/http_directory/anaconda-ks.cfg
