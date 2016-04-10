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

echo ">>> Criando pasta de logs (/var/www/log/${1})"
sudo mkdir -p /var/log/httpd/$1

echo ">>> Criando arquivos de log: error.log e requests.log"
touch /var/log/httpd/$1_error.log
touch /var/log/httpd/$1_requests.log

# @todo: Verificar a existência desses arquivos antes de criá-los
echo ">>> Criando arquivo /etc/httpd/sites-available/${1}.conf"
if [ -f /etc/httpd/sites-available/$1.conf ]; then
    echo "ERRO: O arquivo /etc/httpd/sites-available/${1}.conf já existe. Abortando o provisionamento do VHOST"
    exit 1
fi
sudo touch /etc/httpd/sites-available/$1.conf
sudo echo "<VirtualHost *:80>" >> /etc/httpd/sites-available/$1.conf
sudo echo "    ServerName ${1}" >> /etc/httpd/sites-available/$1.conf
sudo echo "    ServerAlias ${1}" >> /etc/httpd/sites-available/$1.conf
sudo echo "    DocumentRoot /var/www/${1}/web" >> /etc/httpd/sites-available/$1.conf
sudo echo "    ErrorLog /var/www/log/${1}/error.log" >> /etc/httpd/sites-available/$1.conf
sudo echo "    CustomLog /var/www/log/${1}/requests.log combined" >> /etc/httpd/sites-available/$1.conf
sudo echo "</VirtualHost>" >> /etc/httpd/sites-available/$1.conf

echo ">>> Habilitando vhost /etc/httpd/sites-enabled/${1}.conf"
sudo ln -s /etc/httpd/sites-available/$1.conf /etc/httpd/sites-enabled/$1.conf

echo ">>> Reiniciando o apache"
sudo httpd -k restart
echo "==============================================================================="
