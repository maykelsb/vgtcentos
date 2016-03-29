#!/usr/bin/env bash

echo ">>> Desligando o firewall"
sudo systemctl disable firewalld
sudo systemctl stop firewalld

echo ">>> Adicionando novos repositorios ao yum - php56w"
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

echo ">>> Atualizando os pacotes atualmente instalados"
sudo yum update -y

echo ">>> Instalando apache"
sudo yum -y install httpd httpd-devel

echo ">>> Ativando inicializacao automatica do apache"
sudo systemctl enable httpd
sudo systemctl start httpd

echo ">>> Instalando o PHP5.6"
sudo yum -y install php56w php56w-opcache php56w-intl php56w-pdo php56w-pecl-xdebug php56w-xml php56w-mbstring php56w-process

