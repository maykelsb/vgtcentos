#!/usr/bin/env bash

echo "==============================================================================="
echo ">>> Instalando o PHP5.6"
sudo yum -y install php56w php56w-opcache php56w-intl php56w-pdo php56w-pecl-xdebug php56w-xml php56w-mbstring php56w-process
echo "==============================================================================="

echo "==============================================================================="
echo ">>> Configurando a Timezone do apache para ${1}"
sudo sed -i -- 's/date.timezone = /date.timezone = America/Sao_Paulo/g' /etc/php.ini    ## files ending in .baz
echo "==============================================================================="
