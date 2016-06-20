#!/usr/bin/env bash

# Configuração de cada um dos vhosts da maquina
# fonte: https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-centos-7
echo "==============================================================================="
echo ">>> Criando a pasta do projeto (/var/www/${1}) e alterando permissões"
sudo mkdir -p /var/www/$1/web
sudo chown -R vagrant:vagrant /var/www/$1
sudo chmod -R 775 /var/www

echo ">>> Criando página demo"
touch /var/www/$1/web/index.html
echo "Bem vindo a ${1}" >> /var/www/$1/web/index.html

echo ">>> Criando arquivo /etc/httpd/sites-available/${1}.conf"
if ! [ -f /etc/httpd/sites-available/$1.conf ]; then
    sudo touch /etc/httpd/sites-available/$1.conf
    sudo echo "<VirtualHost *:80>" >> /etc/httpd/sites-available/$1.conf
    sudo echo "    ServerName ${1}" >> /etc/httpd/sites-available/$1.conf
    sudo echo "    ServerAlias ${1}" >> /etc/httpd/sites-available/$1.conf
    sudo echo "    DocumentRoot /var/www/${1}/web" >> /etc/httpd/sites-available/$1.conf
    sudo echo "    <Directory \"/var/www/${1}/web\">" >> /etc/httpd/sites-available/$1.conf
    sudo echo "        AllowOverride All" >> /etc/httpd/sites-available/$1.conf
    sudo echo "        Require all granted" >> /etc/httpd/sites-available/$1.conf
    sudo echo "    </Directory>" >> /etc/httpd/sites-available/$1.conf
    sudo echo "</VirtualHost>" >> /etc/httpd/sites-available/$1.conf

    echo ">>> Habilitando vhost /etc/httpd/sites-enabled/${1}.conf"
    sudo ln -s /etc/httpd/sites-available/$1.conf /etc/httpd/sites-enabled/$1.conf
fi

echo ">>> Reiniciando o apache"
sudo httpd -k restart
echo "==============================================================================="
