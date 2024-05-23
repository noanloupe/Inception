sleep 10

wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

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