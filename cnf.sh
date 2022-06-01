#!/bin/bash
cd /var/www/html/ubuntu/mirror/

for p in "${1:-focal}"{,-{security,updates}}/{main,restricted,universe,multiverse};
do >&2 echo "${p}"
wget -e robots=off -l 0 -c -r -np -R -P "/var/www/html/ubuntu/mirror/mirror.yandex.ru/ubuntu/dists/${p}/cnf/" \
"http://mirror.yandex.ru/ubuntu/dists/${p}/cnf/Commands-amd64.xz"
wget -e robots=off -l 0 -c -r -np -R -P "/var/www/html/ubuntu/mirror/mirror.yandex.ru/ubuntu/dists/${p}/cnf/" \
"http://mirror.yandex.ru/ubuntu/dists/${p}/cnf/Commands-i386.xz"
wget -e robots=off -l 0 -c -r -np -R -P "/var/www/html/ubuntu/mirror/mirror.yandex.ru/ubuntu/dists/${p}/cnf/by-hash/SHA256/" \
"http://mirror.yandex.ru/ubuntu/dists/${p}/cnf/by-hash/SHA256/"
done
