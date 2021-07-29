#!/bin/bash
echo "Enter server: [server] [protocol]"
echo -n "ex: us1000 udp"
read SERVER PROTOCOL
cp "/etc/openvpn/ovpn_${PROTOCOL}/${SERVER}nordvpn.com.${PROTOCOL}.ovpn" "/etc/openvpn/${SERVER}nordvpn.com.${PROTOCOL}.ovpn"
sudo openvpn --config "/etc/openvpn/${SERVER}nordvpn.com.${PROTOCOL}.ovpn" --auth-user-pass /etc/openvpn/credentials.conf
