Usefull commands in FreeBSD
===

OS/system
---
Shutdown and poweroff: `shutdown -p now`

Get size of system memory: `/sbin/sysctl -n hw.physmem`

Get list of disks: `/sbin/sysctl -n kern.disks`

Check if HDD spinning: `smartctl -i -n never /dev/da0 | grep "Power mode" | awk '{ print $4 }'` (needs pkg **smartmontools**)

Sendmail
---
Generate dh.param for Sendmail:
```
cd /etc/mail/certs
openssl dhparam -out dh.param 4096
cd /etc/mail && make restart
```

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

Audio/Video
---
Get video parameters: `ffprobe -v quiet -print_format json -show_format -show_streams -print_format json "${i}"` (needs pkg **ffmpeg**)

