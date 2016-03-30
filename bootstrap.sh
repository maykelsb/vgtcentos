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

echo ">>> Instalando o composer"
sudo php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
sudo php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '41e71d86b40f28e771d4bb662b997f79625196afcca95a5abf44391188c695c6c1456e16154c75a211d238cc3bc5cb47') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/bin
sudo php -r "unlink('composer-setup.php');"
