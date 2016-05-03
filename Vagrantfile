# Repositórios adicionais a serem configurados no YUM
#yum_repositories = [
#	"https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm",
#	"https://mirror.webtatic.com/yum/el7/webtatic-release.rpm"
#]

# Timezone utilizada pelo PHP, o valor deve ser setado depois de instalar
php_timezone = "America/Sao_Paulo"

# Diretórios web
public_folder = "/vagrant"
symfony_folder = "/vagrant/symfony"

# Configurações do repositório do projeto
git_site = "github.com" #bitbucket.org
git_user = "maykelsb"
git_repo = "colecoes"
git_url = "https://#{git_site}/#{git_user}/#{git_repo}.git"

# Apache ServerName
httpd_servername = "apacheserv"

# Hash composer
hash_composer = "7228c001f88bee97506740ef0888240bd8a760b046ee16db8f4095c0d8d525f2367663f22a46b48d072c816e7fe19959"

Vagrant.configure(2) do |config|
  config.vm.box = "matyunin/centos7"
  config.vm.network "forwarded_port", guest: 80, host: 10080

  # pasta de projeto
  config.vm.synced_folder "../src_#{git_repo}", "/var/www/#{git_repo}"

  # Desligando o firewall, adicionando novos repositorios e atualizando pacotes instalados
  config.vm.provision :shell, path: "bootstrap.sh"#, args: yum_repositories

  # Provisionando o APACHE
  config.vm.provision :shell, path: "scripts/apache.sh", args: httpd_servername

  # Configurando VHOST do projeto - repita para cada projeto
  config.vm.provision :shell, path: "scripts/vhost.sh", args: git_repo
  
  # Adicionando o vhost ao /etc/hosts da vm
  config.vm.provision :shell, path: "scripts/hosts.sh", args: git_repo

  # Provisionando o PHP5.6
  config.vm.provision :shell, path: "scripts/php.sh", args: php_timezone
  
  # Provisionando o Composer
  config.vm.provision :shell, path: "scripts/composer.sh", args: hash_composer

  # Provisionando o NPM
  config.vm.provision :shell, path: "scripts/npm.sh"
  
  # Provisionando o Bower
  config.vm.provision :shell, path: "scripts/bower.sh"

  # Provisionando o Symfony Installer
  config.vm.provision :shell, path: "scripts/symfony.sh"

  # Criando um novo projeto Symfony
  # CUIDADO: este provisionamento irá apagar o diretório /var/www/#{git_repo} e todo seu conteúdo
  #config.vm.provision :shell, path: "scripts/symfony/start.sh", args: git_repo

  # Provisionamento de apps diversos: telnet
  config.vm.provision :shell, path: "scripts/apps/telnet.sh"

  # Provisionamento de apps diversos: lynx - navegador de linha de comando
  config.vm.provision :shell, path: "scripts/apps/lynx.sh"

end
