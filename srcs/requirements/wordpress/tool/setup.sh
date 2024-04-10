#!/bin/bash

# change the owner of the web site directory
chown -R www-data:www-data /var/www/inception/

# copy of the wp-config.php file
if [ ! -f "/var/www/inception/wp-config.php" ]; then
   mv /tmp/wp-config.php /var/www/inception/
fi

sleep 20

# wordpress file download
wp --allow-root --path="/var/www/inception/" core download || true

# instalation of all downloaded file and admin user creation
if ! wp --allow-root --path="/var/www/inception/" core is-installed;
then
    wp  --allow-root --path="/var/www/inception/" core install \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL

    # delet all useless plugins
    wp --allow-root --path="/var/www/inception/" plugin delete hello
    wp --allow-root --path="/var/www/inception/" plugin delete akismet
fi;

# check af good instalation of wordpress
if ! wp --allow-root --path="/var/www/inception/" core is-installed;
then
    echo "Failed to install wordpress"
    exit 1
fi;

# non admin user creation
if ! wp --allow-root --path="/var/www/inception/" user get $WP_USER;
then
    wp  --allow-root --path="/var/www/inception/" user create \
        $WP_USER \
        $WP_EMAIL \
        --user_pass=$WP_PASSWORD \
        --role=$WP_ROLE
fi;

# change oner of sone directory
chown -R www-data:www-data /var/www/inception/
chmod -R 755 /var/www/*

# start of php-fpm in forgrownd
exec $@