PARTITIONS=ada0
DISTRIBUTIONS="base.txz kernel.txz games.txz lib32.txz"

#!/bin/sh
cat >> /etc/rc.conf <<EOF
ifconfig_em0="DHCP"
sshd_enable="YES"
# Set dumpdev to "AUTO" to enable crash dumps, "NO" to disable
dumpdev="AUTO"
EOF

pw usermod root -h 0 <<EOF
vagrant
EOF

cat >> /TESTFILE <<EOF
sed -e 's/^# \(%wheel ALL=(ALL) ALL\)$/&/' -i .bak /usr/local/etc/sudoers
EOF

cat >> /etc/rc.local <<EOF
env ASSUME_ALWAYS_YES=YES pkg bootstrap
env ASSUME_ALWAYS_YES=YES pkg install bash
env ASSUME_ALWAYS_YES=YES pkg install sudo
env ASSUME_ALWAYS_YES=YES pkg install wget

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /usr/local/etc/sudoers

echo "vagrant::::::vagrant::bash:vagrant" | adduser -f

pw usermod vagrant -G wheel

# poor man's firstboot:
rm /etc/rc.local
EOF

