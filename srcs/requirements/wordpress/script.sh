sleep 10

sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = wordpress:9000|" /etc/php/7.3/fpm/pool.d/www.conf

cd /var/www/wordpress

wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=$SQL_HOST

wp core install --allow-root \
	--url="${DOMAIN_NAME}" \
	--title="${WP_TITLE}" \
	--admin_user="${WP_ADMIN_USER}" \
	--admin_password="${WP_ADMIN_PASSWORD}" \
	--admin_email="${WP_ADMIN_EMAIL}"

wp user create "$WP_USER" "$WP_EMAIL" --allow-root \
	--user_pass="${WP_PASSWORD}" \
	--role="${WP_ROLE}"

/usr/sbin/php-fpm7.3 -F -R
