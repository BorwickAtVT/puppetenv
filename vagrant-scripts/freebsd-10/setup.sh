#!/bin/sh

cat > /etc/hosts <<EOF
127.0.0.1 localhost
10.1.0.2 alpha.dev alpha
10.1.0.2 puppet.dev puppet
10.1.0.3 bravo.dev bravo
10.1.0.4 charlie.dev charlie
EOF

env ASSUME_ALWAYS_YES=YES pkg install git

env ASSUME_ALWAYS_YES=YES pkg install ca_root_nss

ln -sf /usr/local/share/certs/ca-root-nss.crt /etc/ssl/cert.pem
