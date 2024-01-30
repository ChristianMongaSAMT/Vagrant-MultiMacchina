#!/bin/bash
DBNAME=vagrantdb
DBUSER=dbuser
DBPASS=password
TABLENAME=prova

# Install mysql-server and php
sudo apt update -y
sudo apt install mysql-server -y

echo "mysql-server installed successfully"

# Create db, table, data and user
sudo mysql -uroot -e "CREATE DATABASE $DBNAME"

echo "Database created"

# Insert data into db
sudo mysql -uroot -e "USE $DBNAME; CREATE TABLE $TABLENAME (id INT PRIMARY KEY, nome VARCHAR(25), cognome VARCHAR(25));"
sudo mysql -uroot -e "USE $DBNAME; INSERT INTO $TABLENAME VALUES (1, 'Christian', 'Monga');"
sudo mysql -uroot -e "USE $DBNAME; INSERT INTO $TABLENAME VALUES (2, 'Giovanni', 'Rossi');"
sudo mysql -uroot -e "USE $DBNAME; INSERT INTO $TABLENAME VALUES (3, 'Marco', 'Verdi');"

echo "Data inserted into database"

# Create user
sudo mysql -uroot -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY '$DBPASS'"
sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON $DBNAME.* TO '$DBUSER'@'%'"

echo "User created successfully"

# Change every 127.0.0.1 to 0.0.0.0 to allow connections from every host
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart mysql service
sudo systemctl restart mysql.service

echo "mysql restarted"
echo "END"