.PHONY: clean up down

up:
	vagrant up

down:
	vagrant down

centos-6.5.box: packer-centos-6.5.json
	packer build packer-centos-6.5.json

freebsd-10.box: packer-freebsd-10.json
	packer build packer-freebsd-10.json

clean:
	-vagrant destroy
	-vagrant remove centos-6.5.box
	-vagrant remove freebsd-10.box
	-rm -r *-iso
	-rm *.box
