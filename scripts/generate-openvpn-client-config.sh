#!/usr/local/bin/bash

CLIENTNAME=$1
CLIENTNAME="${CLIENTNAME:-client}"

cat << EOF >> $CLIENTNAME.ovpn
client
dev tun
proto udp
remote vpn.example.com 1194
resolv-retry infinite
nobind
persist-key
persist-tun
cipher AES-256-CBC
key-direction 1
EOF

echo "<ca>" >> $CLIENTNAME.ovpn
cat /usr/local/etc/openvpn/easy-rsa/pki/ca.crt >> $CLIENTNAME.ovpn
echo "</ca>" >> $CLIENTNAME.ovpn
echo "<cert>" >> $CLIENTNAME.ovpn
cat /usr/local/etc/openvpn/easy-rsa/pki/issued/$CLIENTNAME.crt >> $CLIENTNAME.ovpn
echo "</cert>" >> $CLIENTNAME.ovpn
echo "<key>" >> $CLIENTNAME.ovpn
cat /usr/local/etc/openvpn/easy-rsa/pki/private/$CLIENTNAME.key >> $CLIENTNAME.ovpn
echo "</key>" >> $CLIENTNAME.ovpn
echo "<tls-auth>" >> $CLIENTNAME.ovpn
cat /usr/local/etc/openvpn/ta.key >> $CLIENTNAME.ovpn
echo "</tls-auth>" >> $CLIENTNAME.ovpn
