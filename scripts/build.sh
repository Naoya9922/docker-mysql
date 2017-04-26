#!/bin/bash 
set -e 
apt-get update 
apt-get -y --no-install-recommends install mysql-server-5.7  pwgen
apt-get clean 
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*
rm -rf /var/lib/mysql/*


