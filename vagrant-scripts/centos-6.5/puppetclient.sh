#!/bin/sh

wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh epel-release-*.rpm
yum -y install puppet
service puppet start
chkconfig puppet on
