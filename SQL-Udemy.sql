-- Comandos úteis mysql
sudo apt install mysql-server
sudo mysql -u root -p // acessar mysql via terminal
CTRL + L // limpar tela
status // mostra a database em uso e outras informações úteis
SHOW variables WHERE variable_name = 'port'; // mostrar porta em uso

-- Comandos úteis para se conectar ao servidor Ubuntu
sudo apt install openssh-server  // instalar openssh
sudo services ssh status   // status servidor ssh
ip addr  // visualizar ip maquina
sudo nano /etc/ssh/sshd_config  // config ssh
sudo service ssh stop  // para o servidor ssh
sudo service ssh start  // inicia o servidor ssh 
ssh <usuario-ubuntu>@<endereço-ip> -p <porta (padrão 22)> // acessar servidor ssh (password do ubuntu) 

-- MYSQL

EMPTY SET -- set de dados vazio

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

/* FILTRANDO DADOS COM WHERE E LIKE */

SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENTE WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO = 'RJ';

/* UTILIZANDO O LIKE */
-- Substitui a igualdade
-- Degrada performance, preferivel utilizar igualdade.

SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE 'RJ';
-- Não funciona. Falta caracter coringa.

/* CARACTER CORINGA (%) -> QUALQUER COISA */

SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE 'OSCAR CURY%';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%CENTRO%';

/* EXERCICIO DE FIXAÇÃO 1 */

BANCO: LIVRARIA

TABELA: LIVROS

ATRIBUTOS:
    NOME DO LIVRO
    NOME DO AUTOR
    SEXO DO AUTOR
    NUMERO DE PÁGINAS
    NOME DA EDITORA
    VALOR DO LIVRO
    ESTADO(UF) DA EDITORA
    ANO PUBLICACAO

-- SCRIPT

CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVROS (
    NOME_LIVRO VARCHAR(50),
    NOME_AUTOR VARCHAR(50),
    SEXO_AUTOR VARCHAR(9),
    NUMERO_PAGINAS INT(3),
    NOME_EDITORA VARCHAR(50),
    VALOR_LIVRO FLOAT(5,2),
    UF_EDITORA CHAR(2),
    ANO_PUBLICACAO INT(4)
);

INSERT INTO LIVROS(NOME_LIVRO, NOME_AUTOR, SEXO_AUTOR, NUMERO_PAGINAS, NOME_EDITORA, VALOR_LIVRO, UF_EDITORA, ANO_PUBLICACAO)
VALUES ('Cavaleiro Real', 'Ana Claudia', 'Feminino', 465, 'Atlas', 49.9,	'RJ', 2009);

INSERT INTO LIVROS(NOME_LIVRO, NOME_AUTOR, SEXO_AUTOR, NUMERO_PAGINAS, NOME_EDITORA, VALOR_LIVRO, UF_EDITORA, ANO_PUBLICACAO)
VALUES ('SQL Para Leigos', 'João Nunes', 'Masculino', 450, 'Addison', 98, 'SP', 2018);

INSERT INTO LIVROS(NOME_LIVRO, NOME_AUTOR, SEXO_AUTOR, NUMERO_PAGINAS, NOME_EDITORA, VALOR_LIVRO, UF_EDITORA, ANO_PUBLICACAO)
VALUES ('Receitas Caseiras', 'Celia Tavares', 'Feminino', 210, 'Atlas', 45, 'RJ', 2008);

INSERT INTO LIVROS(NOME_LIVRO, NOME_AUTOR, SEXO_AUTOR, NUMERO_PAGINAS, NOME_EDITORA, VALOR_LIVRO, UF_EDITORA, ANO_PUBLICACAO)
VALUES ('Pessoas Efetivas', 'Eduardo Santos', 'Masculino', 390, 'Beta', 78.99, 'RJ', 2018);

-- TRAZER TODOS OS DADOS

SELECT * 
FROM LIVROS;

-- TRAZER NOME DO LIVRO E NOME DA EDITORA

SELECT NOME_LIVRO, NOME_EDITORA 
FROM LIVROS;

-- TRAZER O NOME DO LIVRO E A UF DOS LIVROS PUBLICADOS POR AUTORES DO SEXO MASCULINO

SELECT NOME_LIVRO, UF_EDITORA 
FROM LIVROS 
WHERE SEXO_AUTOR = 'Masculino';

-- TRAZER O NOME DO LIVRO E O NUMERO DO PAGINAS DOS LIVROS PUBLICADOS POR AUTORES DO SEXO FEMININO

SELECT NOME_LIVRO, NUMERO_PAGINAS 
FROM LIVROS 
WHERE SEXO_AUTOR = 'Feminino';

-- TRAZER OS VALORES DOS LIVROS DAS EDITORAS DE SÃO PAULO

SELECT VALOR_LIVRO 
FROM LIVROS 
WHERE UF_EDITORA = 'SP';

-- TRAZER OS DADOS DOS AUTORES DO SEXO MASCULINO QUE TIVERAM LIVROS PUBLICADOS POR SÃO PAULO OU RIO DE JANEIRO

SELECT NOME_AUTOR, SEXO_AUTOR 
FROM LIVROS 
WHERE SEXO_AUTOR = 'Masculino' AND (UF_EDITORA = 'RJ' OR UF_EDITORA = 'SP');

/* FIM DO EXERCICIO */

/* OPERADORES LÓGICOS */

    OR -> PARA QUE A SAÍDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDIÇÃO SEJA VERDADEIRA
    AND -> PARA QUE A SAÍDA SEJA VERDADEIRA, TODAS AS CONDIÇÕES PRECISAM SER VERDADEIRAS.

    /* OR - OU */

    SHOW DATABASES;

    USE PROJETO;

    SELECT * FROM CLIENTE;

    SELECT NOME, SEXO, ENDERECO FROM CLIENTE
    WHERE SEXO = 'M' OR ENDERECO LIKE '%RJ';

    SELECT NOME, SEXO, ENDERECO FROM CLIENTE
    WHERE SEXO = 'F' OR ENDERECO LIKE '%ESTACIO%';

    /* AND - E */

    SHOW DATABASES;

    USE PROJETO;

    SELECT * FROM CLIENTE;

    SELECT NOME, SEXO, ENDERECO FROM CLIENTE
    WHERE SEXO = 'M' AND ENDERECO LIKE '%RJ';

    SELECT NOME, SEXO, ENDERECO FROM CLIENTE
    WHERE SEXO = 'F' AND ENDERECO LIKE '%ESTACIO%';

/* COUNT(*), GROUP BY, PERFORMANCE COM OPERADORES LOGICOS */

    /* CONTANDO OS REGISTROS DE UMA TABELA */

    SELECT COUNT(*) AS "Quantidade de Registros da Tab. Cliente" FROM CLIENTE;

    /* OPERADOR GROUP BY */

    SELECT SEXO, COUNT(*) FROM CLIENTE;  -- Não funcionou

    SELECT SEXO, COUNT(*) FROM CLIENTE GROUP BY SEXO;   -- GROUP BY distribuiu a contagem de clientes para os tipos de sexo

/* PERFORMANCE EM OPERADORES LÓGICOS */

    -- PARA CONTAR
    SELECT COUNT(*) FROM CLIENTE;

    SELECT SEXO, COUNT(*) FROM CLIENTE GROUP BY SEXO;

    SELECT SEXO, COUNT(*) FROM CLIENTE GROUP BY CIDADE;

    -- CONDICAO
    SEXO = F
    CIDADE = RIO DE JANEIRO

    -- SITUAÇÃO - TRATANDO COM OU / OR
    70% MULHERES = SEXO F
    30% MORA NO RIO DE JANEIRO

    SELECT NOME, SEXO, ENDERECO FROM CLIENTE
    WHERE SEXO = 'F' OR CIDADE = 'RIO DE JANEIRO';

    -- UTILIZANDO O OR, A CONDIÇÃO QUE POSSUI MAIS INCIDENCIA NA TABELA DEVE ESTAR EM PRIMEIRO, NO CASO, SEXO = F
    -- ISSO PORQUE APENAS UMA DAS CONDIÇÕES PRECISA SER VERDADEIRA

    -- SITUAÇÃO - TRATANDO COM E / AND
    70% MULHERES = SEXO F
    30% MORA NO RIO DE JANEIRO

    SELECT NOME, SEXO, ENDERECO FROM CLIENTE
    WHERE CIDADE = 'RIO DE JANEIRO' OR SEXO = 'F';

    -- UTILIZANDO O AND, A CONDIÇÃO COM MENOS INCIDENCIA NA TABELA DEVE ESTAR EM PRIMEIRO, NO CASO, CIDADE = 'RIO DE JANEIRO'
    -- ISSO PORQUE AS DUAS CONDIÇÕES TEM DE SER VERDADEIRAS

    -- ESSE CUIDADO COM O POSICIONAMENTO DAS CONDIÇÕES DIMINUI O TEMPO NECESSÁRIO DE PROCESSAMENTO.

-- =================================================
/* EXERCICIOS */

    SELECT COUNT(*) FROM FUNCIONARIOS;

    --Traga os funcionarios que trabalhem no departamento de filmes OU no departamento de roupas.
    -- 21 | Filmes   53 | Roupas

    SELECT idFuncionario, nome, departamento FROM funcionarios 
    WHERE departamento = 'Roupas' OR departamento = 'Filmes';

    SELECT COUNT(*), departamento FROM funcionarios
    GROUP BY departamento
    ORDER BY 1;

    --O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no departamento 
    --de filmes ou no departamento lar. Ele necessita enviar um email para as colaboradoras
    --desses dois setores. OR +  AND *

    SELECT idFuncionario, nome, sexo, departamento FROM funcionarios 
    WHERE (departamento = 'Lar' OR departamento = 'Filmes') AND sexo = 'Feminino';

    SELECT sexo, COUNT(*) FROM funcionarios 
    GROUP BY sexo;

    --Traga os funcionarios do sexo masculino
    --ou os funcionarios que trabalhem no setor Jardim

    SELECT idFuncionario, nome, sexo, departamento FROM funcionarios
    WHERE sexo = 'Masculino' OR departamento = 'Jardim';

/* FILTRANDO VALORES NULOS */

    SELECT NOME, SEXO, ENDERECO
    FROM CLIENTE
    WHERE EMAIL = NULL;
    -- Não funciona

    SELECT NOME, SEXO, ENDERECO
    FROM CLIENTE
    WHERE EMAIL IS NULL;

    SELECT NOME, SEXO, ENDERECO
    FROM CLIENTE
    WHERE EMAIL IS NOT NULL;
    -- Formas corretas utilizando
    -- IS OU IS NOT NULL

/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES NA TABELA */

    SELECT NOME, EMAIL FROM CLIENTE;

    UPDATE CLIENTE
    SET EMAIL = 'LILIAN@HOTMAIL.COM';
    -- Deu update em todos os cadastros

    /* USANDO O WHERE */

    UPDATE CLIENTE
    SET EMAIL = NULL
    WHERE NOME = 'JORGE';

    UPDATE CLIENTE
    SET EMAIL = 'CELIA@GMAIL.COM'
    WHERE NOME = 'CELIA';

    UPDATE CLIENTE
    SET EMAIL = 'CARLA@TERATI.COM.BR'
    WHERE NOME = 'CARLA';

    UPDATE CLIENTE
    SET EMAIL = 'ANA@GLOBO.COM'
    WHERE NOME = 'ANA';

    UPDATE CLIENTE
    SET EMAIL = 'JOAO@GMAIL.COM'
    WHERE NOME = 'JOAO';

/* DELETANDO REGISTROS COM A CLAUSULA DELETE */

    DELETE FROM CLIENTE;

    SELECT COUNT(*) FROM CLIENTE;
    -- Fazer antes do delete
    SELECT * FROM CLIENTE WHERE NOME = 'ANA';
    -- Fazer antes do delete
    SELECT COUNT(*) FROM CLIENTE WHERE NOME = 'ANA';
    -- Fazer antes do delete

    -- Total para deletar = 1

    DELETE FROM CLIENTE
    WHERE NOME = 'ANA';

    -- Inserindo outra Carla
    SELECT * FROM CLIENTE;

    INSERT INTO CLIENTE 
    VALUES ('CARLA', 'F', 'C.LOPES@UOL.COM',45638854, '4575-0048', 'RUA COPPER LEAF - WILLIAMSBURG - KITCHENER');

    -- Deletando uma das Carlas

    SELECT * FROM CLIENTE
    WHERE NOME = 'CARLA' AND EMAIL = 'CARLA@TERATI.COM.BR';

    DELETE FROM CLIENTE
    WHERE NOME = 'CARLA' AND EMAIL = 'CARLA@TERATI.COM.BR';

    -- Forma incorreta utilizando OR pois trás todos os cliente com email CARLA@TERATE.COM.BR
    DELETE FROM CLIENTE
    WHERE NOME = 'CARLA' OR EMAIL = 'CARLA@TERATI.COM.BR';

/* FORMAS NORMAIS */

/* PRIMEIRA FORMA NORMAL */

-- 1 - TODO CAMPO VETORIZADO SE TORNARÁ OUTRA TABELA

    Para ser considerado vetor, os elementos devem ser da mesma familia
    Exemplo: Campo 'telefone' com mais de um numero
    EXEMPLOS DE VETOR
    [AZUL, AMARELO, LARANJA, VERDE] <- VETOR DE CORES
    [KA, FIESTA, UNO, CIVIC] <- VETOR DE CARROS

    --  2 - TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA QUANDO O CAMPO FOR DIVISIVEL

    Campo 'telefone' é multivalorada e é um vetor
    Campo 'endereco' é multivalorada mas não é um vetor

    EXEMPLO, Campo endereço pode se tornar outra tabela com vários campos
    pois é um campo muito valorado.

    -- 3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE
    --     TODO O REGISTRO COMO SENDO ÚNICO, É O QUE CHAMADOS DE CHAVE PRIMÁRIA.

    CHAVE PRIMÁRIA

    NATURAL - Pertence naturalmente ao registro, exemplo, CPF
    ARTIFICIAL - Criada artificialmente, exemplo, ID

/*=============================*/

/* CRIANDO NOVA BASE DE DADOS A PARTIR DE MODELO CRIADO */

    CREATE DATABASE COMERCIO;

    SHOW DATABASES;

    USE COMERCIO;

    CREATE TABLE CLIENTE(
        IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, 
        NOME VARCHAR(50) NOT NULL, 
        CPF VARCHAR(11) NOT NULL, 
        EMAIL VARCHAR(50) UNIQUE, 
        SEXO ENUM('M', 'F') NOT NULL
    );


    -- NOT NULL: Dado obrigatório.
    -- UNIQUE: Dado único.
    -- ENUM SÓ EXISTE EM MYSQL!

    CREATE TABLE ENDERECO(
        ID_ENDERECO INT PRIMARY KEY AUTO_INCREMENT,
        RUA VARCHAR(100) NOT NULL,
        BAIRRO VARCHAR(50) NOT NULL,
        CIDADE VARCHAR(50) NOT NULL,
        ESTADO CHAR(2) NOT NULL
    );

    CREATE TABLE TELEFONE(
        ID_TELEFONE INT PRIMARY KEY AUTO_INCREMENT,
        TIPO ENUM('Residencial', 'Comercial', 'Movel'),
        NUMERO VARCHAR(10) NOT NULL
    );

    -- Não precisa colocar NOT NULL em ENUM

/*=============================*/

    CHAVE ESTRANGEIRA

    É a chave primária de uma tabela que vai até a outra tabela para fazer
    referencia entre registros.

    Em relacionamento 1 para 1 a chave estrangeira fica na tabela mais fraca (Ex: Endereço)

    Em relacionamento 1 para N a chave estrangeira fica na cardinalidade N (Ex: Telefone)

/*=============================*/
/* TABELAS ANTERIORES COM ADIÇÃO DA CHAVE ESTRANGEIRA */

    CREATE TABLE CLIENTE(
        IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, 
        NOME VARCHAR(50) NOT NULL, 
        CPF VARCHAR(11) UNIQUE, 
        EMAIL VARCHAR(50) UNIQUE, 
        SEXO ENUM('M', 'F') NOT NULL
    );

    CREATE TABLE ENDERECO(
        IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
        RUA VARCHAR(100) NOT NULL,
        BAIRRO VARCHAR(50) NOT NULL,
        CIDADE VARCHAR(50) NOT NULL,
        ESTADO CHAR(2) NOT NULL,
        ID_CLIENTE INT NOT NULL UNIQUE,
        FOREIGN KEY(ID_CLIENTE)
        REFERENCES CLIENTE(IDCLIENTE)
    );

    CREATE TABLE TELEFONE(
        IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
        TIPO ENUM('Residencial', 'Comercial', 'Movel') NOT NULL,
        NUMERO VARCHAR(10) NOT NULL,
        ID_CLIENTE INT NOT NULL,
        FOREIGN KEY(ID_CLIENTE)
        REFERENCES CLIENTE(IDCLIENTE)
    );

    -- FOREIGN KEYS SÃO ADICIONADAS COM O USO DE CONSTRAINTS

    -- O UNIQUE NA CHAVE ESTRANGEIRA ID_CLIENTE NA TABELA ENDEREÇO, 
    -- FAZ COM QUE A RELAÇÃO ENTRE AS DUAS TABELAS (CLIENTE E ENDEREÇO) SEJA ESTABELECIDA COMO 1 PARA 1
    -- POIS ISSO FAZ COM QUE 1 CLIENTE POSSUA APENAS 1 ENDEREÇO

    -- A chave estrangeira em relacionamentos 1 para 1 não se repete.

/*=============================*/
/*INSERTS NA ULTIMA TABELA CRIADA*/

    SHOW DATABASES;

    /* INSERINDO DADOS NA TABELA CLIENTE */

    DESC CLIENTE;

    -- A CHAVE PRIMÁRIA IDCLIENTE É AUTOINCREMENTÁVEL, POREM, É NECESSÁRIO INDICAR NOS INSERTS COMO NULL
    INSERT INTO CLIENTE VALUES(NULL, 'Joao', '05492320192', 'M');
    -- ERRO! Quantidade de dados incompátiveis com a tabela, falta 1.
    -- Forma correta abaixo.
    INSERT INTO CLIENTE VALUES(NULL, 'Joao', '05492320192', 'joao@email.com', 'M');
    -- Mais adições abaixo.
    INSERT INTO CLIENTE VALUES(NULL, 'Carla', '51242313242', 'carla@email.com', 'F');
    INSERT INTO CLIENTE VALUES(NULL, 'Célia', '63456543456', NULL, 'F');
    INSERT INTO CLIENTE VALUES(NULL, 'Maria', '07456765745', 'maria@email.com', 'F');
    INSERT INTO CLIENTE VALUES(NULL, 'Paulo', '98767879978', 'paulo@email.com', 'M');
    INSERT INTO CLIENTE VALUES(NULL, 'Faria', '08876677894', 'faria@email.com', 'M');
    INSERT INTO CLIENTE VALUES(NULL, 'Jorge', '08456737345', 'jorge@email.com', 'M');

    DELETE FROM CLIENTE 
    WHERE NOME = 'Célia';

    +-----------+--------+-------------+-----------------+------+
    | IDCLIENTE | NOME   | CPF         | EMAIL           | SEXO |
    +-----------+--------+-------------+-----------------+------+
    |         1 | Joao   | 05492320192 | joao@email.com  | M    |
    |         2 | Carla  | 51242313242 | carla@email.com | F    |
    |         4 | Maria  | 07456765745 | maria@email.com | F    |
    |         5 | Paulo  | 98767879978 | paulo@email.com | M    |
    |         6 | Faria  | 08876677894 | faria@email.com | M    |
    |         7 | Jorge  | 08456737345 | jorge@email.com | M    |
    |         8 | Célia  | 63456543456 | NULL            | F    |
    +-----------+--------+-------------+-----------------+------+

    /* INSERINDO DADOS NA TABELA ENDERECO */

    DESC ENDERECO;

    -- Erro abaixo. ID_CLIENTE não pode ser nulo.
    INSERT INTO ENDERECO VALUES(NULL, 'Rua Antonio Sá', 'Centro', 'Belo Horizonte', 'MG',  NULL);
    
    -- Erro abaixo. ID_CLIENTE 45 não existe.
    INSERT INTO ENDERECO VALUES(NULL, 'Rua Antonio Sá', 'Centro', 'Belo Horizonte', 'MG',  45);

    -- Corretos abaixo.
    INSERT INTO ENDERECO VALUES(NULL, 'Rua Antonio Sá', 'Centro', 'Belo Horizonte', 'MG',  4);
    INSERT INTO ENDERECO VALUES(NULL, 'Rua Capitão Hermes', 'Centro', 'Rio de Janeiro', 'RJ',  2);
    INSERT INTO ENDERECO VALUES(NULL, 'Rua Presidente Vargas', 'Jardins', 'São Paulo', 'SP',  1);
    INSERT INTO ENDERECO VALUES(NULL, 'Rua Algandega', 'Estacio', 'Rio de Janeiro', 'RJ',  5);
    INSERT INTO ENDERECO VALUES(NULL, 'Rua do Ouvidor', 'Flamengo', 'Rio de Janeiro', 'RJ',  6);
    INSERT INTO ENDERECO VALUES(NULL, 'Rua Antonio Sá', 'Centro', 'Vitoria', 'ES',  7);
    INSERT INTO ENDERECO VALUES(NULL, 'Rua Uruguaiana', 'Boa vista', 'Mato Grosso', 'MT',  8);

    -- Tentando inserir registro repetivo (ERRO). (Chave estrangeira definida como UNIQUE, relação 1 para 1)
    INSERT INTO ENDERECO VALUES(NULL, 'Rua Algandega', 'Estacio', 'Rio de Janeiro', 'RJ',  5); 

    /* INSERINDO DADOS NA TABELA TELEFONE */

    DESC TELEFONE;

    INSERT INTO TELEFONE VALUES(NULL, 'Movel', '843932821', 2);
    INSERT INTO TELEFONE VALUES(NULL, 'Residencial', '239483927', 2);
    INSERT INTO TELEFONE VALUES(NULL, 'Comercial', '293854932', 7);
    INSERT INTO TELEFONE VALUES(NULL, 'Movel', '974321943', 8);
    INSERT INTO TELEFONE VALUES(NULL, 'Residencial', '293847323', 6);
    INSERT INTO TELEFONE VALUES(NULL, 'Movel', '943854732', 6);
    INSERT INTO TELEFONE VALUES(NULL, 'Residencial', '322482934', 4);
    INSERT INTO TELEFONE VALUES(NULL, 'Comercial', '954382121', 1);

/*=============================*/
/* SELEÇÃO, PROJEÇÃO E JUNÇÃO */

    /* PROJEÇÃO, É tudo o que você quer ver na tela. */
        SELECT NOW() AS 'DATA_ATUAL';

        SELECT 2+2 AS 'SOMA';

        SELECT 2+2 AS 'SOMA', NOW() AS 'DATA_ATUAL';

    /* SELEÇÃO, Filtra os dados antes de projetar, é um subconjunto do conjunto total de registros da tabela. */
    -- A clausula de seleção é o WHERE.

        SELECT NOME, SEXO, EMAIL /* PROJEÇÃO */
        FROM CLIENTE /* ORIGEM */
        WHERE SEXO = 'F'; /* SELEÇÃO */

        SELECT TIPO, NUMERO /* PROJEÇÃO */
        FROM TELEFONE /* ORIGEM */
        WHERE TIPO = 'Movel'; /* SELEÇÃO */

    /* JUNÇÃO */

        SELECT NOME, EMAIL, IDCLIENTE /* PROJEÇÃO */
        FROM CLIENTE; /* ORIGEM */

        +--------+-----------------+-----------+
        | NOME   | EMAIL           | IDCLIENTE |
        +--------+-----------------+-----------+
        | Joao   | joao@email.com  |         1 |
        | Carla  | carla@email.com |         2 |
        | Maria  | maria@email.com |         4 |
        | Paulo  | paulo@email.com |         5 |
        | Faria  | faria@email.com |         6 |
        | Jorge  | jorge@email.com |         7 |
        | Célia  | NULL            |         8 |
        +--------+-----------------+-----------+

        SELECT ID_CLIENTE, BAIRRO, CIDADE /* PROJEÇÃO */
        FROM ENDERECO; /* ORIGEM */

        +------------+-----------+----------------+
        | ID_CLIENTE | BAIRRO    | CIDADE         |
        +------------+-----------+----------------+
        |          4 | Centro    | Belo Horizonte |
        |          2 | Centro    | Rio de Janeiro |
        |          1 | Jardins   | São Paulo      |
        |          5 | Estacio   | Rio de Janeiro |
        |          6 | Flamengo  | Rio de Janeiro |
        |          7 | Centro    | Vitoria        |
        |          8 | Boa vista | Mato Grosso    |
        +------------+-----------+----------------+

        /* NOME, SEXO, BAIRRO, CIDADE */

        SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
        FROM CLIENTE, ENDERECO /* ORIGEM */
        WHERE IDCLIENTE = ID_CLIENTE; /* JUNÇÃO */

        SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
        FROM CLIENTE, ENDERECO /* ORIGEM */
        WHERE IDCLIENTE = ID_CLIENTE /* JUNÇÃO */
        AND SEXO = 'F'; /* SELEÇÃO */

        -- Não utilizar WHERE para junção. Pois deixa a SELEÇÃO mais confusa.
        -- Utilizar forma abaixo.

        SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
        FROM CLIENTE /* ORIGEM */
        INNER JOIN ENDERECO ON IDCLIENTE = ID_CLIENTE; /* JUNÇÃO */

        +--------+------+-----------+----------------+
        | NOME   | SEXO | BAIRRO    | CIDADE         |
        +--------+------+-----------+----------------+
        | Joao   | M    | Jardins   | São Paulo      |
        | Carla  | F    | Centro    | Rio de Janeiro |
        | Maria  | F    | Centro    | Belo Horizonte |
        | Paulo  | M    | Estacio   | Rio de Janeiro |
        | Faria  | M    | Flamengo  | Rio de Janeiro |
        | Jorge  | M    | Centro    | Vitoria        |
        | Célia  | F    | Boa vista | Mato Grosso    |
        +--------+------+-----------+----------------+

        SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
        FROM CLIENTE /* ORIGEM */
        INNER JOIN ENDERECO ON IDCLIENTE = ID_CLIENTE /* JUNÇÃO */
        WHERE SEXO = 'F'; /* SELEÇÃO */

        +--------+------+-----------+----------------+
        | NOME   | SEXO | BAIRRO    | CIDADE         |
        +--------+------+-----------+----------------+
        | Carla  | F    | Centro    | Rio de Janeiro |
        | Maria  | F    | Centro    | Belo Horizonte |
        | Célia  | F    | Boa vista | Mato Grosso    |
        +--------+------+-----------+----------------+

        /* NOME, SEXO, EMAIL, TIPO, NUMERO */

        SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
        FROM CLIENTE
        INNER JOIN TELEFONE ON IDCLIENTE = ID_CLIENTE;

        /* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

        SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
        FROM CLIENTE
        INNER JOIN ENDERECO ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
        INNER JOIN TELEFONE ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

        -- EXEMPLO UTILIZANDO ALIAS PARA OS NOMES DE TABELA (PONTEIRAMENTO), AJUDA NA PERFORMANCE.

        SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
        FROM CLIENTE C
        INNER JOIN ENDERECO E 
        ON C.IDCLIENTE = E.ID_CLIENTE
        INNER JOIN TELEFONE T 
        ON C.IDCLIENTE = T.ID_CLIENTE;

        +--------+------+-----------+----------------+-------------+-----------+
        | NOME   | SEXO | BAIRRO    | CIDADE         | TIPO        | NUMERO    |
        +--------+------+-----------+----------------+-------------+-----------+
        | Joao   | M    | Jardins   | São Paulo      | Comercial   | 954382121 |
        | Carla  | F    | Centro    | Rio de Janeiro | Movel       | 843932821 |
        | Carla  | F    | Centro    | Rio de Janeiro | Residencial | 203934942 |
        | Maria  | F    | Centro    | Belo Horizonte | Residencial | 322482934 |
        | Faria  | M    | Flamengo  | Rio de Janeiro | Residencial | 293847323 |
        | Faria  | M    | Flamengo  | Rio de Janeiro | Movel       | 943854732 |
        | Jorge  | M    | Centro    | Vitoria        | Comercial   | 293854932 |
        | Célia  | F    | Boa vista | Mato Grosso    | Movel       | 974321943 |
        +--------+------+-----------+----------------+-------------+-----------+

/* CATEGORIAS DE LINGUAGEM SQL */

    DML - DATA MANIPULATION LANGUAGE
    DDL - DATA DEFINITION LANGUAGE
    DCL - DATA CONTROL LANGUAGE
    TCL - TRANSACTION CONTROL LANGUAGE

    EXEMPLOS DE DML

    /* INSERT */

    INSERT INTO CLIENTE(IDCLIENTE, NOME, SEXO, EMAIL, CPF) VALUES(NULL, 'Paula', 'M', NULL, '84372638481');
    INSERT INTO ENDERECO VALUES(NULL, 'Rua Joaquim Silva', 'Alvorada', 'Niteroi', 'RJ', 9);

    /* SELECT */

    SELECT * FROM CLIENTE;

    /* FILTROS */

    SELECT * FROM CLIENTE
    WHERE SEXO = 'M';

    /* UPDATE */
    -- Sempre utilizar a chave para fazer update ou delete
    -- Fazer um select antes para verificar se o dado que aparece é o desejado.    

    SELECT * FROM CLIENTE
    WHERE IDCLIENTE = 9;

    UPDATE CLIENTE
    SET SEXO = 'F'
    WHERE IDCLIENTE = 9;

    /* DELETE */

    INSERT INTO CLIENTE VALUES(NULL, 'XXXX', 'XXXX', NULL, 'M');

    SELECT * FROM CLIENTE
    WHERE IDCLIENTE = 10;

    DELETE FROM CLIENTE
    WHERE IDCLIENTE = 10;

/*===========================*/

    EXEMPLOS DE DDL

    CREATE TABLE PRODUTO(
        IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
        NOME_PRODUTO VARCHAR(50) NOT NULL,
        PRECO INT,
        FRETE FLOAT(10,2)
    );

    /* ALTER TABLE */
    -- ALTERANDO O NOME DE UMA COLUNA - CHANGE */

    ALTER TABLE PRODUTO
    CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

    /* MODIFY */
    -- ALTERANDO UM TIPO 

    ALTER TABLE PRODUTO
    MODIFY VALOR_UNITARIO VARCHAR(30) NOT NULL;


    /* ADICIONANDO COLUNAS */

    -- ADICIONANDO AO FIM
    ALTER TABLE PRODUTO
    ADD PESO FLOAT(10,2) NOT NULL;

    -- ESCOLHENDO ONDE ADICIONAR
    ALTER TABLE PRODUTO
    ADD COLUMN PESO FLOAT(10,2) NOT NULL
    AFTER NOME_PRODUTO;

    ALTER TABLE PRODUTO
    ADD COLUMN PESO FLOAT(10,2) NOT NULL
    FIRST;

    /* APAGANDO UMA COLUNA */
    ALTER TABLE PRODUTO
    DROP COLUMN PESO;

/*=============================*/
/* EXERCICIOS */

DESC CLIENTE;
DESC ENDERECO;
DESC TELEFONE;

/* RELATÓRIO GERAL DE TODOS OS CLIENTE (INCLUINDO ENDERECO E TELEFONE) */
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
LEFT JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
LEFT JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF         | RUA                | BAIRRO     | CIDADE         | ESTADO | TIPO | NUMERO   |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 99667587 |
|         1 | JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 66687899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 54768899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 78989765 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678   | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 99766676 |
|         4 | CLARA   | F    | NULL              | 5687766856  | RUA ANTONIO SA     | CENTRO     | B. HORIZONTE   | MG     | NULL | NULL     |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | CEL  | 78458743 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 56576876 |
|         5 | JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 89986668 |
|         6 | CELIA   | M    | JCELIA@IG.COM     | 5767876889  | RUA DO OUVIDOR     | FLAMENGO   | RIO DE JANEIRO | RJ     | NULL | NULL     |
|         7 | PAULA   | F    | NULL              | 77437493    | RUA JOAQUIM SILVA  | ALVORADA   | NITEROI        | RJ     | NULL | NULL     |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675 |
|        10 | ANDRE   | M    | ANDRE@GLOBO.COM   | 7687567     | RUA MAIA LACERDA   | ESTACIO    | RIO DE JANEIRO | RJ     | NULL | NULL     |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786 |
|        11 | GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654 |
|        12 | KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
|        13 | DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
|        14 | LORENA  | M    | NULL              | 774557887   | RUA CASTRO ALVES   | LEBLON     | RIO DE JANEIRO | RJ     | NULL | NULL     |
|        15 | EDUARDO | M    | NULL              | 54376457    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | CEL  | 89966809 |
|        16 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767    | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COM  | 88679978 |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768 |
|        18 | ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786 |
|        19 | CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77755785 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 44522578 |
|        21 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | NULL | NULL     |
+-----------+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+


/* RELATORIO DE HOMENS (INCLUINDO ENDERECO E TELEFONE) */

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
LEFT JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
LEFT JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';

+-----------+---------+------+-----------------+-------------+--------------------+------------+----------------+--------+------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL           | CPF         | RUA                | BAIRRO     | CIDADE         | ESTADO | TIPO | NUMERO   |
+-----------+---------+------+-----------------+-------------+--------------------+------------+----------------+--------+------+----------+
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 99667587 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 66687899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM  | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 54768899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM  | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | CEL  | 78458743 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 56576876 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 89986668 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM   | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM   | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675 |
|        10 | ANDRE   | M    | ANDRE@GLOBO.COM | 7687567     | RUA MAIA LACERDA   | ESTACIO    | RIO DE JANEIRO | RJ     | NULL | NULL     |
|        15 | EDUARDO | M    | NULL            | 54376457    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | CEL  | 89966809 |
|        16 | ANTONIO | M    | ANTONIO@IG.COM  | 12436767    | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COM  | 88679978 |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM | 3423565     | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768 |
+-----------+---------+------+-----------------+-------------+--------------------+------------+----------------+--------+------+----------+

/* RELATORIO DE TODOS AS MULHERES */

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
LEFT JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
LEFT JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';

+-----------+---------+------+-------------------+------------+--------------------+------------+----------------+--------+------+----------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF        | RUA                | BAIRRO     | CIDADE         | ESTADO | TIPO | NUMERO   |
+-----------+---------+------+-------------------+------------+--------------------+------------+----------------+--------+------+----------+
|         3 | ANA     | F    | ANA@IG.COM        | 456545678  | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 78989765 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678  | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 99766676 |
|         4 | CLARA   | F    | NULL              | 5687766856 | RUA ANTONIO SA     | CENTRO     | B. HORIZONTE   | MG     | NULL | NULL     |
|         6 | CELIA   | F    | JCELIA@IG.COM     | 5767876889 | RUA DO OUVIDOR     | FLAMENGO   | RIO DE JANEIRO | RJ     | NULL | NULL     |
|         7 | PAULA   | F    | NULL              | 77437493   | RUA JOAQUIM SILVA  | ALVORADA   | NITEROI        | RJ     | NULL | NULL     |
|        11 | GIOVANA | F    | NULL              | 0876655    | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765 |
|        11 | GIOVANA | F    | NULL              | 0876655    | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786 |
|        11 | GIOVANA | F    | NULL              | 0876655    | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654 |
|        12 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778  | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789   | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
|        14 | LORENA  | F    | NULL              | 774557887  | RUA CASTRO ALVES   | LEBLON     | RIO DE JANEIRO | RJ     | NULL | NULL     |
|        18 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763   | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213  | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213  | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942   | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77755785 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942   | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 44522578 |
|        21 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256   | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | NULL | NULL     |
+-----------+---------+------+-------------------+------------+--------------------+------------+----------------+--------+------+----------+

/* QUANTIDADE DE HOMENS E MULHERES */

SELECT SEXO, COUNT(*) AS 'Quantidade de pessoas'
FROM CLIENTE
GROUP BY SEXO;

+------+-----------------------+
| SEXO | Quantidade de pessoas |
+------+-----------------------+
| M    |                     8 |
| F    |                    12 |
+------+-----------------------+

/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NÃO TENHAM CELULAR */

-- SELECT C.IDCLIENTE, C.NOME, C.EMAIL, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
-- FROM CLIENTE C
-- INNER JOIN ENDERECO E 
-- ON C.IDCLIENTE = E.ID_CLIENTE
-- INNER JOIN TELEFONE T
-- ON C.IDCLIENTE = T.ID_CLIENTE
-- WHERE C.SEXO = 'F';

SELECT  C.IDCLIENTE,
        C.NOME,
        IFNULL(C.EMAIL, '***********') AS 'EMAIL',
        E.BAIRRO,
        E.CIDADE,  
        IFNULL(T.TIPO, '***********') AS 'TIPO TELEFONE', 
        IFNULL(T.NUMERO, '***********') AS 'NUMERO TELEFONE'
FROM CLIENTE C
LEFT JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
LEFT JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' AND (T.TIPO IS NULL OR T.TIPO NOT LIKE 'CEL')
AND E.BAIRRO = 'CENTRO' AND E.CIDADE = 'RIO DE JANEIRO';

GEOVANNA NÃO DEVERIA ESTAR NA TABELA.

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM RELATÓRIO COM O NOME,
EMAIL, E TELEFONE CELULAR DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO */

SELECT C.NOME, C.EMAIL, T.NUMERO AS 'CELULAR'
FROM CLIENTE C
LEFT JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE
LEFT JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
WHERE T.TIPO = 'CEL' AND E.ESTADO = 'RJ';

/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RELATÓRIO 
COM OS NOME, EMAIL E TELEFONE CELULAR DAS MULHERES QUE MORAM NO ESTADO DE SP */

SELECT C.NOME, C.EMAIL, T.NUMERO AS 'CELULAR'
FROM CLIENTE C
LEFT JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE
LEFT JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
WHERE T.TIPO = 'CEL' AND E.ESTADO = 'SP' AND C.SEXO = 'F';

SELECT C.NOME, C.EMAIL, T.NUMERO AS 'CELULAR'
FROM CLIENTE C
LEFT JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE
LEFT JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
WHERE E.ESTADO = 'SP' AND C.SEXO = 'F';