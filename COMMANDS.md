Usefull commands in FreeBSD
====

Shutdown and poweroff: `shutdown -p now`

Generate dh.param for Sendmail:
```
cd /etc/mail/certs
openssl dhparam -out dh.param 4096
cd /etc/mail && make restart
```

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

Get size of system memory: `/sbin/sysctl -n hw.physmem`

Get list of disks: `/sbin/sysctl -n kern.disks`

Get video parameters: `ffprobe -v quiet -print_format json -show_format -show_streams -print_format json "${i}"` (needs pkg **ffmpeg**)

