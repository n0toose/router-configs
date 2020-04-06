#!/bin/sh

# clean repos
rm -rf icvpn-scripts
rm -rf icvpn-meta

# fetch repos
git clone https://github.com/freifunk/icvpn-scripts.git
git clone https://github.com/freifunk/icvpn-meta.git

# update configuration file
cd icvpn-scripts
rm ../etc/dnsmasq.d/freifunk.conf
./mkdns -f dnsmasq -s ../icvpn-meta/ -x dn42 >> ../etc/dnsmasq.d/freifunk.conf
cd ..
