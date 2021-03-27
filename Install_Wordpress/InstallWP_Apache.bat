
sudo apt update
sudo apt install wordpress
sudo apt install php
sudo apt install libapache2-mod-php
sudo apt install mysql-server
sudo apt install php-mysql
sudo nano /etc/apache2/sites-available/wordpress.conf
#add this to ^ file
Alias /blog /usr/share/wordpress
<Directory /usr/share/wordpress>
    Options FollowSymLinks
    AllowOverride Limit Options FileInfo
    DirectoryIndex index.php
    Order allow,deny
    Allow from all
</Directory>
<Directory /usr/share/wordpress/wp-content>
    Options FollowSymLinks
    Order allow,deny
    Allow from all
</Directory>
###########
#save and exit
sudo a2ensite wordpress
sudo a2enmod rewrite
sudo service apache2 reload
sudo mysql -u root
#do follow commands
###########3
CREATE DATABASE wordpress;

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER
    -> ON wordpress.*
    -> TO wordpress@localhost
    -> IDENTIFIED BY '<your-password>';
FLUSH PRIVILEGES;
quit
###########
nano /etc/wordpress/config-localhost.php 
#add this lines to ^ file
<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'پسور مورد نظر ما');
define('DB_HOST', 'localhost');
define('DB_COLLATE', 'utf8_general_ci');
define('WP_CONTENT_DIR', '/usr/share/wordpress/wp-content');
?>
#save and exit
##########################
sudo service mysql start 
sudo ln -s /etc/wordpress/config-localhost.php /etc/wordpress/config-192.168.122.128.php