#!/bin/sh

yum -y install epel-release
yum -y install http://yum.theforeman.org/releases/1.7/el7/x86_64/foreman-release.rpm
yum -y install foreman-installer
foreman-installer

# TODO -- workaround
echo '#includedir /etc/sudoers.d' >> /etc/sudoers

bash <<EOF
firewall-cmd --permanent --zone=public --add-port=69/udp
firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --permanent --zone=public --add-port=8140/tcp

systemctl restart firewalld.service
EOF
