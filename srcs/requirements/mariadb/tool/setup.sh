#!/bin/bash

mkdir ~/data/database

service mariadb start

mariadb -v << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_ADMIN'@'%' IDENTIFIED BY '$DB_PASS_ROOT';
SET PASSWORD FOR '$DB_ADMIN'@'localhost' = PASSWORD('$DB_PASS_ROOT');
EOF

sleep 5
service mariadb stop

exec $@
