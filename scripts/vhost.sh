#!/usr/bin/env bash

# Configuração de cada um dos vhosts da maquina
# fonte: https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-centos-7
echo "==============================================================================="
echo ">>> Criando a pasta do projeto (/var/www/${1}) e alterando permissões"
sudo mkdir -p /var/www/$1/web
sudo chown -R vagrat:apache /var/www/$1
sudo chmod -R 755 /var/www
echo "==============================================================================="

echo "==============================================================================="
echo ">>> Criando página demo"
touch /var/www/$1/web/index.php
echo "Bem vindo a ${1}" >> /var/www/$1/web/index.php
echo "==============================================================================="

echo "==============================================================================="
echo ">>> Criando pasta de logs (/var/www/log/${1})"
sudo mkdir -p /var/www/log/$1
echo "==============================================================================="

echo "==============================================================================="
echo ">>> Criando arquivos de log: error.log e requests.log"
touch /var/www/log/$1/error.log
touch /var/www/log/$1/requests.log
echo "==============================================================================="

echo "==============================================================================="
echo ">>> Alterando permissões da pasta de log"
sudo chown -R vagrat:apache /var/www/log/$1
sudo chmod -R 755 /var/www/log/$1
echo "==============================================================================="

echo "==============================================================================="
echo ">>> Criando arquivo /etc/httpd/sites-available/${1}.conf"
sudo touch /etc/httpd/sites-available/$1.conf
sudo echo "<VirtualHost *:80>" >> /etc/httpd/sites-available/$1.conf
sudo echo "    ServerName ${1}" >> /etc/httpd/sites-available/$1.conf
sudo echo "    ServerAlias ${1}" >> /etc/httpd/sites-available/$1.conf
sudo echo "    DocumentRoot /var/www/${1}/web" >> /etc/httpd/sites-available/$1.conf
sudo echo "    ErrorLog /var/www/log/${1}/error.log" >> /etc/httpd/sites-available/$1.conf
sudo echo "    CustomLog /var/www/log/${1}/requests.log combined" >> /etc/httpd/sites-available/$1.conf
sudo echo "</VirtualHost>" >> /etc/httpd/sites-available/$1.conf
echo "==============================================================================="

echo "==============================================================================="
echo ">>> Habilitando vhost /etc/httpd/sites-enabled/${1}.conf"
sudo ln -s /etc/httpd/sites-available/$1.conf /etc/httpd/sites-enabled/$1.conf
echo "==============================================================================="

echo "==============================================================================="
echo ">>> Reiniciando o apache"
sudo apachectl restart
echo "==============================================================================="
