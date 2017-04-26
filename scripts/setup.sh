#!/bin/bash
set -e 

VOLUME_HOME="/var/lib/mysql"
cp /etc/mysql/scripts/my.cnf /etc/mysql/my.cnf

if [[ ! -d $VOLUME_HOME/mysql ]]; then
  mkdir -p /var/run/mysqld
  echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
  echo "=> Installing MySQL ..."
  if [ ! -f /usr/share/mysql/my-default.cnf ] ; then
    cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf
  fi
  mysqld --initialize-insecure  --log-error-verbosity=3
  mysqld_safe & 
  sleep 5
  #  > /dev/null 2>&1
  echo "=> Done!"
  /etc/mysql/scripts/create_admin.sh
else
   echo "=> Using an existing volume of MySQL"
fi
chown -R mysql:mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql

/etc/mysql/scripts/start.sh


