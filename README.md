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
Quando terminar o clone, edite o arquivo `Vagrantfile` e descomente os provisionamentos que vai utilizar.

Colaborações são muito bem vindas!! ^^
