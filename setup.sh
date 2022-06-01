#!/bin/bash
# To setup http server config at first time
if [ ! -d /var/www/html/ubuntu/ ]; then
    mkdir -p /var/www/html/ubuntu/
fi

sed -i '12s|DocumentRoot /var/www/html|DocumentRoot /var/www/html/ubuntu/mirror|' /etc/apache2/sites-enabled/000-default.conf

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid

echo "[$(date)] Starting apache server"
service apache2 start

while true; do
    echo "[$(date)] Starting apt-mirror"
    apt-mirror
    echo "[$(date)] Completed"
    if [ ! -e /var/www/html/ubuntu/var/cnf.sh ]; then
        echo "[$(date)] Copy cnf.sh to var directory"
        cp /cnf.sh /var/www/html/ubuntu/var/cnf.sh
    fi
    echo "[$(date)] Starting cnf synchronization"
    source /var/www/html/ubuntu/var/cnf.sh
    echo "[$(date)] Completed"
    echo "[$(date)] Sleeping $RESYNC_PERIOD to execute apt-mirror again ======"
    sleep "$RESYNC_PERIOD"
done
