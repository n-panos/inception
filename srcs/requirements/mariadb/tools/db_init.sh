#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

if [ -d "/var/lib/mysql/$DB_DATABASE" ]
then 
	echo "Database already exists"
else

# Need root password to connect
mysql_secure_installation <<_EOF_

Y
123root
123root
Y
n
Y
Y
_EOF_

#Allow remote connexion
	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create db and user
	echo "CREATE DATABASE IF NOT EXISTS $DB_DATABASE; GRANT ALL ON $DB_DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Config file
mv /tmp/my.cnf /etc/mysql/my.cnf

fi

/etc/init.d/mysql stop

exec "$@"