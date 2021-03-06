Usefull commands in FreeBSD
===

OS/system
---
Shutdown and poweroff: `shutdown -p now`

Get size of system memory: `/sbin/sysctl -n hw.physmem`


Disk drives
---
Get list of disks: `/sbin/sysctl -n kern.disks`

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

