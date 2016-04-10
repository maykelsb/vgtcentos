#!/usr/bin/env bash

echo "==============================================================================="
echo ">>> Instalando o bower"
echo ">>> Verificando se o NPM está instalado"
if ! type npm > /dev/null; then
    RED='\033[0;31m'
    printf("${RED}NPM não está instalado. Abortando o provisionamento do bower")
    exit 1
fi
echo ">>> Procedendo com a instalação do bower"
sudo npm install -g bower
echo "==============================================================================="
