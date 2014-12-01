#!/bin/bash

# Start MySQL service
/bin/sh /tmp/mysql.sh start

# Set mysql root password
mysqladmin -uroot password "test1234"

# Start apache in foreground
/usr/sbin/httpd -DFOREGROUND

