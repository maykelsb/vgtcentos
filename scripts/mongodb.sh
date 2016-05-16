#!/usr/bin/env bash

echo "==============================================================================="
# Instruções de instalação: https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/
echo ">>> Instalando o repositório com o mongodb3.2"
repoFile = /etc/yum.repos.d/mongodb-org-3.2.repo
sudo touch $repoFile
sudo echo "[mongodb-org-3.2]" >> $repoFile
sudo echo "name=MongoDB Repository" >> $repoFile
sudo echo "baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/" >> $repoFile
sudo echo "gpgcheck=1" >> $repoFile
sudo echo "enabled=1" >> $repoFile
sudo echo "gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc" >> $repoFile

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
    rm -rf mongodb-1.1.6
    cd ..

    echo ">>> Habilitando o módulo"
    sudo touch /etc/php.d/mongodb.ini
    sudo echo "extension=mongodb.so" >> /etc/php.d/mongodb.ini

    echo ">>> Reiniciando o apache"
    sudo httpd -k restart
fi
echo "==============================================================================="
