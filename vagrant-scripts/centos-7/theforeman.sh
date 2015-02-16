#!/bin/sh

# TODO -- workaround
echo '#includedir /etc/sudoers.d' >> /etc/sudoers

yum -y install epel-release
yum -y install http://yum.theforeman.org/releases/1.7/el7/x86_64/foreman-release.rpm
yum -y install foreman-installer

foreman-installer --foreman-admin-password=vagrant \
		  --enable-foreman-compute-ec2 \
		  --enable-foreman-compute-gce

# Symlink from /vagrant/puppet-config, one file at a time.
service httpd stop
( cd /etc/puppet
  rm -rf modules
  for i in /vagrant/puppet-config/*; do
      ln -s "$i" /etc/puppet
  done
  make
  )

gem install bundler

# needed to build native gem libraries:
yum -y install ruby-devel
yum -y install gcc
gem install librarian-puppet
gem install hiera

cd /etc/puppet && /usr/local/bin/librarian-puppet install


service httpd start

echo '*' > /etc/puppet/autosign.conf

bash <<EOF
firewall-cmd --permanent --zone=public --add-port=69/udp
firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --permanent --zone=public --add-port=8140/tcp

systemctl restart firewalld.service
EOF

# Run agent once so it gets registered:
puppet agent -t
