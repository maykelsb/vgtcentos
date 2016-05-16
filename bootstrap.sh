#!/usr/bin/env bash

#REPOSITORIOS=$1
#for i in "$REPOSITORIOS"
#do
#    echo ">>> Repo: ${i}"; sudo rpm -Uvh ${i}
#done

echo "==============================================================================="
echo ">>> Desligando o firewall"
sudo systemctl disable firewalld
sudo systemctl stop firewalld

echo ">>> Adicionando novos repositorios ao yum"
sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm http://mirror.webtatic.com/yum/el7/webtatic-release.rpm

echo ">>> Atualizando metadatas dos repositórios yum"
sudo yum makecache fast


# Está quebrando a montagem de /vagrant
#echo "==============================================================================="
#echo ">>> Atualizando os pacotes atualmente instalados"
#sudo yum update -y
#echo "==============================================================================="

echo ">>> Instalando wget e curl"
sudo yum -y install wget curl

echo ">>> Desabilitando o SELinux"
sudo sed -i 's/SELINUX=permissive/SELINUX=disabled/g' /etc/sysconfig/selinux
echo "==============================================================================="
