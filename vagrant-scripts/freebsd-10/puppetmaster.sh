#!/bin/sh

env ASSUME_ALWAYS_YES=yes pkg install puppet

mv /usr/local/etc/puppet /usr/local/etc/puppet-orig
ln -s /vagrant/puppet-config /usr/local/etc/puppet

gem install bundler
gem install librarian-puppet

cd /usr/local/etc/puppet && librarian-puppet install

cat > /usr/local/etc/puppet/puppet.conf <<EOF
certname = alpha
dns_alt_names = alpha.dev, puppet, puppet.dev
EOF

echo 'puppetmaster_enable="YES"' >> /etc/rc.conf

echo '*' > /usr/local/etc/puppet/autosign.conf

/usr/local/etc/rc.d/puppetmaster start
