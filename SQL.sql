-- Comandos úteis mysql
sudo apt install mysql-server
sudo mysql -u root -p // acessar mysql via terminal
CTRL + L // limpar tela

-- Comandos úteis para se conectar ao servidor Ubuntu
sudo apt install openssh-server  // instalar openssh
sudo services ssh status   // status servidor ssh
ip addr  // visualizar ip maquina
sudo nano /etc/ssh/sshd_config  // config ssh
sudo service ssh stop  // para o servidor ssh
sudo service ssh start  // inicia o servidor ssh 
ssh <usuario-ubuntu>@<endereço-ip> -p <porta (padrão 22)> // acessar servidor ssh (password do ubuntu) 

-- Tipos de dados

VARCHAR - Dinâmico. Ocupa apenas os bytes necessários para a quantidade de chars inserido
CHAR - Não dinâmico. Ocupa a quantidade de bytes total da quantidade de posições especificadadas
ENUM - Constraint. Úsuário escolhe a opção desejada sem digitar. Os dados que entraram não sairão do conjunto definido.
FLOAT - Ex: float(10,2), 10 números totais com 2 deles estando após a vírgula. Números com virgula flutuante.
INT - Limite de 11 digitos (Não esquecer o range). Números inteiros.

/* Modelagem Básica */
/* Entidade = Tabela
   Campo = Atributo */

CLIENTE

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(30)
SEXO - CARACTER(1)

/* PROCESSOS DE MODELAGEM */

-- FASE 01 E FASE 02 - AD ADM DE DADOS

MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

-- FASE 03 - DBA / AD

MODELAGEM FÍSICA - SCRIPTS DE BANCO

/* INICIANDO A MODELAGEM FÍSICA */

-- CRIANDO O BANCO DE DADOS

CREATE DATABASE PROJETO; /* NÃO ESQUECER PONTO E VIRGULA */

-- CONECTANDO-SE AO BANCO

USE PROJETO;

-- CRIANDO A TABELA DE CLIENTES

CREATE TABLE CLIENTE (
    NOME VARCHAR(30),
    SEXO CHAR(1),
    EMAIL VARCHAR(30),
    CPF INT(11),
    TELEFONE VARCHAR(30),
    ENDERECO VARCHAR(100)
);

-- VERIFICANDO AS TABELAS DO BANCO 

SHOW TABLES;  -- SÓ EXISTE EM MYSQL

-- DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA

DESC CLIENTE;

/* SINTAXE BÁSICA DE INSERÇÃO */

INSERT INTO...

-- FORMA 01 - OMITINDO AS COLUNAS
-- VALORES DEVEM VIR NA LINHA DE COMANDO NA MESMA ORDEM DAS COLUNAS

INSERT INTO CLIENTE VALUES('JOAO', 'M', 'JOAO@GMAIL.COM', 988638273, '22923110', 'MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA', 'F', 'CELIA@GMAIL.COM', 541521456, '25078869', 'RIACHUELO - CENTRO - RIO DE JANEIRO- RJ' );

INSERT INTO CLIENTE VALUES('JORGE', 'M', NULL, 885755896, '58748895', 'OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

-- FORMA 02 - COLOCANDO AS COLUNAS

INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES('LILIAN', 'F', 'SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ', '947785696', 887774856);

-- FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL 

INSERT INTO CLIENTE VALUES('ANA', 'F', 'ANA@GLOBO.COM', 85548962, '548556985', 'PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F', 'CARLA@TERATI.COM.BR', 7745828, '66587458', 'SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');

/* O COMANDO SELECT */
-- PROJEÇÃO
-- PROJETA TABELAS QUE EXISTEM E QUE NÃO EXISTEM

SELECT NOW(); -- PROJETA TABELA COM DATA E HORA
SELECT NOW() AS DATA_HORA; -- UTILIZANDO ALIAS

SELECT 'FELIPPE'; -- PROJETA TABELA COM MEU NOME
SELECT NOW() AS DATA_HORA, 'FELIPPE' AS ALUNO; -- PROJETA TABELA COM COLUNAS DATA HORA E MEU NOME

SELECT 'BANCO DE DADOS'; -- PROJETA TABELA COM PALAVRA BANCO DE DADOS

/* ALIAS DE COLUNAS */

SELECT NOME, SEXO, EMAIL FROM CLIENTE;
SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE; -- COM ALIAS
SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE; -- ALTERANDO A ORDEM
SELECT NOME, SEXO, CPF, NOW() AS DATA_HORA FROM CLIENTE; -- COM DATA E HORA DE QUANDO FOI CRIADA A PROJEÇÃO

/* SOMENTE PARA FINS ACADEMICOS */

SELECT * FROM CLIENTE;
