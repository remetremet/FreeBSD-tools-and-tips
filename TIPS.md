Just few tips
===

FreeBSD has disabled direct root SSH login by default. Well, better leave it like it is.

Where is kernel configuration? `/usr/src/sys/amd64/conf` or `/usr/src/sys/i386/conf`

How to create own configured kernel? Just copy configuration directory, make changes and build new kernel.

Where are 3rd party software or ports installed? `/usr/local` so configurations will be in `/usr/local/etc`, libraries in `/usr/local/lib`, binaries in `/usr/local/bin`

Where is last startup log? `/var/run/dmesg.boot`

Like colored file lists? Add `alias ls        ls -G` info **.profile** file.
