Just few tips
===
- FreeBSD has disabled direct root SSH login by default. Well, better leave it like it is.
- Where is kernel configuration? `/usr/src/sys/amd64/conf` or `/usr/src/sys/i386/conf`
- How to create own configured kernel? Just copy configuration directory, make changes and build new kernel.
- Where are 3rd party software or ports installed? `/usr/local` so configurations will be in `/usr/local/etc`, libraries in `/usr/local/lib`, binaries in `/usr/local/bin`
- Where is last startup log? `/var/run/dmesg.boot`
- Like colored file lists? Add `alias ls        ls -G` into **.profile** file.

Strange problems
===
- OS upgrade end with `/usr/sbin/freebsd-update: cannot open files/.gz: No such file or directory` - the problem is mixed versions of some files in your system (cheksum mismatch) probably caused by messed up/interrupted upgrade before - the only 100% working solution is to reinstall OS

