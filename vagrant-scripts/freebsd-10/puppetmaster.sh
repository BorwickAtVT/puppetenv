#!/bin/sh

env ASSUME_ALWAYS_YES=yes pkg install puppet

# gem install bundler
# gem install librarian-puppet

# FIXME: probably shouldn't do this
rm -rf /usr/local/etc/puppet/

ln -s /vagrant/puppet-config /usr/local/etc/puppet

# git clone https://github.com/BorwickAtVT/puppet-config.git /usr/local/etc/puppet/
# ( cd /usr/local/etc/puppet && librarian-puppet install )
# ( cd /usr/local/etc/puppet && make )


cat > /usr/local/etc/puppet/puppet.conf <<EOF
certname = alpha
dns_alt_names = alpha.dev, puppet, puppet.dev
EOF

echo 'puppetmaster_enable="YES"' >> /etc/rc.conf

echo '*' > /usr/local/etc/puppet/autosign.conf

/usr/local/etc/rc.d/puppetmaster start
