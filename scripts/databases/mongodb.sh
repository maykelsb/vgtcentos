#!/usr/bin/env bash

echo "==============================================================================="
# Instruções de instalação: https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/
echo ">>> Instalando o repositório com o mongodb3.2"
sudo touch /etc/yum.repos.d/mongodb-org-3.2.repo
sudo echo "[mongodb-org-3.2]" >> /etc/yum.repos.d/mongodb-org-3.2.repo
sudo echo "name=MongoDB Repository" >> /etc/yum.repos.d/mongodb-org-3.2.repo
sudo echo "baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.2/x86_64/" >> /etc/yum.repos.d/mongodb-org-3.2.repo
sudo echo "gpgcheck=1" >> /etc/yum.repos.d/mongodb-org-3.2.repo
sudo echo "enabled=1" >> /etc/yum.repos.d/mongodb-org-3.2.repo
sudo echo "gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc" >> /etc/yum.repos.d/mongodb-org-3.2.repo

echo ">>> Instalando o pacote mongodb3.2 completo"
sudo yum install -y mongodb-org

echo ">>> Verificando se tem o PHP instalado para adicionar o drive de comunicação"
if type php > /dev/null; then
    echo ">>> PHP instalado. Instalando php56w-devel para compilação do módulo"
    sudo yum install -y php56w-devel

    echo ">>> Instalando o openssl-devel para compilação do módulo"
	sudo yum install -y openssl-devel

    echo ">>> Baixando a extensão mongodb 1.1.6 do pecl"
    wget https://pecl.php.net/get/mongodb-1.1.6.tgz .

    echo ">>> Descompactando..."
    tar -zxvf mongodb-1.1.6.tgz

    echo ">>> Instalando..."
    cd mongodb-1.1.6
    sudo pecl install mongodb
    cd ..
    rm -rf mongodb-1.1.6

    echo ">>> Habilitando o módulo"
    sudo touch /etc/php.d/mongodb.ini
    sudo echo "extension=mongodb.so" >> /etc/php.d/mongodb.ini

    echo ">>> Reiniciando o apache"
    sudo httpd -k restart
fi
echo "==============================================================================="
