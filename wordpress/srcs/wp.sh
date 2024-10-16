docker-php-entrypoint php-fpm &
until wp core install --url='http://localhost' --title=$WORDPRESS_DB_TITLE --admin_user=$WORDPRESS_DB_ADMIN --admin_password=$WORDPRESS_DB_ADMIN_PASSWORD --admin_email=$WORDPRESS_DB_ADMIN_EMAIL; do
echo 'Trying to install WordPress...'
sleep 5
done;
wp theme install $WORDPRESS_THEME --activate &&
wp user create newuser $WORDPRESS_DB_USER --role=author --user_pass=$WORDPRESS_DB_USER_PASSWORD
php-fpm --nodaemonize
