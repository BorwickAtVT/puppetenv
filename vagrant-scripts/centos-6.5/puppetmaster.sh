#!/bin/sh

# from https://docs.puppetlabs.com/guides/install_puppet/install_el.html
sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
sudo yum -y install puppet-server

sudo gem install bundler

# needed to build native libraries:
sudo yum -y install ruby-devel
sudo yum -y install gcc
sudo gem install librarian-puppet -v 1.0.3

sudo gem -y install git


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
