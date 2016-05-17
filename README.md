# vgtcentos
Provisionamento de uma máquina CENTOS7 com bash

## Info ##
* Provider: VirtualBox
* Box: matyunin/centos7
* Provisioning: bash

## Provisionamentos ##
* wget + cUrl
* Apache (10080) + VHOSTs
* PHP
* | - Pecl php_mongodb 1.1.6
* Composer
* JS
* | - NPM
* | - Bower
* | - Grunt
* Symfony installer
* Apps
* | - Lynx
* | - Telnet
* MongoDB (27017)

## Utilização ##
Se precisar provisionar código fonte do host para o guest, use a seguinte estrutura de diretórios
.
|-projeto
|-src_projeto

Caso contrário, basta criar um diretório para o projeto e mandar um git clone. Nos dois casos, entre no diretório "projeto" e execute o comando:
> git clone https://github.com/maykelsb/vgtcentos.git .

Quando terminar o clone, edite o arquivo `Vagrantfile` e descomente os provisionamentos que vai utilizar. No começo do arquivo, tem algumas variáveis que precisam ser preenchidas.

As variáveis que precisam ser preenchidas são:
* `git_repo`: utilizada para várias configurações de host e vhost, além de ser utilizada para mapeamento do diretório de src_ do projeto
* `hash_composer`: hash utilizado para verificar a instalação do composer, deve corresponder sempre à última do getcomposer.org

As demais variáveis não precisam ser alteradas.


**Importante**: Para utilizar o Apache, não se esqueça de fazer o redirecionamento do `hosts` na máquina host.


Colaborações são muito bem vindas!! ^^
