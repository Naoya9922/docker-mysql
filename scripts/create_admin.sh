#!/bin/sh
set -e 
sleep 5
mysql -uroot -e "CREATE USER 'conyac'@'%' IDENTIFIED WITH sha256_password BY '';" mysql
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'conyac'@'%' WITH GRANT OPTION;" mysql
mysqladmin shutdown
