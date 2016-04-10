#!/usr/bin/env bash

echo "==============================================================================="
echo ">>> Instalando o bower"
echo ">>> Verificando se o NPM está instalado"
if ! type npm > /dev/null; then
    echo "NPM não está instalado. Abortando o provisionamento do bower"
    exit 1
fi
echo ">>> Procedendo com a instalação do bower"
sudo npm install -g bower
echo "==============================================================================="
