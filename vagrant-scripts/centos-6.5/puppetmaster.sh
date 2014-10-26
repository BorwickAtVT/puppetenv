#!/bin/sh

# from https://docs.puppetlabs.com/guides/install_puppet/install_el.html
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum -y install puppet-server

gem install bundler

# needed to build native gem libraries:
yum -y install ruby-devel
yum -y install gcc
gem install librarian-puppet -v 1.0.3

mv /etc/puppet /etc/puppet-orig
ln -s /vagrant/puppet-config /etc/puppet

cat > /etc/puppet/puppet.conf <<EOF
certname = alpha
dns_alt_names = alpha.dev, puppet, puppet.dev
EOF

sudo echo '*' > /etc/puppet/autosign.conf

bash <<EOF
service puppetmaster start
chkconfig puppetmaster on
EOF
