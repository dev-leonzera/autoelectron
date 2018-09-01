#!/bin/bash

# Montando o diretório onde será criada a pasta do projeto
echo "Informe onde será criado o projeto:  "
read var
diretorio=$var
#Verificando se o diretório já existe. Se não,cria e monta. Se sim,apenas monta
if [ -d "$diretorio" ]; then
    cd $diretorio
else
    mkdir $diretorio && cd $diretorio
fi
#Prompt para o usuário pedindo o nome para a pasta do projeto
echo "Qual será o nome do projeto? "
#Guarda o nome digitado pelo usuário na variável
read nome
#Cria e monta a pasta com o nome do projeto
mkdir $nome && cd $nome
#Cria a pasta onde ficarão os arquivos .css
mkdir css
#Cria a pasta onde ficarão os controladores .js
mkdir app
#Cria a pasta onde ficarão as imagens
mkdir img
#Cria o arquivo de estilo vazio
touch style.css
#Cria o arquivo do controlador vazio
touch controller.js
#Move o arquivo "style.css" para a pasta css
mv style.css css/
#Move o arquivo do controlador para a pasta app
mv controller.js app/
#Clona o repositório com a versão básica do Electron
git clone https://github.com/leonandrade/electron-quick-start
#Move todo o conteúdo da pasta do repositório para a pasta acima
mv electron-quick-start/* ./
#Apaga a pasta do repositório
rm -rf electron-quick-start/
#Instala as dependências do projeto
npm install && npm audit-fix
#Instala o pacote Electron Packager Interactive
npm install electron-packager-interactive

