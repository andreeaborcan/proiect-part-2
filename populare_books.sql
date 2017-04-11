SET SERVEROUTPUT ON;
DECLARE
  f UTL_FILE.FILE_TYPE;
  f2 UTL_FILE.FILE_TYPE;
  s    VARCHAR2(2000);
  s2   VARCHAR2(2000);
  v_nr INTEGER:=0;
BEGIN
  f  := UTL_FILE.FOPEN('XSAMPLE','titlu2.txt','R');
  f2 := UTL_FILE.FOPEN('XSAMPLE','ISBN2.txt','R');
  IF UTL_FILE.IS_OPEN(f) AND UTL_FILE.IS_OPEN(f2) THEN
    LOOP
      BEGIN
        BEGIN
          v_nr:=v_nr+1;
          UTL_FILE.GET_LINE(f,s);
          UTL_FILE.GET_LINE(f2,s2);
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
          s :='ceva' ||to_char(v_nr)||'--'||to_char(v_nr);
          s2:='Altceva' ||to_char(v_nr)||'--'||to_char(v_nr);
        END ;
        IF v_nr>1517 THEN
          EXIT;
        END IF;
        INSERT
        INTO books
          (
            ISBN,
            titlu,
            id_editura,
            disponibila,
            anul_publicarii
          )
          VALUES
          (
            concat(s2,'-'),
            s,
            dbms_random.value(1,20),1, dbms_random.value(1800,2017)
          );
        --dbms_output.put_line(s||'********'||s2);
         --dbms_output.put_line(v_nr);
      END;
    END LOOP;
    COMMIT;
  END IF;
END;