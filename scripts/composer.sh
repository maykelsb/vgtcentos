#!/usr/bin/env bash

echo "==============================================================================="
echo ">>> Checando se o composer está instalado"
if type composer > /dev/null; then
    echo ">>> O composer já está instalado. Executando atualização..."
    sudo composer self-update
    echo "==============================================================================="
else
    echo ">>> Instalando o composer"
    echo ">>> Verificando se o PHP está instalado"
    if ! type php > /dev/null; then
        echo "ERRO: PHP não está instalado. Abortando o provisionamento do composer"
        exit 1
    fi
    echo ">>> Procedendo com a instalação do composer"
    php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
    sudo php composer-setup.php --install-dir=/usr/bin/ --filename=composer
    php -r "unlink('composer-setup.php');"
fi
echo "==============================================================================="
