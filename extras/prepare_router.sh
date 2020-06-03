# ======
# Notes:
# ======
# My Raspberry Pi has two interfaces; the ordinary Ethernet port that ships with it, and an additional
# TP-Link UE300 USB-to-Ethernet adapter, which is connected to a 5-port TP-Link switch.

# Special thanks to Matthias Merkel (https://github.com/Moritz30) for helping me through this.
# Also, thanks to Frank Wiles for his article about NAT; https://www.revsys.com/writings/quicktips/nat.html

# assigns address to interface
ip a a 192.168.42.1/24 dev enp1s0u1u2

# iptables configurations

## IPv4/IPv6 NAT
iptables -F
ip6tables -F

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o enp1s0u1u2 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i enp1s0u1u2 -o eth0 -j ACCEPT

ip6tables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
ip6tables -A FORWARD -i eth0 -o enp1s0u1u2 -m state --state RELATED,ESTABLISHED -j ACCEPT
ip6tables -A FORWARD -i enp1s0u1u2 -o eth0 -j ACCEPT

## makes changes permanent by saving them to a file
iptables-save -f /etc/iptables/iptables.rules
ip6tables-save -f /etc/iptables/ip6tables.rules

## enables systemd services, so that the changes are immediately
## applied upon booting the machine.
sudo systemctl enable --now iptables
sudo systemctl enable --now ip6tables
