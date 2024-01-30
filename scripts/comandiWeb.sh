#!/bin/bash

# Install apache and php
sudo apt-get update -y
sudo apt install -y apache2
echo "Apache installed"

# Enable rewrite 
sudo a2enmod rewrite
echo "rewrite rule enabled"

# Install php and mysql modules
sudo apt install php libapache2-mod-php -y
sudo apt-get install php-mysql -y
echo "php and php-mysql installed"

#sudo phpenmod mysqli
sudo systemctl restart apache2.service 
echo "Apache restarted"

echo "Installation completed successfully"