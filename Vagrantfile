# Configurações do projeto
projectname = ""

# Timezone utilizada pelo PHP, o valor deve ser setado depois de instalar
php_timezone = "America/Sao_Paulo"

# Apache config
httpd_servername = "apacheserv"
httpd_port = 10080

Vagrant.configure(2) do |config|
  config.vm.box = "matyunin/centos7"

  # pasta de projeto
  #config.vm.synced_folder "../src_#{projectname}", "/var/www/#{projectname}"

  # Desligando o firewall, adicionando novos repositorios e atualizando pacotes instalados
  #config.vm.provision :shell, path: "bootstrap.sh"#, args: yum_repositories

  # Provisionando o APACHE
  #config.vm.network "forwarded_port", guest: 80, host: httpd_port
  #config.vm.provision :shell, path: "scripts/apache.sh", args: httpd_servername

  # Configurando VHOST do projeto
  #config.vm.provision :shell, path: "scripts/vhost.sh", args: projectname
  
  # Adicionando o vhost ao /etc/hosts da vm
  #config.vm.provision :shell, path: "scripts/hosts.sh", args: projectname

  # Provisionando o PHP5.6
  #config.vm.provision :shell, path: "scripts/php.sh", args: php_timezone
  
  # Provisionando o Composer
  #config.vm.provision :shell, path: "scripts/composer.sh"

  # Provisionando o NPM
  #config.vm.provision :shell, path: "scripts/npm.sh"
  
  # Provisionando o Bower
  #config.vm.provision :shell, path: "scripts/bower.sh"

  # Provisionando o Grunt
  #config.vm.provision :shell, path: "scripts/grunt.sh"

  # Provisionando o Symfony Installer
  #config.vm.provision :shell, path: "scripts/symfony.sh"

  # Criando um novo projeto Symfony
  # CUIDADO: este provisionamento irá apagar o diretório /var/www/#{projectname} e todo seu conteúdo
  #config.vm.provision :shell, path: "scripts/symfony/start.sh", args: projectname

  # Provisionamento de apps diversos: telnet
  #config.vm.provision :shell, path: "scripts/apps/telnet.sh"

  # Provisionamento de apps diversos: lynx - navegador de linha de comando
  #config.vm.provision :shell, path: "scripts/apps/lynx.sh"

  # Provisionamento do MongoDB 3.2
  #config.vm.network "forwarded_port", guest: 27017, host: 27017
  #config.vm.provision :shell, path: "scripts/databases/mongodb.sh"

  # Provisionamento do MariaDB
  #config.vm.network "forwarded_port", guest: 3306, host: 13306
  #config.vm.provision :shell, path: "scripts/databases/mariadb.sh", args: projectname
end
