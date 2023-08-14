CREATE TABLE TB_CATEGORIA 
(
    ID_CATEGORIA            SMALLINT    IDENTITY(1,1)   NOT NULL,
    ID_CATEGORIA_SUPERIOR   SMALLINT    NULL,
    NM_CATEGORIA            VARCHAR(30) UNIQUE,

    CONSTRAINT PK_TB_CATEGORIA_ID_CATEGORIA             PRIMARY KEY (ID_CATEGORIA), 
    CONSTRAINT FK_TB_CATEGORIA_ID_CATEGORIA_SUPERIOR    FOREIGN KEY (ID_CATEGORIA_SUPERIOR) REFERENCES TB_CATEGORIA (ID_CATEGORIA)  
);

SELECT * FROM TB_CATEGORIA;

INSERT INTO TB_CATEGORIA
(NM_CATEGORIA) 
VALUES
('CREME'),
('SABONETE'),
('BANHO'),
('CAMA'),
('MESA');

UPDATE TB_CATEGORIA SET ID_CATEGORIA_SUPERIOR = 4 WHERE NM_CATEGORIA = 'SHAMPOO';
UPDATE TB_CATEGORIA SET ID_CATEGORIA_SUPERIOR = 4 WHERE NM_CATEGORIA = 'SABONETE';
UPDATE TB_CATEGORIA SET ID_CATEGORIA_SUPERIOR = 4 WHERE NM_CATEGORIA = 'CREME';

CREATE TABLE TB_CLIENTE
(   
    ID_CLIENTE      INT             NOT NULL    IDENTITY(1,1), 
    NM_CLIENTE      VARCHAR(200)    NOT NULL,
    DS_EMAIL        VARCHAR(200)    NOT NULL    UNIQUE,
    NR_TELEFONE     VARCHAR(15)     NOT NULL,

    CONSTRAINT PK_TB_CLIENTE_ID_CLIENTE     PRIMARY KEY (ID_CLIENTE),
    CONSTRAINT SO_NR_TB_CLIENTE_NR_TELEFONE CHECK (NR_TELEFONE NOT LIKE '%[^0-9]%')
); 
--Adicionando dados com letra no campo de telefone para teste:
INSERT INTO TB_CLIENTE
(
    NM_CLIENTE,
    DS_EMAIL,
    NR_TELEFONE
)
VALUES
(
    'JOAO MENDES',
    'mendes@email.com',
    'ABCDE'
);
--Adicionando dados da maneira correta:
INSERT INTO TB_CLIENTE
(
    NM_CLIENTE,
    DS_EMAIL,
    NR_TELEFONE
)
VALUES
(
    'ROBSON ANTUNES',
    'robson@email.com',
    '55646758'
);

INSERT INTO TB_CLIENTE VALUES 
(
    'JOSE CANSECO',
    'canseco@email.com',
    '998749636'
),
(
    'BENITO DE PAULA',
    'benito@email.com',
    '987452145'
),
(
    'CAIN VELASQUEZ',
    'cain@email.com',
    '47541898'
),
(
    'RUTH ESCOBAR',
    'escobar@email.com',
    '69637842'
),
(
    'JUAN PABLO MONTOYA',
    'montoya@email.com',
    '945327878'
)

SELECT * FROM TB_CLIENTE;

CREATE TABLE TB_ENDERECO 
(
    ID_ENDERECO         INT             NOT NULL    IDENTITY,
    DS_ENDERECO         VARCHAR(100)    NOT NULL, 
    DS_COMPLEMENTO      VARCHAR(50)     NULL,
    NM_CIDADE           VARCHAR(100)    NOT NULL,
    NM_ESTADO           VARCHAR(50)     NOT NULL,
    NM_PAIS             VARCHAR(50)     NOT NULL,
    CD_CODIGO_POSTAL    VARCHAR(20)     NOT NULL,

    CONSTRAINT PK_TB_ENDERECO_ID_DS_CD_CLIENTE  PRIMARY KEY (ID_ENDERECO),
    CONSTRAINT UQ_TB_ENDERECO                   UNIQUE (DS_ENDERECO,DS_COMPLEMENTO,CD_CODIGO_POSTAL)
);

INSERT INTO TB_ENDERECO
(
    DS_ENDERECO,
    DS_COMPLEMENTO,
    NM_CIDADE,
    NM_ESTADO,
    NM_PAIS,
    CD_CODIGO_POSTAL
)
VALUES
(
    'RUA ARAGUAI',
    'APTO 10',
    'JABOATAO DOS GUARARAPES',
    'PERNAMBUCO',
    'BRASIL',
    '54470-010'
);

INSERT INTO TB_ENDERECO 
(
    DS_ENDERECO,
    NM_CIDADE,
    NM_ESTADO,
    NM_PAIS,
    CD_CODIGO_POSTAL
) 
VALUES 
(
    'Rua Belvedere, 175',
    'Poa',
    'Sao Paulo',
    'Brasil',
    '08553-000'    
);

INSERT INTO TB_ENDERECO VALUES 
(
    'RUA GUARANI',
    '',
    'EUNAPOLIS',
    'BAHIA',
    'BRASIL',
    '45821-970'
),
(
    'RUA FRANCISCA BATALHA',
    '',
    'UBA',
    'MINAS GERAIS',
    'BRASIL',
    '36500-278'
),
(
    'RUA GIRO',
    'CASA 3',
    'MANAUS',
    'AMAZONAS',
    'BRASIL',
    '69009-072'
),
(
    'RUA BANANA-BRANCA',
    '',
    'SAO PAULO',
    'SAO PAULO',
    'BRASIL',
    '05205-240'
);

SELECT * FROM TB_ENDERECO;

CREATE TABLE TB_ENDERECO_CLIENTE 
(
    ID_CLIENTE          INT             NOT NULL,
    ID_ENDERECO         INT             NOT NULL,
    DS_TIPO_ENDERECO    VARCHAR(15)     NOT NULL,

    CONSTRAINT FK_TB_ENDERECO_CLIENTE_ID_CLIENTE        FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE (ID_CLIENTE),
    CONSTRAINT FK_TB_ENDERECO_CLIENTE_ID_ENDERECO       FOREIGN KEY (ID_ENDERECO) REFERENCES TB_ENDERECO (ID_ENDERECO),
    CONSTRAINT PK_TB_ENDERECO_CLIENTE                   PRIMARY KEY (ID_CLIENTE,ID_ENDERECO),
    CONSTRAINT CK_TB_ENDERECO_CLIENTE_DS_TIPO_ENDERECO  CHECK (DS_TIPO_ENDERECO IN ('Comercial','Residencial'))
);

INSERT INTO TB_ENDERECO_CLIENTE VALUES
(
    7,
    6,
    'Residencial'
),
(
    2,
    3,
    'Residencial'
),
(
    3,
    4,
    'Residencial'
),
(
    4,
    5,
    'Comercial'
),
(
    5,
    6,
    'Residencial'
)

SELECT * FROM TB_ENDERECO_CLIENTE

CREATE TABLE TB_PRODUTO
(
    ID_PRODUTO          INT             NOT NULL    IDENTITY(1,1),
    NM_PRODUTO          VARCHAR(150)    NOT NULL,
    CD_PRODUTO          CHAR(13)        NOT NULL,
    DS_COR              VARCHAR(30)     NOT NULL,
    VL_PRECO_CUSTO      DECIMAL(9,2)    NOT NULL,
    VL_PRECO_VENDA      DECIMAL(9,2)    NOT NULL,
    VL_PESO             DECIMAL(9,3)    NOT NULL,
    ID_CATEGORIA        SMALLINT        NOT NULL,
    DT_INICIO_VENDA     DATE            NOT NULL,
    DT_FIM_VENDA        DATE            NULL,
    DS_ARQUIVO_FOTO     VARCHAR(100)    NULL,

    CONSTRAINT PK_TB_PRODUTO_ID_PRODUTO     PRIMARY KEY (ID_PRODUTO),
    CONSTRAINT UQ_TB_PRODUTO_NM_PRODUTO     UNIQUE (NM_PRODUTO),
    CONSTRAINT UQ_TB_PRODUTO_CD_PRODUTO     UNIQUE (CD_PRODUTO),
    CONSTRAINT CK_TB_PRODUTO_VL_PRECO_CUSTO CHECK (VL_PRECO_CUSTO >= 0),
    CONSTRAINT CK_TB_PRODUTO_VL_PRECO_VENDA CHECK (VL_PRECO_VENDA >= 0),
    CONSTRAINT CK_TB_PRODUTO_VL_PESO        CHECK (VL_PESO >= 0),
    CONSTRAINT FK_TB_PRODUTO_ID_CATEGORIA   FOREIGN KEY (ID_CATEGORIA) REFERENCES TB_CATEGORIA (ID_CATEGORIA),
    CONSTRAINT CK_TB_PRODUTO_DT_FIM_VENDA   CHECK (DT_FIM_VENDA >= DT_INICIO_VENDA)
);

INSERT INTO TB_PRODUTO
(
    NM_PRODUTO,
    CD_PRODUTO,
    DS_COR,
    VL_PRECO_CUSTO,
    VL_PRECO_VENDA,
    VL_PESO,
    ID_CATEGORIA,
    DT_INICIO_VENDA
)
VALUES
(
    'SABONETE DOVE',
    '0000001236547',
    'BRANCO',
    1.10,
    2.50,
    0.080,
    4,
    '2021-06-25'
),
(
    'COLCHA CASAL',
    '0001009874125',
    'AZUL CELESTE',
    8.60,
    50.75,
    1.200,
    5,
    '2021-06-25'
),
(
    'TOALHA MESA FLORIDA',
    '0001009876543',
    'VARIOS',
    5.60,
    19.99,
    1.950,
    6,
    '2021-06-25'
),
(
    'FRONHA',
    '0001002319874',
    'VERDE',
    5.80,
    12.90,
    0.400,
    5,
    '2021-06-25'
);

SELECT * FROM TB_PRODUTO;

CREATE TABLE TB_VENDA 
(
    ID_VENDA                BIGINT          IDENTITY,
    DT_VENDA                DATETIME2       NOT NULL    CONSTRAINT DF_TB_VENDA_DT_VENDA DEFAULT GETDATE(),
    DT_ENVIO                DATETIME2       NULL,
    DT_ENTREGA              DATETIME2       NULL,
    DS_STATUS               VARCHAR(30)     NOT NULL,
    ID_CLIENTE              INT             NOT NULL,
    ID_ENDERECO_ENTREGA     INT             NOT NULL,
    ID_ENDERECO_COBRANCA    INT             NOT NULL,
    VL_SUBTOTAL             DECIMAL(9,2)    NOT NULL,
    VL_FRETE                DECIMAL(9,2)    NOT NULL,

    CONSTRAINT PK_TB_VENDA_ID_VENDA             PRIMARY KEY (ID_VENDA),
    CONSTRAINT CK_TB_VENDA_DT_ENVIO             CHECK (DT_ENVIO >= DT_VENDA),
    CONSTRAINT CK_TB_VENDA_DT_ENTREGA           CHECK (DT_ENTREGA >= DT_VENDA),
    CONSTRAINT CK_TB_VENDA_DS_STATUS            CHECK (DS_STATUS IN ('Aguardando pagamento','Em transporte','Entregue','Cancelado')),
    CONSTRAINT FK_TB_VENDA_ID_CLIENTE           FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE (ID_CLIENTE),
    CONSTRAINT FK_TB_VENDA_ID_ENDERECO_ENTREGA  FOREIGN KEY (ID_ENDERECO_ENTREGA) REFERENCES TB_ENDERECO (ID_ENDERECO),
    CONSTRAINT FK_TB_VENDA_ID_ENDERECO_COBRANCA FOREIGN KEY (ID_ENDERECO_COBRANCA) REFERENCES TB_ENDERECO (ID_ENDERECO),
    CONSTRAINT CK_TB_VENDA_VL_SUBTOTAL          CHECK (VL_SUBTOTAL >= 0),
    CONSTRAINT CK_TB_VENDA_VL_FRETE             CHECK (VL_FRETE >= 0)
);

INSERT INTO TB_VENDA
(
    DS_STATUS,
    ID_CLIENTE,
    ID_ENDERECO_ENTREGA,
    ID_ENDERECO_COBRANCA,
    VL_SUBTOTAL,
    VL_FRETE
)
VALUES
(
    GETDATE(),
    'Aguardando pagamento',
    2,
    1,
    1,
    40.50,
    100.50
);

INSERT INTO TB_VENDA VALUES
(
    GETDATE(),
    '2021-06-26',
    '2021-06-27',
    'Em transporte',
    3,
    4,
    4,
    350.80,
    100
),
(
    GETDATE(),
    '2021-06-26',
    '2021-06-27',
    'Aguardando pagamento',
    2,
    3,
    3,
    200.12,
    100
),
(
    GETDATE(),
    '2021-06-26',
    '2021-06-27',
    'Entregue',
    7,
    6,
    6,
    50.45,
    50
),
(
    GETDATE(),
    '2021-06-26',
    '2021-06-27',
    'Aguardando pagamento',
    4,
    5,
    5,
    68.40,
    100
),
(
    GETDATE(),
    '2021-06-26',
    '2021-06-27',
    'Cancelado',
    5,
    6,
    6,
    36.90,
    10.80
);

SELECT * FROM TB_VENDA

CREATE TABLE TB_VENDA_ITEM
(
    ID_VENDA                BIGINT          NOT NULL,
    ID_VENDA_ITEM           SMALLINT        NOT NULL,
    ID_PRODUTO              INT             NOT NULL,
    QT_ITEM                 SMALLINT        NOT NULL,
    VL_PRECO_UNITARIO       DECIMAL(9,2)    NOT NULL,
    VL_DESCONTO_UNITARIO    DECIMAL(9,2)    NULL,

    CONSTRAINT PK_TB_VENDA_ITEM_ID_VENDA_ID_VENDA_ITEM  PRIMARY KEY (ID_VENDA,ID_VENDA_ITEM),
    CONSTRAINT FK_TB_VENDA_ITEM_ID_VENDA                FOREIGN KEY (ID_VENDA) REFERENCES TB_VENDA (ID_VENDA),
    CONSTRAINT FK_TV_VENDA_ITEM_ID_PRODUTO              FOREIGN KEY (ID_PRODUTO) REFERENCES TB_PRODUTO (ID_PRODUTO),
    CONSTRAINT CK_TB_VENDA_ITEM_QT_ITEM                 CHECK (QT_ITEM > 0),
    CONSTRAINT CK_TB_VENDA_ITEM_VL_PRECO_UNITARIO       CHECK (VL_PRECO_UNITARIO > 0),
    CONSTRAINT CK_TB_VENDA_ITEM_VL_DESCONTO_UNITARIO    CHECK (VL_DESCONTO_UNITARIO > 0) 
);

INSERT INTO TB_VENDA_ITEM VALUES
(
    2,
    1,
    6,
    12,
    2.50,
    1
);

INSERT INTO TB_VENDA_ITEM VALUES
(
    1,
    2,
    9,
    5,
    12.90,
    0.01
),
(
    3,
    3,
    6,
    1,
    2.50,
    0.01
),
(
    4,
    4,
    7,
    40,
    50.75,
    5.05
),
(
    14,
    5,
    8,
    3,
    19.99,
    2.25
);

SELECT * FROM TB_CLIENTE;

SELECT * FROM TB_ENDERECO;

SELECT * FROM TB_VENDA;

UPDATE TB_PRODUTO SET VL_PRECO_VENDA = VL_PRECO_CUSTO + (VL_PRECO_CUSTO * 0.25);

UPDATE TB_VENDA SET DT_ENTREGA = '2021-12-31' WHERE ID_VENDA = 1;

DELETE TB_VENDA_ITEM WHERE ID_VENDA_ITEM IN(4, 5);

DELETE FROM TB_CLIENTE;

INSERT INTO TB_VENDA VALUES
(
    GETDATE(),
    NULL,
    NULL,
    'Em transporte',
    3,
    4,
    4,
    350.80,
    100
)