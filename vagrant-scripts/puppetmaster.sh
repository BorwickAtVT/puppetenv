#!/bin/sh

env ASSUME_ALWAYS_YES=yes pkg install puppet

cat > /usr/local/etc/puppet.conf <<EOF
certname = alpha
dns_alt_names = alpha.dev, puppet, puppet.dev
EOF

gem install bundler
gem install librarian-puppet

# FIXME: probably shouldn't do this
rm -rf /usr/local/etc/puppet/

git clone https://github.com/BorwickAtVT/puppet-config.git /usr/local/etc/puppet/
( cd /usr/local/etc/puppet && librarian-puppet install )

echo 'puppetmaster_enable="YES"' >> /etc/rc.conf

/usr/local/etc/rc.d/puppetmaster start
