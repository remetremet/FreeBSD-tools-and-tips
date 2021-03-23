Packages I use and I recomend to use on every FreeBSD server
===

Essential packeges on all servers
---
- `bash`
- `bash-completion`
- `bind-tools`
- `bsdstats`
- `ca_root_nss`
- `curl`
- `ddrescue`
- `dhcpdump`
- `dmidecode`
- `fdupes`
- `flashrom`
- `fping`
- `gawk`
- `git`
- `iftop`
- `iperf3`
- `iso-codes`
- `joe`
- `links`
- `lsof`
- `lynx`
- `mc`
- `nmap`
- `openssl`
- `pciids`
- `pciutils`
- `perl5`
- `python37`
- `rsync`
- `screen`
- `smartmontools`
- `sudo`
- `tcpdump`
- `tcping`
- `tcptraceroute`
- `tuptime`
- `usbutils`
- `wget`
- `zabbix52-agent`
```
pkg install bash bash-completion bind-tools bsdstats ca_root_nss curl ddrescue dhcpdump dmidecode \
fdupes flashrom fping gawk git iftop iperf3 iso-codes joe links lsof lynx mc nmap openssl pciids pciutils perl5 \
python37 rsync screen smartmontools sudo tcpdump tcping tcptraceroute tuptime usbutils wget zabbix52-agent
```


Optional packages (DB)
---
- `mariadb104-client`
- `mariadb104-server`
- `mysql57-client`
- `mysql57-server`
- `mysqltuner`
- `portupgrade`
- `sqlite3`
```
pkg install mariadb104-client mariadb104-server mysql57-client mysql57-server mysqltuner portupgrade sqlite3
```


Optional packages (Web)
---
- `apache24`
- `mod_php74`
- `nginx`
- `php74`
- `portupgrade`
```
pkg install apache24 mod_php74 nginx php74 portupgrade
```


Optional packages (Mail)
---
- `cclient`
- `clamav`
- `cyrus-sasl-saslauthd`
- `imap-uw`
- `maildrop`
- `milter-greylist`
- `opendkim`
- `portupgrade`
- `procmail`
- `sendmail`
- `spamass-milter`
- `spamassassin`
```
pkg install cclient clamav cyrus-sasl-saslauthd imap-uw maildrop milter-greylist opendkim portupgrade \
procmail sendmail spamass-milter spamassassin
```


Optional packages (Router)
---
- `isc-dhcp44-server`
- `net-snmp`
- `portupgrade`
- `unbound`
```
pkg install isc-dhcp44-server net-snmp portupgrade unbound
```


Optional packages (VPN)
---
- `easy-rsa`
- `isc-dhcp44-server`
- `openvpn`
- `portupgrade`
- `unbound`
```
pkg install easy-rsa isc-dhcp44-server openvpn portupgrade unbound
```


Optional packages (DNS, Zabbix, Samba, ...)
---
- `bind916` - Authoritative DNS
- `ffmpeg` - DLNA
- `libcoap` - Ikea Tradfri communication
- `mediatomb` - DLNA
- `mosquitto` - IOT
- `net-snmp` - Network monitoring
- `nut` - UPS monitoring
- `openipmi`
- `portupgrade`
- `py37-certbot` - Let's Encrypt
- `py37-certbot-dns-rfc2136` - Let's Encrypt
- `py37-pip`
- `py37-speedtest-cli` - Ookla's speedtest client
- `samba411` - SMB file sharing
- `ser2net` - RS232 communication over IP
- `zabbix52-frontend` - Zabbix
- `zabbix52-proxy` - Zabbix
- `zabbix52-server` - Zabbix
```
pkg install bind916 ffmpeg libcoap mediatomb mosquitto net-snmp nut openipmi portupgrade py37-certbot\
py37-certbot-dns-rfc2136 py37-pip py37-speedtest-cli samba411 ser2net zabbix52-frontend zabbix52-proxy\
zabbix52-server
```
