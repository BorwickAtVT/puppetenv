#!/bin/sh

# from https://docs.puppetlabs.com/guides/install_puppet/install_el.html
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum -y install puppet-server

mv /etc/puppet /etc/puppet-orig
ln -s /vagrant/puppet-config /etc/puppet

gem install bundler

# needed to build native gem libraries:
yum -y install ruby-devel
yum -y install gcc
gem install librarian-puppet
gem install hiera

cd /etc/puppet && librarian-puppet install

cat > /etc/puppet/puppet.conf <<EOF
certname = alpha
dns_alt_names = alpha.dev, puppet, puppet.dev

[main]
    # The Puppet log directory.
    # The default value is '$vardir/log'.
    logdir = /var/log/puppet

    # Where Puppet PID files are kept.
    # The default value is '$vardir/run'.
    rundir = /var/run/puppet

    # Where SSL certificates are kept.
    # The default value is '$confdir/ssl'.
    ssldir = $vardir/ssl

EOF

sudo echo '*' > /etc/puppet/autosign.conf

bash <<EOF
firewall-cmd --permanent --zone=public --add-port=8140/tcp
systemctl restart firewalld.service
systemctl enable puppetmaster.service
EOF
