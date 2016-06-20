#!/usr/bin/env bash

echo "==============================================================================="
echo ">>> Instalando apache"
sudo yum -y install httpd httpd-devel

echo "Trocando o usuário do apache para vagrant:vagrant"
sudo sed -i 's/Group apache/Group vagrant/g' /etc/httpd/conf/httpd.conf
sudo sed -i 's/User apache/User vagrant/g' /etc/httpd/conf/httpd.conf

echo ">>> Configurando o ServerName para ${1}"
sudo sed -i "s/#ServerName www.example.com/ServerName ${1}/g" /etc/httpd/conf/httpd.conf

# Bug de virtualização com o apache
# https://gist.github.com/falexandrou/8965063
echo ">>> Desligando o sendfile"
sudo sed -i "s/EnableSendfile on/EnableSendfile off/g" /etc/httpd/conf/httpd.conf

echo ">>> Ativando inicializacao automatica do apache"
sudo systemctl enable httpd
sudo systemctl start httpd

# Configuração geral de vhosts
# fonte: https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-centos-7
echo ">>> Configurando vhost"
sudo mkdir /etc/httpd/sites-available
sudo mkdir /etc/httpd/sites-enabled
sudo echo "IncludeOptional sites-enabled/*.conf" >> /etc/httpd/conf/httpd.conf
echo "==============================================================================="
