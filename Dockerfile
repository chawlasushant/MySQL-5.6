FROM isntall/centos6-base

RUN rpm -ivh http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
RUN yum install -y mysql-community-client mysql-community-server
ADD mysql.sh /tmp/
ADD run.sh /tmp/
ADD my.cnf /etc/my.cnf
RUN chmod 755 /tmp/mysql.sh
RUN chmod 755 /tmp/run.sh
EXPOSE 3306

RUN yum install -y httpd httpd-devel php-mysqli php-mbstring php-mysql php php-d                                                                                        evel
ADD phpmyadmin /var/www/html/
RUN chown apache.apache /var/www/html/* -R
EXPOSE 80

CMD ["/bin/sh", "/tmp/run.sh"]
