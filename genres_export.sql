--------------------------------------------------------
--  File created - miercuri-aprilie-12-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table GENRES
--------------------------------------------------------

  CREATE TABLE "ADA"."GENRES" 
   (	"ID_GEN" NUMBER(*,0), 
	"NAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APLICATIE" ;
REM INSERTING into ADA.GENRES
SET DEFINE OFF;
Insert into ADA.GENRES (ID_GEN,NAME) values ('9','romantic');
Insert into ADA.GENRES (ID_GEN,NAME) values ('0','liric');
Insert into ADA.GENRES (ID_GEN,NAME) values ('1','epic');
Insert into ADA.GENRES (ID_GEN,NAME) values ('2','teatru');
Insert into ADA.GENRES (ID_GEN,NAME) values ('3','comedie');
Insert into ADA.GENRES (ID_GEN,NAME) values ('4','horror');
Insert into ADA.GENRES (ID_GEN,NAME) values ('5','thriller');
Insert into ADA.GENRES (ID_GEN,NAME) values ('6','actiune');
Insert into ADA.GENRES (ID_GEN,NAME) values ('7','modernist');
Insert into ADA.GENRES (ID_GEN,NAME) values ('10','drama');
--------------------------------------------------------
--  DDL for Index GENRES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADA"."GENRES_PK" ON "ADA"."GENRES" ("ID_GEN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APLICATIE" ;
--------------------------------------------------------
--  Constraints for Table GENRES
--------------------------------------------------------

  ALTER TABLE "ADA"."GENRES" ADD CONSTRAINT "GENRES_PK" PRIMARY KEY ("ID_GEN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APLICATIE"  ENABLE;
  ALTER TABLE "ADA"."GENRES" MODIFY ("ID_GEN" NOT NULL ENABLE);
