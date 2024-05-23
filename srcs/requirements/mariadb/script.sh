#!/bin/sh

service mysql start;

mysql -v -u root << EOF
CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
SET PASSWORD FOR 'root'@'%' = PASSWORD('$SQL_ROOT_PASSWORD');
FLUSH PRIVILEGES;
EOF

sleep 5

service mysql stop

exec $@
