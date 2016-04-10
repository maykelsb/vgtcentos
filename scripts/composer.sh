#!/usr/bin/env bash

echo "==============================================================================="
echo ">>> Instalando o composer"
echo ">>> Verificando se o PHP está instalado"
if ! type php > /dev/null; then
    echo "ERRO: PHP não está instalado. Abortando o provisionamento do composer"
    exit 1
fi
echo ">>> Procedendo com a instalação do composer"
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '${1}') { echo 'Installer verified'; } else { echo 'Installer corrupt - Maybe there is a new version of composer? - https://getcomposer.org/download/'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/bin/ --filename=composer
php -r "unlink('composer-setup.php');"
echo "==============================================================================="
