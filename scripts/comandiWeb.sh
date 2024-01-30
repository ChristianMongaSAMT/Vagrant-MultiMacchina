#!/bin/bash

# Install apache and php
sudo apt-get update -y
sudo apt install -y apache2

# Enable rewrite 
sudo a2enmod rewrite

# Install php and mysql modules
sudo apt install php libapache2-mod-php -y
sudo apt-get install php-mysql -y

#sudo phpenmod mysqli
sudo systemctl restart apache2.service 

echo "Installation completed successfully"