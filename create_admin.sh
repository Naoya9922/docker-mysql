#!/bin/sh

if [ ! -e /var/lib/mysql/mysql ]; then
  mysql_install_db
fi

mysqld_safe > /dev/null 2>&1 &
sleep 5
mysql -uroot -e "CREATE USER 'root'@'%' IDENTIFIED BY '';" mysql
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" mysql
mysqladmin shutdown
