#!/usr/bin/env bash

# clean repos
rm -rf icvpn-scripts
rm -rf icvpn-meta

# fetch repos
git clone https://github.com/freifunk/icvpn-scripts.git
git clone https://github.com/freifunk/icvpn-meta.git

# prepare virtual environment
cd icvpn-scripts
python3 -m venv icvpn-scripts-env
source ./icvpn-scripts-env/bin/activate
python3 -m pip install -r requirements.txt

# update configuration file
rm ../etc/dnsmasq.d/freifunk.conf
./mkdns -f dnsmasq -s ../icvpn-meta/ -x dn42 >> ../etc/dnsmasq.d/freifunk.conf
cd ..
