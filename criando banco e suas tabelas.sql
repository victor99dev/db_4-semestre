create database fazenda-bd;

use fazenda-bd

-- CRIAÇÃO TABELAS ADMINSTRAÇÃO DE ACESSO
CREATE 
    TABLE 
        ADM_CADASTRO
            (
                ID_ADM INT PRIMARY KEY NOT NULL,
                NOME VARCHAR (50) NOT NULL,
                EMAIL VARCHAR (50) UNIQUE NOT NULL,
                SENHA VARCHAR (50) NOT NULL,
                CPF CHAR (11),
                DATA_N DATE NOT NULL, 
                FUNCAO VARCHAR (50), 
                SEXO VARCHAR (50) NOT NULL,
                DATA_CADASTRO DATETIME NOT NULL
            );    
 
CREATE
    TABLE 
        ADM_LOGIN
            (    
                ID_ADM INT NOT NULL,
                EMAIL VARCHAR (50) UNIQUE NOT NULL,
                SENHA VARCHAR (50) NOT NULL,
                DATALOGIN VARCHAR (15) NOT NULL, -- HORA QUE EFETUA O LOGIN
                FOREIGN KEY (ID_ADM) REFERENCES ADM_CADASTRO (ID_ADM)
            );
 
CREATE 
    TABLE 
        ADM_USUARIO
            (
                ID_ADM INT NOT NULL,
                NOME VARCHAR (50) NOT NULL,
                EMAIL VARCHAR (50) UNIQUE NOT NULL,
                SENHA VARCHAR (50) NOT NULL,
                CPF CHAR (11) NOT NULL,
                FUNCAO VARCHAR (50) NOT NULL,
                SEXO VARCHAR (50) NOT NULL,
                DATA_N DATE NOT NULL, -- DATA DE NASCIMENTO 
                DATALOGIN VARCHAR (15) NOT NULL,
                FOREIGN KEY (ID_ADM) REFERENCES ADM_CADASTRO (ID_ADM)
            );
            
-- CRIAÇÃO TABELAS FUNCIONARIOS;
 
CREATE
    TABLE
        CADASTRO_FUNCIONARIOS
            (     
                ID_FUN INT PRIMARY KEY NOT NULL,
                NOME VARCHAR (50) NOT NULL,
                CPF CHAR (11),
                DATA_N DATE NOT NULL,
                SEXO VARCHAR (50) NOT NULL                
            );
            
CREATE 
    TABLE
        FUNCIONARIOS
            ( 
                ID_FUN INT NOT NULL,
                NOME VARCHAR (50) NOT NULL,
                FUNCAO VARCHAR (50) NOT NULL,
                CPF CHAR (11),
                CELULAR CHAR (11),
                EMAIL VARCHAR (50),
                SALARIO_BRUTO DECIMAL NOT NULL,
                SALARIO_LIQUIDO DECIMAL NOT NULL,
                ENDERECO CHAR (50),
                FOREIGN KEY (ID_FUN) REFERENCES CADASTRO_FUNCIONARIOS (ID_FUN) 
            );
            
-- CADASTRO GADO
CREATE
    TABLE 
        CADASTRO_GADO
            (
                ID_GADO INT PRIMARY KEY NOT NULL,
                LOTE VARCHAR (10) NOT NULL,
                NOME VARCHAR (50) NOT NULL,
                CODIGO VARCHAR (50) NOT NULL,
                PESO VARCHAR (50) NOT NULL,
                SEXO VARCHAR (50) NOT NULL,
                COR VARCHAR (50) NOT NULL
            );
            
CREATE 
    TABLE 
        DADOS_GADO
            (
                ID_GADO INT NOT NULL,
                LOTE VARCHAR (10) NOT NULL,
                NOME VARCHAR (50) NOT NULL,
                CODIGO VARCHAR (50) NOT NULL,
                PESO VARCHAR (50) NOT NULL,
                SEXO VARCHAR (50) NOT NULL,
                COR VARCHAR (50) NOT NULL,
                ATUAL_TEMP_LEITE VARCHAR (50) NOT NULL,
                ULTIMA_ORDENHA DATE NOT NULL,
                FOREIGN KEY (ID_GADO) REFERENCES CADASTRO_GADO (ID_GADO)
            );
 
CREATE
    TABLE
        LOTE
            ( 
                ID_LOTE INT NOT NULL,
                ID_GADO INT NOT NULL,
                LOTE VARCHAR (50) NOT NULL,
                PROD_POR_LOTE VARCHAR (50),
                FOREIGN KEY (ID_GADO) REFERENCES CADASTRO_GADO (ID_GADO)
            );
 
CREATE 
    TABLE     
        REGISTRO_MEDICO
            (     
                ID_GADO INT NOT NULL,
                TIPO_TRATAMENTO VARCHAR (100) NOT NULL,
                TEMPO_TRATAMENTO VARCHAR (50) NOT NULL,
                EST_PARTO VARCHAR (50) NOT NULL,
                FOREIGN KEY (ID_GADO) REFERENCES CADASTRO_GADO (ID_GADO)
                );
 
-- PRODUTOS DE VENDAS  
CREATE    
    TABLE     
        PRO_VENDAS
            (
                ID_PRO INT PRIMARY KEY NOT NULL,
                NOME VARCHAR (50) NOT NULL,
                TIPO VARCHAR (50) NOT NULL,
                ESTOQUE_ATUAL VARCHAR (50) NOT NULL,
                PRECO DECIMAL NOT NULL
            );
-- EQUIPAMENTOS 
CREATE 
    TABLE     
        EQUIPAMENTOS
            (    
                ID_EQUI INT NOT NULL,
                NOME VARCHAR (50) NOT NULL,
                QUANTIDADE VARCHAR (50) NOT NULL
            );
            
-- VAREJISTAR PARCEIROS 
CREATE    
    TABLE
        VAREJISTAS 
        ( 
            ID_VA INT PRIMARY KEY NOT NULL,
            NOME_FANTASIA VARCHAR (50) NOT NULL,
            RAZAO_SOCIAL VARCHAR (50) NOT NULL,
            ENDEREÇO VARCHAR (50) NOT NULL,
            CNPJ CHAR (14),
            CPF CHAR (11), 
            TELEFONE CHAR (11)
            );
 
CREATE 
    TABLE 
        PRODUTOS_COMPRADOS
            (     
                ID_COMPRA INT NOT NULL,
                ID_VA INT NOT NULL,
                ID_PRO INT NOT NULL,
                NOME_FANTASIA VARCHAR (50) NOT NULL,
                PRODUTO VARCHAR (50) NOT NULL,
                FOREIGN KEY (ID_PRO) REFERENCES PRO_VENDAS (ID_PRO),
                FOREIGN KEY (ID_VA) REFERENCES VAREJISTAS (ID_VA)
            );
