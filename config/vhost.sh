#!/usr/bin/env bash

cat > /etc/apache2/sites-available/vagrant.local.conf << EOF
<VirtualHost *:80>
   ServerAdmin webmaster@localhost
   ServerName vagrant.local
   ServerAlias www.vagrant.local
   DocumentRoot "/home/vagrant/www"
   <Directory "/home/vagrant/www">
      Require all granted
   </Directory>
   CustomLog /var/log/apache2/vagrant.local-access.log combined
   ErrorLog /var/log/apache2/vagrant.local-error.log
</VirtualHost>
EOF

a2ensite vagrant.local
a2dissite 000-default

service apache2 restart
