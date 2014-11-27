#!/bin/bash

/bin/sh /tmp/mysql.sh start
mysqladmin -uroot password "test1234"
/etc/init.d/httpd start
tail -f /var/log/mysqld.log
