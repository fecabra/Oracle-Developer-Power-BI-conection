--------------------------------------------------------
--  Arquivo criado - Quinta-feira-Maio-19-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type LISTA_LIVROS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "ALUNO"."LISTA_LIVROS" as table of t_livro;

/
--------------------------------------------------------
--  DDL for Type LISTA_TELEFONES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "ALUNO"."LISTA_TELEFONES" 
as varray(5) of varchar2(10)

/
--------------------------------------------------------
--  DDL for Type T_ENDERECO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "ALUNO"."T_ENDERECO" as object (
rua     varchar2(50),
cidade  varchar2(50),
uf     char(2),
cep    number(8)
)

/
--------------------------------------------------------
--  DDL for Type T_FUNCIONARIO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "ALUNO"."T_FUNCIONARIO" as object (
matricula     number(5),
nome          varchar2(50),
data_admissao date,
endereco t_endereco)

/
--------------------------------------------------------
--  DDL for Type T_LIVRO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "ALUNO"."T_LIVRO" as object (
numero number(4),
titulo varchar2(40) )

/
--------------------------------------------------------
--  DDL for Table FUNCIONARIOS
--------------------------------------------------------

  CREATE TABLE "ALUNO"."FUNCIONARIOS" OF "ALUNO"."T_FUNCIONARIO" 
 OIDINDEX  ( PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ) 
 SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MATERIAL_DISCIPLINA
--------------------------------------------------------

  CREATE TABLE "ALUNO"."MATERIAL_DISCIPLINA" 
   (	"DEPARTAMENTO" CHAR(4 BYTE), 
	"CURSO" NUMBER(3,0), 
	"LIVROS_REQUERIDOS" "ALUNO"."LISTA_LIVROS" 
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 NESTED TABLE "LIVROS_REQUERIDOS" STORE AS "LIVROS_REQUERIDOS_TAB"
 (PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
 NOCOMPRESS 
  TABLESPACE "USERS" ) RETURN AS VALUE;
--------------------------------------------------------
--  DDL for Table PESSOA
--------------------------------------------------------

  CREATE TABLE "ALUNO"."PESSOA" 
   (	"NOME" VARCHAR2(25 BYTE), 
	"TELEFONE" "ALUNO"."LISTA_TELEFONES" 
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TESTE
--------------------------------------------------------

  CREATE TABLE "ALUNO"."TESTE" 
   (	"ID_TESTE" NUMBER(*,0), 
	"NOME_TESTE" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into ALUNO.FUNCIONARIOS
SET DEFINE OFF;
Insert into ALUNO.FUNCIONARIOS (MATRICULA,NOME,DATA_ADMISSAO,ENDERECO) values ('1','Mariana',to_date('29/09/20','DD/MM/RR'),ALUNO.T_ENDERECO('rua da consolacao, 900', 'sao paulo', 'sp', 99999999));
Insert into ALUNO.FUNCIONARIOS (MATRICULA,NOME,DATA_ADMISSAO,ENDERECO) values ('2','Joao Vitor',to_date('29/09/20','DD/MM/RR'),ALUNO.T_ENDERECO('rua da consolacao, 900', 'sao paulo', 'sp', 99999999));
REM INSERTING into ALUNO.MATERIAL_DISCIPLINA
SET DEFINE OFF;
Insert into ALUNO.MATERIAL_DISCIPLINA (DEPARTAMENTO,CURSO,LIVROS_REQUERIDOS) values ('ccft','10',ALUNO.LISTA_LIVROS(ALUNO.T_LIVRO(1, 'Oracle 9i'), ALUNO.T_LIVRO(2, 'Oracle 8i')));
REM INSERTING into ALUNO.PESSOA
SET DEFINE OFF;
Insert into ALUNO.PESSOA (NOME,TELEFONE) values ('Mariana',ALUNO.LISTA_TELEFONES('1', '2', '3', '4', '5'));
REM INSERTING into ALUNO.TESTE
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_FK0000073359N00003$
--------------------------------------------------------

  CREATE INDEX "ALUNO"."SYS_FK0000073359N00003$" ON "ALUNO"."LIVROS_REQUERIDOS_TAB" ("NESTED_TABLE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table MATERIAL_DISCIPLINA
--------------------------------------------------------

  ALTER TABLE "ALUNO"."MATERIAL_DISCIPLINA" ADD UNIQUE ("LIVROS_REQUERIDOS") RELY
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TESTE
--------------------------------------------------------

  ALTER TABLE "ALUNO"."TESTE" ADD PRIMARY KEY ("ID_TESTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FUNCIONARIOS
--------------------------------------------------------

  ALTER TABLE "ALUNO"."FUNCIONARIOS" ADD UNIQUE ("SYS_NC_OID$") RELY
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
