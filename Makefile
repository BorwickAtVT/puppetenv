.PHONY: freebsd-vm clean vagrant-box

vagrant-box: packer_virtualbox-iso_virtualbox.box
	vagrant box add freebsd-10 ./packer_virtualbox-iso_virtualbox.box

packer_virtualbox-iso_virtualbox.box: packer-freebsd-10.json
	packer build packer-freebsd-10.json

clean:
	-vagrant destroy
	-vagrant box remove freebsd-10
	-rm -r output-virtualbox-iso/
	-rm packer_virtualbox-iso_virtualbox.box
