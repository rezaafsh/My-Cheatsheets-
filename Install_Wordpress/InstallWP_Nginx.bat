apt update
apt install nginx
systemctl stop nginx.service
systemctl start nginx.service
systemctl enable nginx.service
apt install mariadb-server mariadb-client
systemctl stop mysql.service
systemctl start mysql.service
systemctl enable mysql.service
apt install software-properties-common
add-apt-repository ppa:ondrej/php #after that press enter
apt update
apt install php7.1-fpm php7.1-common php7.1-mbstring php7.1-xmlrpc php7.1-soap php7.1-gd php7.1-xml php7.1-intl php7.1-mysql php7.1-cli php7.1-mcrypt php7.1-zip php7.1-curl
nano /etc/php/7.1/fpm/php.ini # and after that change this value to this 
####memory_limit = 256M
#upload_max_filesize = 100M
#max_execution_time = 360
#save and exit
mysql -u root -p ##passwordesh hamon password ubuntu hast
CREATE DATABASE wordpress;
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'reza1234';
GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'reza1234' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
cd /tmp && wget https://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz
mv wordpress /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress/
chmod -R 755 /var/www/html/wordpress/
nano /etc/nginx/sites-available/wordpress
#copy next lines to this ^ file
###################
server {
    listen 80;
    listen [::]:80;
    root /var/www/html/wordpress;
    index  index.php index.html index.htm;
    server_name  site_address;

     client_max_body_size 100M;

    location / {
        try_files $uri $uri/ /index.php?$args;        
    }

    location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass             unix:/var/run/php/php7.1-fpm.sock;
    fastcgi_param   SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
################
ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/
systemctl restart nginx.service
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
nano /var/www/html/wordpress/wp-config.php
#and edit this line with your info
##########
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpressuser');
define('DB_PASSWORD', 'reza1234');
##########save and exit
#####now you should be able to access the worpress via your domain name and ip on port 80