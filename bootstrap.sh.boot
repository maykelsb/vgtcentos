#!/usr/bin/env bash

echo ">>> Adicionando repositorio webtatic"
sudo rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
echo ">>> Adicionando repositorio do postgresql"
sudo rpm -Uvh http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm

echo ">>> Atualizando os pacotes da maquina"
sudo yum update -y

#echo ">>> Instalando telnet"
#sudo yum -y install telnet

echo ">>> Instalando postgresql-server"
sudo yum -y install postgresql93-server postgresql93-contrib
echo ">>> Iniciando o banco de dados postgresql93"
sudo service postgresql-9.3 initdb
echo ">>> Ativando inicializaco automatica"
sudo chkconfig postgresql-9.3 on

echo ">>> Iniciando o servico postgresql93"
sudo service postgresql-9.3 start
echo ">>> Definindo nova senha para o usuario postgres no banco"
sudo su postgres << EOF
psql -c "ALTER USER postgres WITH ENCRYPTED PASSWORD 'postgres';"
EOF

echo ">>> Ativando conexoes remotas"
sudo printf "listen_addresses = '*'\nport = 5432\n" >> /var/lib/pgsql/9.3/data/postgresql.conf
echo ">>> Mudando autenticacao para md5"
sudo sed -i 's/peer$/md5/g' /var/lib/pgsql/9.3/data/pg_hba.conf
sudo sed -i 's/ident$/md5/g' /var/lib/pgsql/9.3/data/pg_hba.conf
# Acesso negado
#echo ">>> Adicionando nova regra de conexao no pg_hba.conf"
#sudo printf "\nhost all all 10.0.2.2/32 md5\n" >> /var/lib/pgsql/9.3/data/pg_hba.conf

echo ">>> Instalando apache"
sudo yum -y install httpd httpd-devel
echo ">>> Ativando inicializacao automatica"
sudo chkconfig -add httpd
sudo chkconfig httpd on

echo ">>> Criando links de diretorios de projetos"
echo "Dialogos"
sudo ln -fs /vagrant/dialogos /var/www/dialogos

echo ">>> Ajustando permissoes do diretório /var/www"
sudo chmod 755 /var/www

echo ">>> Copiando configuracoes de vhosts para o servidor"
sudo cp /vagrant/vhosts.conf /etc/httpd/conf.d/vhosts.conf

echo ">>> Criando diretorios de log"
sudo mkdir -p /vagrant/httpd/errors

echo ">>> Instalando PHP5.5"
sudo yum -y install php55w php55w-common php55w-pdo php55w-pecl-xdebug php55w-pgsql php55w-xml

#echo ">>> Instalando phpPgAdmin"
#sudo yum -y install phpPgAdmin
#echo ">>> Liberando acesso externo ao phpPgAdmin"
#sudo sed -i 's/Deny from all/Allow from all/g' /etc/httpd/conf.d/phpPgAdmin.conf
#echo ">>> Desligando autenticacao segura no phpPgAdmin"
#sudo sed -i "s/\$conf\['extra_login_security'\] = true;/\$conf\['extra_login_security'\] = false;/g" /etc/phpPgAdmin/config.inc.php


echo ">>> Iniciando o servidor web"
sudo service httpd start

# Guest additions
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

https://gist.github.com/fernandoaleman/5083680

sudo yum install dkms

https://www.virtualbox.org/manual/ch04.html#idp54739648



#composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer


#symfony
sudo yum -y install php55w-intl
sudo yum -y install icu


sudo vi /etc/php.ini
date.timezone = "America/Sao_Paulo"

http://ecumenicalmoth.wordpress.com/2013/12/05/cache-and-logs-directory-permissions-problems-w-vagrant-and-symfony2-ubuntu-precise64/

sudo yum -y install git

chown vagrant.vagrant -R /var/lib/php/session

sudo yum -y install php55w-mbstring

sudo yum install ruby

sudo yum install rubygems

sudo gem install sass

sudo yum install glibc

sudo yum install glibc.i686

udo rpm -Uvh http://downloads.sourceforge.net/project/wkhtmltopdf/0.12.1/wkhtmltox-0.12.1_linux-centos6-amd64.rpm



