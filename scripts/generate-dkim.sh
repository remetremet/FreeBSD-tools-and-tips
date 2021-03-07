#!/bin/sh

SELECTOR=remet
DOMAIN=${1}

if [ -z "${1}" ]; then
 echo "Usage: ${0} <domain>"
 exit 1
fi

if [ -f "/var/db/dkim/${DOMAIN}/${SELECTOR}.txt" ]; then
 echo "=> ERROR: found DKIM keys for ${DOMAIN} already"
 /bin/cat "/var/db/dkim/${DOMAIN}/${SELECTOR}.txt"
 exit 1
fi

echo "==> Generating DKIM key for ${DOMAIN}..."
/bin/mkdir "/var/db/dkim/${DOMAIN}"
/usr/sbin/chown mailnull:mailnull "/var/db/dkim/${DOMAIN}"
/usr/local/sbin/opendkim-genkey -a -b 2048 -d ${DOMAIN} -D "/var/db/dkim/${DOMAIN}" -s ${SELECTOR}
/usr/sbin/chown mailnull:mailnull "/var/db/dkim/${DOMAIN}/*"
echo "==> Done"

echo "==> Updating config to enable DKIM signing..."
echo "${SELECTOR}._domainkey.${DOMAIN}      ${DOMAIN}:${SELECTOR}:/var/db/dkim/${DOMAIN}/${SELECTOR}.private" >> "/usr/local/etc/mail/opendkim.keytable"
echo "*@${DOMAIN}       ${SELECTOR}._domainkey.${DOMAIN}" >> "/usr/local/etc/mail/opendkim.signingtable"
echo "==> Done"

echo "==> Reloading OpenDKIM configuration..."
/bin/pkill -USR1 -F "/var/run/milteropendkim/pid"
echo "==> Done"

echo "DKIM DNS entry to add is below:"
/bin/cat "/var/db/dkim/${DOMAIN}/${SELECTOR}.txt"
