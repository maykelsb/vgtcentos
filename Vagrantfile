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
git_site = "github.com"
git_user = "maykelsb"
git_repo = "colecoes"
git_url = "https://#{git_site}/#{git_user}/#{git_repo}.git"

Vagrant.configure(2) do |config|
  config.vm.box = "matyunin/centos7"
  config.vm.network "forwarded_port", guest: 80, host: 10080

  # Desligando o firewall, adicionando novos repositorios e atualizando pacotes instalados
  config.vm.provision :shell, path: "bootstrap.sh"#, args: yum_repositories

  # Provisionando o APACHE
  config.vm.provision :shell, path: "scripts/apache.sh"

  # Configurando VHOST do projeto - repita para cada projeto
  config.vm.provision :shell, path: "scripts/hvost.sh", args: git_repo

  
  # Provisionando o PHP5.6
#  config.vm.provision :shell, path: "scripts/php.sh", args: php_timezone
  
  # Provisionando o Composer
#  config.vm.provision :shell, path: "scripts/composer.sh"
  
  # Provisionando o Bower
#  config.vm.provision :shell, path: "scripts/bower.sh"

  # Provisionando o Symfony
#  config.vm.provision :shell, path: "scripts/symfony.sh", args: symfony_root

  # Provisionando o Git
#  config.vm.provision :shell, path: "scripts/git.sh", args: [git_url, public_folder]
end
