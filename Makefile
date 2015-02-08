.PHONY: boxes clean up down

boxes: centos-6.5.box freebsd-10.box centos-7.box

up:
	vagrant up

down:
	vagrant down

centos-6.5.box: packer-centos-6.5.json
	packer build packer-centos-6.5.json

freebsd-10.box: packer-freebsd-10.json
	packer build packer-freebsd-10.json

centos-7.box: packer-centos-7.json
	packer build packer-centos-7.json

clean:
	-vagrant destroy
	-vagrant box remove centos-*.box
	-vagrant box remove freebsd-10.box
	-rm -r *-iso
	-rm *.box
