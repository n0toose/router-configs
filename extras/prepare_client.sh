# ======
# Notes:
# ======
# Special thanks to Matthias Merkel (https://github.com/Moritz30) for helping me through this.
# Also, thanks to Frank Wiles for his article about NAT; https://www.revsys.com/writings/quicktips/nat.html

# IP-related configurations

## assigns non-gateway address
ip a a 192.168.42.2/24 dev eth0

## adds gateway address as gateway
## the NAT-related configurations will take care of the internet traffic
ip route add default via 192.168.42.1
