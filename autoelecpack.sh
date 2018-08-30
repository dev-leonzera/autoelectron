#!/bin/bash

echo 'Qual o nome do aplicativo?'

read nomeapp

echo 'Qual é a plataforma-alvo?'
echo 'Windows(win-32),Linux(linux) ou Mac(darwin)?'
read platf

echo 'Qual a arquitetura?(x32-x64)'
read arq


#electron-packager <sourcedir> <appname> --platform=<platform> --arch=<arch> 
