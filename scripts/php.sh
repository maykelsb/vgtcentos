#!/usr/bin/env bash
# @todo Verificar a necessidade de alterar o DirectoryIndex index.html

echo "==============================================================================="
echo ">>> Instalando o PHP5.6"
sudo yum -y install php56w php56w-opcache php56w-intl php56w-pdo php56w-pecl-xdebug php56w-xml php56w-mbstring php56w-process

echo ">>> Configurando a Timezone do php para ${1}"
sudo sed -i 's/;date.timezone =/date.timezone = America\/Sao_Paulo/g' /etc/php.ini

echo ">>> Configurando a Timezone do php para ${1}"
sudo sed -i 's/display_errors = Off/display_errors = On/g' /etc/php.ini

# Se o apache estiver instalado, reinicia-o
if type httpd > /dev/null; then
  echo ">>> Reiniciando o apache"
  sudo httpd -k restart
fi
echo "==============================================================================="

# @todo Setar as configurações do PHP para development

