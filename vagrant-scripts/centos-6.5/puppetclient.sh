#!/bin/sh

rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

sudo bash <<EOF
yum -y install puppet
service puppet start
chkconfig puppet on
EOF
