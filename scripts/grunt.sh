#!/usr/bin/env bash

echo "==============================================================================="
echo ">>> Verificando se o NPM está instalado"
if ! type npm > /dev/null; then
    echo "ERRO: NPM não está instalado. Abortando o provisionamento do grunt"
    exit 1
fi

echo ">>> Instalando o grunt"
sudo npm install -g grunt-cli
echo "==============================================================================="

#$npm install grunt-contrib-clean --save-dev
#$npm install grunt-contrib-copy --save-dev
