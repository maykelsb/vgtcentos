#!/usr/bin/env bash

echo "==============================================================================="
echo ">>> Criando novo projeto: ${1}"
echo ">>> Verificando se o diretório /var/www/${1} já existe..."
if [ -d /var/www/$1 ]; then
  echo ">>> Removendo diretório /var/www/${1}..."
  sudo rm -rf /var/www/$1
fi
echo ">>> Criando o projeto em /var/www/${1}..."
sudo symfony new /var/www/$1
echo ">>> Ajustando permissões do diretório..."
sudo chown -R vagrant:apache /var/www/$1
sudo chmod -R 775 /var/www/$1

echo ">>> Executando php /var/www/${1}bin/symfony_requirements"
sudo php /var/www/${1}/bin/symfony_requirements
echo "==============================================================================="
