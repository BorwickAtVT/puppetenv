#!/bin/sh

# TODO -- workaround
echo '#includedir /etc/sudoers.d' >> /etc/sudoers

yum -y install epel-release
yum -y install http://yum.theforeman.org/releases/1.7/el7/x86_64/foreman-release.rpm
yum -y install foreman-installer

foreman-installer --foreman-admin-password=vagrant \
		  --enable-foreman-compute-ec2 \
		  --enable-foreman-compute-gce

# link puppet dir and pull in Foreman stuff
mv /etc/puppet/ /etc/puppet-orig/
mkdir /etc/puppet
git clone /vagrant/puppet-config/ /etc/puppet/
rsync -az /etc/puppet-orig/ /etc/puppet/

echo '*' > /etc/puppet/autosign.conf


bash <<EOF
firewall-cmd --permanent --zone=public --add-port=69/udp
firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --permanent --zone=public --add-port=8140/tcp

systemctl restart firewalld.service
EOF
