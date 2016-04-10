#!/usr/bin/env bash

#REPOSITORIOS=$1
#for i in "$REPOSITORIOS"
#do
#    echo ">>> Repo: ${i}"; sudo rpm -Uvh ${i}
#done

echo "==============================================================================="
echo ">>> Desligando o firewall"
echo "==============================================================================="
sudo systemctl disable firewalld
sudo systemctl stop firewalld

echo "==============================================================================="
echo ">>> Adicionando novos repositorios ao yum"
echo "==============================================================================="
sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm http://mirror.webtatic.com/yum/el7/webtatic-release.rpm

echo "==============================================================================="
echo ">>> Atualizando o cache do yum"
echo "==============================================================================="
sudo yum makecache fast

#echo "==============================================================================="
#echo ">>> Atualizando os pacotes atualmente instalados"
#echo "==============================================================================="
#sudo yum update -y

echo "==============================================================================="
echo ">>> Instalando wget e curl"
echo "==============================================================================="
sudo yum install wget curl

echo "==============================================================================="
echo ">>> Fix de mapeamento do virtualbox"
echo "==============================================================================="
sudo ln -s /opt/VBoxGuestAdditions-4.3.20/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions