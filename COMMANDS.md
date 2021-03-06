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

Get size of system memory: `/sbin/sysctl hw.physmem`

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

Update package database: `pkg update`

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

Get routing table: `netstat -nr`

Get open TCP/UDP ports: `netstat -na`

Set default route (gateway): `route add default 1.2.3.4`

Get IPFW rules incl. number of packets and bytes: `ipfw -a list`

Get network stats: `netstat -w1` (in bytes, can be used **-w8** to get in bits per second)


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

