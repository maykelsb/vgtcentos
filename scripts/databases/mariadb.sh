
echo "==============================================================================="
echo ">>> Instalando os pacotes mariadb e mariadb-server"
sudo yum install -y mariadb-server mariadb

echo ">>> Iniciando e instalando o serviço do mariadb"
sudo systemctl start mariadb;
sudo systemctl enable mariadb;

echo ">>> Verificando se tem o PHP instalado para adicionar o drive de comunicação"
if type php > /dev/null; then
    echo ">>> PHP instalado. Instalando php56w-mysqlnd"
    sudo yum install -y php56w-mysqlnd

    echo ">>> Reiniciando o apache"
    sudo httpd -k restart
fi
echo "==============================================================================="
