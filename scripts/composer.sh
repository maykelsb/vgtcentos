#!/usr/bin/env bash

echo "==============================================================================="
echo ">>> Instalando o composer"
echo ">>> Verificando se o PHP está instalado"
if ! type php > /dev/null; then
    RED='\033[0;31m'
    printf("${RED}PHP não está instalado. Abortando o provisionamento do composer")
    exit 1
fi
echo ">>> Procedendo com a instalação do composer"
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === '41e71d86b40f28e771d4bb662b997f79625196afcca95a5abf44391188c695c6c1456e16154c75a211d238cc3bc5cb47') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/bin/ --filename=composer
php -r "unlink('composer-setup.php');"
echo "==============================================================================="
