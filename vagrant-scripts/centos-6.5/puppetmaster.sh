#!/bin/sh

wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh epel-release-*.rpm

# rubygems, gcc, ruby-devel needed for building & installing the gems.
sudo bash <<EOF
yum -y install puppet-server
yum -y install git
EOF

# FIXME: on Centos 6.5, librarian-puppet can't be installed
#
# sudo bash <<EOF
# yum -y install rubygems
# yum -y install gcc
# yum -y install ruby-devel
# EOF
# gem install bundler
# gem install librarian-puppet

# # FIXME: probably shouldn't do this
# sudo rm -rf /etc/puppet/

# sudo git clone https://github.com/BorwickAtVT/puppet-config.git /etc/puppet/
# # ( cd /usr/local/etc/puppet && librarian-puppet install )
# ( cd /etc/puppet && make )

# sudo cat > /etc/puppet/puppet.conf <<EOF
# certname = alpha
# dns_alt_names = alpha.dev, puppet, puppet.dev
# EOF

# sudo echo '*' > /etc/puppet/autosign.conf

# sudo bash <<EOF
# service puppetmaster start
# chkconfig puppetmaster on
# EOF
