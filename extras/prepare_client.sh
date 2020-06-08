# ======
# Notes:
# ======
# This (nearly) distro-agnostic script assigns a static IP within the 192.168.42.1/24 range to the client.
# Be careful with the interface names and IP-related conflicts.
#
# This is particularly useful if you're testing connectivity without DHCP.


# IP-related configurations

## assigns non-gateway address
ip a a 192.168.42.2/24 dev eth0

## adds gateway address as gateway
## the NAT-related configurations will take care of the internet traffic
ip route add default via 192.168.42.1
