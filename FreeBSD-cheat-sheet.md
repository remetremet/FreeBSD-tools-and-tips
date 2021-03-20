Usefull commands in FreeBSD
===

OS/system
---
Restart:  `reboot` or `shutdown -r now`

Shutdown and poweroff: `shutdown -p now`

Get server and OS info: `uname -a`

Get CPU info:
```
/sbin/sysctl hw.model
/sbin/sysctl hw.ncpu
```

Get CPU temperature: `/sbin/sysctl -a | grep "dev.cpu.*.temperature"` (requires kldload coretemp or amdtemp before)

Get CPU frequency: `/sbin/sysctl dev.cpu.0.freq` (if supported)

Get CPU interrupt stats: `vmstat -i`

Get size of system memory: `/sbin/sysctl hw.physmem`

Get swap stats: `swapinfo -h`

List of kernel modules loaded and load kernel module: 
```
kldstat
kldload coretemp
```

List USB devices: `/usr/sbin/usbconfig`

List PCI connected devices: `/usr/sbin/pciconf -lv`

Update FreeBSD OS: (binary, for -RELEASE only, binary updates are not available for -CURRENT, -STABLE or previously source-updated installations)
```
freebsd-update fetch
freebsd-update install
```

Upgrade FreeBSD OS to newer release: (binary updates are not available for -CURRENT, -STABLE or previously source-updated installations)
```
freebsd-update upgrade -r 13.0-RELEASE
freebsd-update install
shutdown -r now
freebsd-update install
```

Compile/update whole FreeBSD OS from source:
```
cd /usr/src
make update
make buildworld
make buildkernel KERNCONF=${kernel_name}
make installkernel KERNCONF=${kernel_name}
shutdown -r now
make installworld
mergemaster -Ui
shutdown -r now
```

Write log message from CLI/shell via syslog: `logger -t ${application} -i ${message}`

Process monitoring: `top`

System stats: `systat`


OS/packages/ports
---
**Packages** = binary precompiled with default settings, in some cases is needed to use **pkg-static** instead of **pkg**

**Ports** = source, compiled on server, possibility to set different options

Search for package: `pkg search ${name}`

Install and uninstall package: (optional with parameter **-y** = yes to all confirmations)
```
pkg install [-y] ${name}
pkg delete [-y] ${name}
```

Lock and unlock package: (to prevent update to newer versions)
```
pkg lock ${name}
pkg unlock ${name}
```

Update package database: `pkg update [-f]` (optional with parameter **-f** = forced)

Update packages: `pkg upgrade [-f]` (optional with parameter **-f** = forced)

List of installed packages: `pkg info`

Search for ports:
```
cd /usr/ports
make search name=${name}
```

Configure, compile, install and uninstall port:
```
cd /usr/ports/${path}/${name}
make config       # configure port options
make              # compile port
make install      # install port
make deinstall    # uninstall port
make clean        # clean directory after compilation (to force compiling everything from source again)
make distclean    # clean downloaded source files (to force of downloading them again)

or

make install clean [BATCH=yes]  # BATCH=yes can be used to disable prompts for configuration options
```

Update ports database:
```
cd /usr/ports
make update
```

Update ports: (needs pkg **portupgrade**)
```
cd /usr/ports
make update
portupgrade -a
```

Upgrade ports: (old major version to new version)
```
cd /usr/ports
make update
portupgrade -o lang/perl5.20 -f perl5.16
portupgrade -fr p5
```

Start service: `service ${servicename} start`

Stop service: `service ${servicename} stop`

Restart service: `service ${servicename} restart`

Change /etc/rc.conf to start service automaticly:
```
sysrc ${servicename}_enable="YES"
sysrc ${servicename}_configfile="/usr/local/etc/${servicename}.conf"
```


OS/users
---
Add user: `adduser`

Change user password: `passwd ${username}`

Change user's shell: `chsh /usr/local/bin/bash`

Users file: `/etc/passwd`

Users secret file: `/etc/master.passwd`

Update user database: `pwd_mkdb /etc/master.passwd`

Group file: `/etc/group`


Disk drives
---
Get list of disks: `/sbin/sysctl -n kern.disks` or `/sbin/camcontrol devlist`

Create disk GPT partition table: `/sbin/gpart create -s GPT ${disk}`

Create disk MBR partition table: `/sbin/gpart create -s MBR ${disk}`

Delete disk partition table: `/sbin/gpart destroy -F ${disk}`

Add disk partition: `/sbin/gpart add -t freebsd-ufs -b 128 -a 4k ${drive}` (incl. 4K alignment)

Delete disk partition: `/sbin/gpart delete -i ${partition} ${disk}`

Format disk partition: `/sbin/newfs -S4096 -b32768 -f4096 -O2 -U -m 0 /dev/${disk}${partition}` (incl. 4K alignment)

Mounting disk partition: `/sbin/mount -o noatime,rw /dev/${disk}${partition} ${path}`

Check if HDD spinning: `smartctl -i -n never /dev/da0 | grep "Power mode" | awk '{ print $4 }'` (needs pkg **smartmontools**)

Put HDD into sleep mode:
```
/sbin/camcontrol standby ${disk}      #(for SATA/IDE controllers - adaX devices)
/sbin/camcontrol stop ${disk}         #(for SAS/SCSI controllers - daX devices)
```

HDD/SSD/other devices stats: `iostat -w1` (in bytes per second)


Memory disk
---
Create memory disk:
```
/sbin/mdconfig -a -t malloc -s ${size} -u 0 -o reserve
/sbin/newfs -U /dev/md0
/sbin/mount /dev/md0 ${path}
```

Destroy memory disk:
```
/sbin/umount -f /dev/md0
/sbin/mdconfig -d -u 0
```


GELI (disk encryption)
---
Create random keyfile: `/bin/dd if=/dev/random of=${keyfile} bs=6597 count=123` (creates key of size 6597*123= 811431 bytes)

Create GELI encrypted partition: `/sbin/geli init -K ${keyfile} -J -s 4096 -l 256 ${disk}${partition}` (incl. 4K alignment)

Attaching GELI encrypted partition: `/sbin/geli attach -k ${keyfile} -j ${disk}${partition}` (creates new device **${disk}${partition}.eli**)

Detaching GELI encrypted partition: `/sbin/geli detach ${disk}${partition}.eli`


File crypting
---
Encrypt file with AES256:
```
/usr/local/bin/openssl enc -aes256 -pass pass:"${password}" -salt -in "${filename}" -out "${crypted_filename}" -e
```

Decrypt file with AES256:
```
/usr/local/bin/openssl enc -aes256 -pass pass:"${password}" -salt -in "${crypted_filename}" -out "${output_filename}" -d
```


Network
---
Get network interface status: `ifconfig`

Set network interface: `ifconfig ${interface} inet ${ipaddress} netmask ${netmask}`

Set network interface alias: `ifconfig ${interface} inet ${ipaddress} netmask ${netmask} alias`

Delete network interface alias: `ifconfig ${interface} inet ${ipaddress} netmask ${netmask} -alias`

Get routing table: `netstat -nr`

Get open TCP/UDP ports: `netstat -na`

Set default route (gateway): `route add -net default 1.2.3.4`

Get network stats: `netstat -w1` (in bytes, can be used **-w8** to get in bits per second)


Firewall/IPFW2
---
Get IPFW rules incl. number of packets and bytes: `ipfw -a list`

List content of table: `ipfw table ${table_name} list`

Add item into table: `ipfw table ${table_name} add 0.0.0.0/32`


Let's Encrypt (needs pkg **py37-certbot**)
---
Create certificate: `certbot --email address@domain.com --agree-tos --manual-public-ip-logging-ok -d "domain.com" -d "*.domain.com" --manual --preferred-challenges dns certonly`

Line to add to authoritative DNS zone: `_acme-challenge         IN      300     TXT     vgZn1G26PK5Btvh9f14-xHRI8KwnPf3BWe8Q8r1wS23`

Renew certificates: `certbot renew` (needs pkg **py37-certbot**)


OpenSSL
---
Create self-signed cert: `openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365`

Remove password from SSL key: `openssl rsa -in www.key -out new.key`


OpenVPN
---
Create server cert:
```
cp -r /usr/local/share/easy-rsa /usr/local/etc/openvpn/easy-rsa
cd /usr/local/etc/openvpn/easy-rsa
joe vars
source vars
./easyrsa.real init-pki
./easyrsa.real gen-dh
./easyrsa.real build-ca
./easyrsa.real build-server-full server
cp /usr/local/etc/openvpn/easy-rsa/pki/dh.pem /usr/local/etc/openvpn/dh2048.pem
cp /usr/local/etc/openvpn/easy-rsa/pki/ca.crt /usr/local/etc/openvpn
cp /usr/local/etc/openvpn/easy-rsa/pki/private/server.key /usr/local/etc/openvpn
cp /usr/local/etc/openvpn/easy-rsa/pki/issued/server.crt /usr/local/etc/openvpn
```

Create TLS key: `openvpn --genkey --secret /usr/local/etc/openvpn/ta.key`

Remove password from private key: `openssl rsa -in /usr/local/etc/openvpn/server.key -out /usr/local/etc/openvpn/server.key`

Generate client cert:
```
cd /usr/local/etc/openvpn/easy-rsa
./easyrsa.real build-client-full client1
```


Sendmail
---
Generate missing **dh.param** for Sendmail:
```
cd /etc/mail/certs
openssl dhparam -out dh.param 4096
cd /etc/mail && make restart
```

Update ClamAV virus database: `freshclam`


Zabbix
---
Run local agent: `zabbix_get -s127.0.0.1 -k'net.tcp.dns[SERVER]'` (for debug purposes)


Audio/Video
---
Get video parameters: (needs pkg **ffmpeg**)
```
ffprobe -v quiet -print_format json -show_format -show_streams -print_format json "${filename}"
```
