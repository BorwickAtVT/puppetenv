#!/bin/sh

rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

sudo bash <<EOF
yum -y install puppet
systemctl enable puppet.service
EOF
