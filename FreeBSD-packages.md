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


Optional packages for DB server (MariaDB, MySQL, SQLite)
---
- `mariadb104-client` (**`pkg lock` recommended**)
- `mariadb104-server` (**`pkg lock` recommended**)
- `mysql57-client`
- `mysql57-server`
- `mysqltuner`
- `portupgrade`
- `sqlite3`
```
pkg install mariadb104-client mariadb104-server mysql57-client mysql57-server mysqltuner portupgrade sqlite3
```


Optional packages for Web server (Apache, Nginx, PHP)
---
- `apache24`
- `mod_php74`
- `nginx`
- `php74`
- `portupgrade`
```
pkg install apache24 mod_php74 nginx php74 portupgrade
```


Optional packages for Mail server (TLS, Auth, AV, DKIM, AntiSpam, Greylist, IMAP, POP3)
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
- `sendmail` (**ports compiled version possibly needed for all the features**)
- `spamass-milter`
- `spamassassin`
```
pkg install cclient clamav cyrus-sasl-saslauthd imap-uw maildrop milter-greylist opendkim portupgrade \
procmail sendmail spamass-milter spamassassin
```


Optional packages for Router (DHCP, DHCPv6)
---
- `isc-dhcp44-server`
- `net-snmp`
- `portupgrade`
- `unbound`
```
pkg install isc-dhcp44-server net-snmp portupgrade unbound
```


Optional packages for VPN server (OpenVPN, DHCP, caching DNS)
---
- `easy-rsa`
- `isc-dhcp44-server`
- `openvpn`
- `portupgrade`
- `unbound`
```
pkg install easy-rsa isc-dhcp44-server openvpn portupgrade unbound
```


Optional packages for DNS, Zabbix, Samba, Multimedia, ...
---
- `bind916` - Authoritative DNS
- `bonnie++` - File system benchmark
- `ffmpeg` - DLNA
- `fusefs-exfat` - exFAT support
- `fusefs-ntfs` - MS Windows NTFS support
- `fusefs-ext2` - Linux ext2/3/4 support
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
- `sysbench` - CPU/file system/SQL benchmark (**ports compiled version needed for MariaDB**)
- `zabbix52-frontend` - Zabbix
- `zabbix52-proxy` - Zabbix
- `zabbix52-server` - Zabbix (**ports compiled version needed for MariaDB**)
```
pkg install bind916 ffmpeg fusefs-exfat fusefs-ntfs fusefs-ext2 libcoap mediatomb mosquitto net-snmp nut\
openipmi portupgrade py37-certbot py37-certbot-dns-rfc2136 py37-pip py37-speedtest-cli samba411 ser2net\
zabbix52-frontend zabbix52-proxy zabbix52-server
```
