#!/usr/bin/env bash

echo "==============================================================================="
echo ">>> Instalando o instalador do Symfony"
sudo curl -LsS https://symfony.com/installer -o /usr/bin/symfony
sudo chmod a+x /usr/bin/symfony
echo "==============================================================================="
