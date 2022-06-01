# apt-mirror-apache-for-yc
This fork based on seterrychen/apt-mirror-http-server. Using Docker to construct your APT(Advanced Packaging Tools) mirror HTTP server. Mirrored Yandex repo for Ubuntu 20.04

# Usage
Basic command:

     docker run -d \
           -v /path/data:/var/www/html/ubuntu \
           -p 8080:80 krang/apt-mirror-apache-for-yc

    -v /path/data: the path which you want to store data

More options with docker command

    -e RESYNC_PERIOD=timeout-value: to set the resync period, default is 1 hour. To set the TIMEOUT format description
