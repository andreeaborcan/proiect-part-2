SET SERVEROUTPUT ON;
DECLARE
  f UTL_FILE.FILE_TYPE;
  f2 UTL_FILE.FILE_TYPE;
  s    VARCHAR2(200);
  s2   VARCHAR2(200);
  v_nr INTEGER:=1;
BEGIN
  f  := UTL_FILE.FOPEN('XSAMPLE','publicatii.txt','R');
 
  IF UTL_FILE.IS_OPEN(f) THEN
    LOOP
      BEGIN
        BEGIN
          v_nr:=v_nr+1;
          UTL_FILE.GET_LINE(f,s);
          --UTL_FILE.GET_LINE(f2,s2);
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
         exit;
        END ;
        INSERT
        INTO publishings
          (
            id_editura,nume_editura,adresa
          )
          VALUES
          (v_nr,
            s,
           concat('Aleea Rozelor nr. ', to_char( v_nr))
          );
        --dbms_output.put_line(s||'********'||s2);
         --dbms_output.put_line(v_nr);
      END;
    END LOOP;
    COMMIT;
  END IF;
END;