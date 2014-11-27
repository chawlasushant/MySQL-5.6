FROM isntall/centos6-base

# Install latest mysql 5.6 version
RUN rpm -ivh http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
RUN yum install -y mysql-community-client mysql-community-server

# Add custom scripts to the container
ADD mysql.sh /tmp/
ADD run.sh /tmp/
ADD my.cnf /etc/my.cnf
RUN touch /var/log/mysqld.log
RUN chmod 755 /tmp/mysql.sh
RUN chmod 755 /tmp/run.sh

RUN mkdir -p /extended/var/lib/mysql
RUN chown mysql.mysql /extended/var/lib/mysql -R
RUN chmod 755 /extended/var/lib/mysql -R

# Open port 3306 for mysql communication
EXPOSE 3306

# Install apache & php
RUN yum install -y httpd httpd-devel yum install php-mysqli php-mbstring php-mysql php php-devel

# Add phpmyadmin 
ADD phpmyadmin /var/www/html/
RUN chown apache.apache /var/www/html/* -R

# Open port80 for apache
EXPOSE 80

# Start apache & mysql

CMD ["/bin/sh", "/tmp/run.sh"]
