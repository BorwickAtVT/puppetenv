#!/bin/sh

env ASSUME_ALWAYS_YES=yes pkg install puppet

echo 'puppet_enable="YES"' >> /etc/rc.conf

/usr/local/etc/rc.d/puppet start
