Usefull commands in FreeBSD
===

OS/system
---
Get server name: `uname -a`

Get size of system memory: `/sbin/sysctl -n hw.physmem`

Shutdown and poweroff: `shutdown -p now`

List of kernel modules loaded: `kldstat`

Load kernel module: `kldload coretemp`

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
```


OS/packages/ports
---
**Packages** = binary precompiled with default settings, in some cases is needed to use **pkg-static** instead of **pkg**
**Ports** = source, compiled on server, possibility to set different options

Search for package: `pkg search ${name}`

Install and uninstall package: (optional with parameter **-y** = yes to all confirmations)
```
pkg install ${name}
pkg delete ${name}
```

Lock and unlock package: (to prevent update to newer versions)
```
pkg lock ${name}
pkg unlock ${name}
```

Update package database: `pkg update`

Update packages: `pkg upgrade` (optional with parameter **-f** = forced)

Search for ports:
```
cd /usr/ports
make search name=${name}
```

Compile, install and uninstall port:
```
cd /usr/ports/${path}/${name}
make
make install
make deinstall
make clean        # clean directory after compilation (to force compiling everything from source again)
make distclean    # clean downloaded source files (to force of downloading them again)
```

Update ports:
```
cd /usr/ports
make update
```


Disk drives
---
Get list of disks: `/sbin/sysctl -n kern.disks` or `/sbin/camcontrol devlist`

Create disk GPT partition table: `/sbin/gpart create -s GPT ${disk}`

Create disk MBR partition table: `/sbin/gpart create -s MBR ${disk}`

Delete disk partition table: `/sbin/gpart destroy -F ${disk}`

Add disk partition: `/sbin/gpart add -t freebsd-ufs -b 128 -a 4k ${drive}`

Delete disk partition: `/sbin/gpart delete -i ${partition} ${disk}`

Format disk partition: `/sbin/newfs -S4096 -b32768 -f4096 -O2 -U -m 0 /dev/${disk}${partition}`

Mounting disk partition: `/sbin/mount -o noatime,rw /dev/${disk}${partition} ${path}`

Check if HDD spinning: `smartctl -i -n never /dev/da0 | grep "Power mode" | awk '{ print $4 }'` (needs pkg **smartmontools**)

Put HDD into sleep mode:
```
/sbin/camcontrol standby ${disk}      #(for SATA/IDE controllers - adaX devices)
/sbin/camcontrol stop ${disk}         #(for SAS/SCSI controllers - daX devices)
```


GELI (disk encryption)
---
Create random keyfile: `/bin/dd if=/dev/random of=${keyfile} bs=6597 count=123` (creates key of size 811431 bytes)

Create GELI encrypted partition: `/sbin/geli init -K ${keyfile} -J -s 4096 -l 256 ${disk}${partition}`

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
openssl enc -aes256 -pass pass:"${password}" -salt -in "${crypted_filename}" -out "${output_filename}" -d
```


Network
---
Get network interface status: `ifconfig`

Get routing table: `netstat -nr`

Get open TCP/UDP ports: `netstat -na`

Set default route (gateway): `route add default 1.2.3.4`
Get IPFW rules incl. number of packets and bytes: `ipfw -a list`


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


Sendmail
---
Generate dh.param for Sendmail:
```
cd /etc/mail/certs
openssl dhparam -out dh.param 4096
cd /etc/mail && make restart
```


Audio/Video
---
Get video parameters: (needs pkg **ffmpeg**)
```
ffprobe -v quiet -print_format json -show_format -show_streams -print_format json "${filename}"
```

