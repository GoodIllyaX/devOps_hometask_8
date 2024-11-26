#!/bin/bash

apt update -y
apt install -y apache2 openssl

# Start Apache2
systemctl start apache2
systemctl enable apache2

echo "<html><body><h1>Hello, Apache is running!</h1></body></html>" > /var/www/html/index.html

openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost" -config /etc/ssl/openssl.cnf

# Configure Apache for SSL
echo "<VirtualHost *:80>
    Redirect permanent / https://localhost/
</VirtualHost>

<VirtualHost *:443>
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/apache-selfsigned.crt
    SSLCertificateKeyFile /etc/ssl/private/apache-selfsigned.key
    DocumentRoot /var/www/html
</VirtualHost>" > /etc/apache2/sites-available/default-ssl.conf

a2enmod ssl
a2ensite default-ssl.conf
systemctl restart apache2


