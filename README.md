# DesafioSql

Desafio de um curso de Sql de uma empresa (confidencial)

Linguagem SQL

Desafio ANAC

O Voo Regular Ativo – VRA é uma base de dados composta por informações de voos de empresas de transporte aéreo regular que apresenta os cancelamentos e horários em que os voos ocorreram. A ANAC torna pública a série histórica do Voo Regular Ativo para que sejam
realizados estudos e análises. 

TB_AERODROMO: tabela com os dados sobre todos os aeródromos.
Aeródromo é toda área destinada a pouso, decolagem e movimentação de
aeronaves. Aeroportos são aeródromos dotados de instalações e facilidades para
apoio de operações de aeronaves, de embarque e desembarque de pessoas e
cargas.
NOME DA COLUNA DATA TYPE DETALHAMENTO
ID smallint Código identificador do aeródromo no sistema.
SG_AERODROMO char(4)
Sigla ICAO (Organização da Aviação Civil
Internacional) do aeródromo.
NM_AERODROMO varchar(255) Nome do aeródromo.
NM_CIDADE varchar(255)
Nome da cidade onde o aeródromo está
localizado, nem todos possuem está informação.
SG_UF char(2)
Sigla da Unidade Federativa, disponível apenas
para aeródromos no Brasil.
NM_PAIS varchar(255)
Nome do país onde o aeródromo está
localizado.
NM_CONTINENTE varchar(255)
Nome do continente onde o aeródromo está
localizado.
TB_EMPRESA: tabela com os dados sobre todas as empresas que prestam
serviços aéreos.
NOME DA COLUNA DATA TYPE DETALHAMENTO
ID tinyint
Código numérico identificador da empresa no
sistema.
SG_EMPRESA char(3)
Sigla ICAO da empresa aérea. Refere-se ao
designador da empresa de transporte aéreo
obtido junto à ICAO (Organização da Aviação
Civil Internacional).
NM_EMPRESA varchar(255) Nome da empresa aérea.
DS_TIPO_EMPRESA varchar(255)
Descrição do tipo de empresa. Refere-se à
descrição da nacionalidade da empresa
(brasileira, estrangeira ou não infarmado).
TB_JUSTIFICATIVA: tabela com os dados sobre as justificativas dos
cancelamentos, antecipações ou atrasos dos voos.
NOME DA COLUNA DATA TYPE DETALHAMENTO
ID tinyint
Código numérico identificador da justificativa no
sistema.
SG_JUSTIFICATIVA char(2) Sigla da justificativa.
DS_JUSTIFICATIVA varchar(255) Descrição da justificativa.
TB_TIPO_LINHA: tabela com os dados que identifica o tipo de linha dos voos. O
Tipo de Linha identifica o tipo de operação realizada no voo, podendo ser
classificado em:
N - Doméstica Mista: para operações de transporte aéreo de passageiros ou cargas, em que todos os aeródromos
envolvidos estejam situados simultaneamente em território brasileiro;
C - Doméstica Cargueira: para operações de transporte aéreo exclusivo de carga e/ou mala postal em que todos os
aeródromos envolvidos estejam situados simultaneamente em território brasileiro;
I - Internacional Mista: para operações de transporte aéreo de passageiros ou cargas, em que ao menos um dos
aeródromos envolvidos esteja situado em território estrangeiro;
G - Internacional Cargueira: para operações de transporte aéreo exclusivo de carga e/ou rede postal em que ao
menos um dos aeródromos envolvidos esteja situado em território estrangeiro;
NOME DA COLUNA DATA TYPE DETALHAMENTO
ID tinyint
Código numérico identificador do tipo de linha
no sistema.
CD_TIPO_LINHA char(1) Caractere que identifica o tipo de linha
DS_SERVICO_TIPO_LINHA varchar(255)
Descrição do serviço referente ao tipo de linha
(Mista/Cargueira).
DS_NATUREZA_TIPO_LINHA varchar(255)
Descrição da natureza da etapa de voo
(Internacional/Doméstica).
TB_TIPO_VOO: tabela com os dados para identificação do tipo de voo.
NOME DA COLUNA DATA TYPE DETALHAMENTO
ID tinyint
Código numérico identificador do tipo de voo no
sistema.
DS_TIPO_VOO varchar(255)
Descrição referente ao tipo de autorização para
o voo, assumindo os seguintes valores: Regular,
Extra, Retorno, Inclusão de Etapa, Não
Remunerado, Fretamento ou Charter.
DS_CLASSIFICACAO_VOO varchar(255)
Descrição do Tipo de Voo. Refere-se ao
agrupamento das classificações em tipos de
operações: Regular, Não regular ou Improdutivo
TB_VOO: tabela com os dados dos voos do primeiro trimestre de 2020 realizados por aeronaves com
decolagem e/ou pouso em território brasileiro. Os dados representam os status do voo entre os aeródromos
de origem e destino da aeronave. Considera-se voo a operação de uma aeronave entre a decolagem e o
pouso, a ligação entre dois aeródromos.
NOME DA COLUNA DATA TYPE DETALHAMENTO
ID_VOO int Código numérico identificador único do voo no sistema.
ID_EMPRESA tinyint Código numérico identificador da empresa no sistema.
NR_VOO float Número do voo. Refere-se ao número atribuído à operação de uma etapa ou de uma
série de etapas registradas sob a mesma numeração de voo.
ID_TIPO_VOO tinyint Código numérico identificador do tipo de voo no sistema.
ID_TIPO_LINHA tinyint Código numérico identificador do tipo de linha no sistema.
ID_AERODROMO_ORIGEM smallint Código identificador do aeródromo de ORIGEM no sistema.
ID_AERODROMO_DESTINO smallint Código identificador do aeródromo de DESTINO no sistema.
DT_HR_PARTIDA_PREVISTA datetime Data e horário de Referência. Corresponde à Data Prevista de Início do Voo, qualquer
diferença entre prevista e real será considerado antecipação ou atraso.
DT_HR_PARTIDA_REAL datetime Data e horário de partida do voo, apurado pelo critério do calço e descalço.
DT_HR_CHEGADA_PREVISTA datetime Data e horário de Referência. Corresponde à Data Prevista de Fim do Voo, qualquer
diferença entre prevista e real será considerado antecipação ou atraso.
DT_HR_CHEGADA_REAL datetime Data e horário de chegada do voo, apurado pelo critério do calço e descalço.
FL_SITUACAO bit Identificador de voo realizado, onde o valor 1 identifica que voo foi REALIZADO e o valor
0 representa que o voo foi CANCELADO.
ID_JUSTIFICATIVA tinyint Código numérico identificador da justificativa no sistema.

QUAIS OS 3 AEROPORTOS (AERÓDROMOS) DE ORIGEM QUE TIVERAM O MAIOR PERCENTUAL DE VOOS DOMÉSTICOS REALIZADOS (QUANTIDADE
DE VOOS REALIZADOS / QUANTIDADE TOTAL DE VOOS), CONSIDERE APENAS OS AEROPORTOS COM MAIS DE 10 MIL VOOS DOMÉSTICOS.
QUAL A DURAÇÃO REAL MÉDIA (EM MINUTOS) DOS VOOS REALIZADOS ENTRE O ESTADO DE SÃO PAULO (ORIGEM) E BUENOS AIRES (DESTINO) NA
ARGENTINA?

QUAL A EMPRESA ESTRANGEIRA COM A MAIOR QUANTIDADE DE VOOS, QUE SÓ ATUOU COM VOOS COM SERVIÇO DE TIPO DE LINHA CARGUEIRA
(NÃO TEVE VOOS COM COM SERVIÇO DE TIPO DE LINHA MISTA)

QUAL A EMPRESA QUE POSSUI A MAIOR MÉDIA DE ATRASADO NA PARTIDA?

QUAL O AEROPORTO (AERÓDROMOS) DE ORIGEM QUE TEVE O MAIOR PERCENTUAL DE VOOS, CLASSIFICADOS COMO REGULARES, CANCELADOS
(QUANTIDADE DE VOOS CANCELADOS/ QUANTIDADE TOTAL DE VOOS), CONSIDERE APENAS OS AEROPORTOS COM MAIS DE 5 MIL VOOS
REGULARES. QUAL A DURAÇÃO REAL MÉDIA (EM MINUTOS) DOS VOOS REALIZADOS ENTRE A CIDADE DE SÃO PAULO (ORIGEM) E A CIDADE DO RIO DE JANEIRO
(DESTINO)?

QUAL A EMPRESA BRASILEIRA COM A MAIOR QUANTIDADE DE VOOS, QUE SÓ ATUOU COM VOOS COM SERVIÇO DE TIPO DE LINHA MISTA (NÃO
TEVE VOOS COM COM SERVIÇO DE TIPO DE LINHA CARGUEIRA) QUAL A EMPRESA QUE POSSUI A MAIOR MÉDIA DE ATRASADO NA CHEGADA?

QUAIS AS 4 EMPRESAS QUE TIVERAM O MAIOR PERCENTUAL DE VOOS INTERNACIONAIS REALIZADOS (QUANTIDADE DE VOOS REALIZADOS /
QUANTIDADE TOTAL DE VOOS), CONSIDERE APENAS AS EMPRESAS COM MAIS DE 1 MIL VOOS INTERNACIONAIS.
QUAL A DURAÇÃO PREVISTA MÉDIA (EM MINUTOS) DOS VOOS REALIZADOS ENTRE O ESTADO DE SÃO PAULO(ORIGEM) E SANTIAGO (DESTINO)
NO CHILE?

QUAL O AEROPORTO DE ORIGEM NO BRASIL COM A MAIOR QUANTIDADE DE VOOS, QUE SÓ ATUOU COM VOOS COM SERVIÇO DE TIPO DE LINHA
MISTA (NÃO TEVE VOOS COM COM SERVIÇO DE TIPO DE LINHA CARGUEIRA)?

QUAL AEROPORTO DE ORIGEM QUE POSSUI A MAIOR MÉDIA DE ATRASADO NA PARTIDA?

QUAL A EMPRESA QUE TEVE O MAIOR PERCENTUAL DE VOOS, COM TIPO REGULAR, CANCELADOS (QUANTIDADE DE VOOS CANCELADOS/
QUANTIDADE TOTAL DE VOOS), CONSIDERE APENAS OS AEROPORTOS COM MAIS DE 1 MIL VOOS REGULARES.
QUAL A DURAÇÃO PREVISTA MÉDIA (EM MINUTOS) DOS VOOS REALIZADOS ENTRE O ESTADO DE SÃO PAULO (ORIGEM) E O ESTADO DO RIO
GRANDE DO SUL (DESTINO)?

QUAL O AEROPORTO DE ORIGEM NO BRASIL COM A MAIOR QUANTIDADE DE VOOS, QUE SÓ ATUOU COM VOOS COM SERVIÇO DE TIPO DE LINHA
MISTA (NÃO TEVE VOOS COM COM SERVIÇO DE TIPO DE LINHA CARGUEIRA)
QUAL AEROPORTO DE DESTINO QUE POSSUI A MAIOR MÉDIA DE ATRASADO NA CHEGADA?
