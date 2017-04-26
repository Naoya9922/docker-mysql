#!/bin/bash
set -ex

mysqld_safe & 
sleep 5
dinit /var/run/mysqld/mysqld.pid mysqld_safe


