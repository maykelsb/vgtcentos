
echo "==============================================================================="
echo ">>> Instalando os pacotes mariadb e mariadb-server"
sudo yum install -y mariadb-server mariadb

echo ">>> Iniciando e instalando o serviço do mariadb"
sudo systemctl start mariadb;
sudo systemctl enable mariadb;

echo ">>> Criando a base de dados ${1}"
mysql -uroot -e "CREATE DATABASE ${1} /*\!40100 DEFAULT CHARACTER SET utf8 */;"

echo ">>> Criando o usuario ${1} com senha '${1}'"
mysql -uroot -e "CREATE USER ${1}@localhost IDENTIFIED BY '${1}';"

echo ">>> Definindo permissões"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ${1}.* to '${1}'@'%';"
mysql -uroot -e "FLUSH PRIVILEGES;"

echo ">>> Verificando se tem o PHP instalado para adicionar o drive de comunicação"
if type php > /dev/null; then
    echo ">>> PHP instalado. Instalando php56w-mysqlnd"
    sudo yum install -y php56w-mysqlnd

    echo ">>> Reiniciando o apache"
    sudo httpd -k restart
fi
echo "==============================================================================="
