#!/bin/sh
#
# Split default route into 8 smaller routes to avoid
# lock contention during route lookup
#
# If a default router is not specified, it will be 
# taken from rc.conf.
#

ROUTECMD="/sbin/route -q "
ROUTES="0.0.0.0/3 32.0.0.0/3 64.0.0.0/3 96.0.0.0/3 128.0.0.0/3 160.0.0.0/3 192.0.0.0/3 224.0.0.0/3"

if [ $# -lt 1 ]; then
	echo "syntax: $0 [start|stop]"
	exit 1
fi

case $1 in
	start)
		GW=`sysrc -n defaultrouter`
		echo "splitgateway: Assuming ${GW} from rc.conf..."

		for R in ${ROUTES}; do
			${ROUTECMD} add -net ${R} ${GW}
		done
		;;
	stop)
		for R in ${ROUTES}; do
			${ROUTECMD} delete -net ${R}
		done
		;;
esac


# no need to remove default route since it will never be matched
#${ROUTECMD} delete default
