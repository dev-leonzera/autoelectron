#!/bin/bash

# Montando o diretório onde será criada a pasta do projeto
echo "Informe onde será criado o projeto:  "
# Guardando o caminho do diretório informado
read diretorio
#Verificando se o diretório já existe. Se não,cria e monta. Se sim,apenas monta
if [ ! -d "$diretorio" ]; then
  mkdir $diretorio && cd $diretorio
else
     cd $diretorio

#Prompt para o usuário pedindo o nome para a pasta do projeto
echo "Qual será o nome do projeto? "
#Guarda o nome digitado pelo usuário na variável
read nome
#
echo 'Qual o editor você vai usar?'
echo 'Atom - atom'
echo 'Visual Studio Code - code'
#
read editor
#Cria e monta a pasta com o nome do projeto
mkdir $nome && cd $nome
#Cria a pasta para os arquivos .js
mkdir app 
#Cria a pasta onde ficarão as páginas HTML
mkdir pages
#Cria a pasta onde ficarão os arquivos .css
mkdir css
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
git clone https://github.com/electron/electron-quick-start
#Move todo o conteúdo da pasta do repositório para a pasta acima
mv electron-quick-start/* ./
#Apaga a pasta do repositório
rm -rf electron-quick-start/
#Instala as dependências do projeto
npm install
#Move a página index para a pasta de páginas
mv index.html pages/
#Move o arquivo main para a pasta do app
mv main.js app/
#Abre o Visual Studio Code para edição na pasta do projeto

$editor .

#Passos restantes:
#1 - Editar o package.json,adicionando "app/ antes do main.js" na seção "main"
#2 - Editar o main.js,adicionando "pages/" antes do index.html na linha do mainWindow.loadFile()