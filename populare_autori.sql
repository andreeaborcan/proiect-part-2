SET SERVEROUTPUT ON;
DECLARE
  f UTL_FILE.FILE_TYPE;
  f2 UTL_FILE.FILE_TYPE;
  s    VARCHAR2(200);
  s2   VARCHAR2(200);
  v_nr INTEGER:=1;
BEGIN
  f := UTL_FILE.FOPEN('XSAMPLE','autori.txt','R');
  IF UTL_FILE.IS_OPEN(f) THEN
    LOOP
      BEGIN
        BEGIN
          v_nr:=v_nr+1;
          UTL_FILE.GET_LINE(f,s);
          --UTL_FILE.GET_LINE(f2,s2);
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
          EXIT;
        END ;
        if s is not null then
        INSERT
        INTO authors
          (
            id_autor,
            nume_autor,
            tara,
            data_nasterii,
            DATA_MORTII
          )
          VALUES
          (
            v_nr,
            s,
            'Romania',
            TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '1800-01-01','J') ,TO_CHAR(DATE '1997-12-31','J') ) ),'J' ),
            TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '1998-01-01','J') ,TO_CHAR(DATE '2016-12-31','J') ) ),'J' )
          );
          end if;
        --dbms_output.put_line(s||'********'||s2);
        --dbms_output.put_line(v_nr);
      END;
    END LOOP;
    COMMIT;
  END IF;
END;