#!/bin/sh

yum makecache fast

# TODO: not sure why this is an issue but...
rm -f /etc/gshadow.lock

cat > /etc/hosts <<EOF
127.0.0.1 localhost
10.1.0.2 alpha.dev alpha
10.1.0.2 puppet.dev puppet
10.1.0.3 bravo.dev bravo
10.1.0.4 charlie.dev charlie
EOF

