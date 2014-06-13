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

echo "TEST CREATING A FILE" > /TESTFILE

cat >> /TESTFILE2 <<EOF
What is with the EOFs
EOF

cat >> /etc/rc.local <<EOF
env ASSUME_ALWAYS_YES=YES pkg bootstrap
env ASSUME_ALWAYS_YES=YES pkg install bash
env ASSUME_ALWAYS_YES=YES pkg install sudo

sed -e 's/^# \(%wheel ALL=(ALL) ALL\)$/&/' -i .bak /usr/local/etc/sudoers

echo "vagrant::::::vagrant::bash:vagrant" | adduser -f

# poor man's firstboot:
rm /etc/rc.local
EOF

cat >> /TESTFILE3 <<EOF
Hm?
EOF
