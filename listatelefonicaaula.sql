
/*VÍTOR TAQUES, MATEUS MOURA, BRENO, THOMAS YASSER NOVALSKI  */

CREATE DATABASE listaTelefonica;

USE listaTelefonica;

CREATE TABLE assinante (
cdAssinante 	SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nmAssinante    VARCHAR (50) NOT NULL,
assRamo		   VARCHAR (50)NOT NULL,
assTipo		   VARCHAR (50)NOT NULL,
assEnd		   INT NOT NULL
);

CREATE TABLE endereco (
cdEmdereco 		SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dsEndereco 		VARCHAR (70)NOT NULL,
nmAssinante     VARCHAR(50)NOT NULL,
complemento		VARCHAR (50)NOT NULL,
bairro			VARCHAR (50)NOT NULL,
CEP				VARCHAR (20)NOT NULL,
assEnd		    INT NOT NULL,
endMunic	    VARCHAR (50)NOT NULL,
endFone		    VARCHAR (50)NOT NULL,
assMunicipio	VARCHAR (50)NOT NULL,
assFone      	INT NOT NULL
);

CREATE TABLE telefone (
cdFone 		 SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ddd   		 VARCHAR(4)NOT NULL,
nFone	     INT NOT NULL,
endFone		 INT NOT NULL,
assFone      INT NOT NULL
);

CREATE TABLE ramo_atividade (
cdRamo		 	SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dsRamo		    VARCHAR(50)NOT NULL , 
assRamo		   VARCHAR (50)NOT NULL 
);

CREATE TABLE tipo_assinante (
cdTipo 		  SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dsTipo    	   VARCHAR(50)NOT NULL,
assTipo		   VARCHAR (50)NOT NULL
);

CREATE TABLE municipio (
cdMunicipio 	SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dsMunicipio     VARCHAR(50)NOT NULL,
endMunic	    VARCHAR (50)NOT NULL,
assMunicipio	VARCHAR (50)NOT NULL
);

SELECT assinante.cdAssinante, endereco.dsEndereco, telefone.nFone
	FROM assinante 
LEFT JOIN endereco 
	ON assinante.cdAssinante = endereco.dsEndereco
LEFT JOIN telefone
	ON assinante.cdAssinante = telefone.nFone
ORDER BY assinante.cdAssinante;


SELECT ramo_atividade.dsRamo, assinante.nmAssinante
	FROM assinante 
INNER JOIN ramo_atividade ON  assinante.assRamo = ramo_atividade.assRamo;

SELECT assinante.nmAssinante 
	FROM assinante
INNER JOIN  tipo_assinante ON assinante.assTipo = tipo_assinante.assTipo
INNER JOIN  endereco ON assinante.assEnd = endereco.assEnd
INNER JOIN  municipio ON endereco.assMunicipio = municipio.assMunicipio
	WHERE dsMunicipio = 'Pelotas'  AND dsTipo = 'Residencial';


SELECT count(nFone), assinante.nmAssinante
	FROM assinante
INNER JOIN  endereco ON assinante.assEnd = endereco.assEnd
INNER JOIN  telefone ON endereco.assFone = telefone.assFone
	GROUP BY nFone
HAVING nFone>1;

SELECT assinante.nmAssinante, nFone, dsTipo
    FROM assinante
INNER JOIN tipo_assinante ON assinante.assTipo = tipo_assinante.assTipo
INNER JOIN endereco ON assinante.assEnd = endereco.assEnd
INNER JOIN telefone ON endereco.assFone = telefone.assFone
INNER JOIN municipio ON endereco.assMunicipio = municipio.assMunicipio
	WHERE dsMunicipio = 'Pelotas' OR 'Cangaçu';
    







