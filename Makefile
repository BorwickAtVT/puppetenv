.PHONY: freebsd-vm clean

freebsd-vm: output-virtualbox-iso/packer-virtualbox-iso.vdi

output-virtualbox-iso/packer-virtualbox-iso.vdi: packer-freebsd-10.json
	packer build packer-freebsd-10.json

clean:
	-rm -r output-virtualbox-iso/
	-rm packer_virtualbox-iso_virtualbox.box
