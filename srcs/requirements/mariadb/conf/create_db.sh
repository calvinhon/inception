#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

echo "Initializing database..."
/usr/bin/mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';
CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

echo "Starting MariaDB..."
exec "$@"