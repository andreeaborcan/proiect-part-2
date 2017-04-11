SET SERVEROUTPUT ON;
DECLARE
  f UTL_FILE.FILE_TYPE;
  f2 UTL_FILE.FILE_TYPE;
  s    VARCHAR2(200);
  s2   VARCHAR2(200);
  v_nr INTEGER:=5555;
BEGIN
  f  := UTL_FILE.FOPEN('XSAMPLE','nume.txt','R');
  f2 := UTL_FILE.FOPEN('XSAMPLE','prenuma.txt','R');
  IF UTL_FILE.IS_OPEN(f) AND UTL_FILE.IS_OPEN(f2) THEN
    LOOP
      BEGIN
        BEGIN
          v_nr:=v_nr+1;
          UTL_FILE.GET_LINE(f,s);
          UTL_FILE.GET_LINE(f2,s2);
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
         exit;
        END ;
        INSERT
        INTO userr
          (
            id_user,nume,parola,user_role,ocupatie,nr_telefon
          )
          VALUES
          (v_nr,
            concat(s2,concat(' ',s)),
            dbms_random.string('A',10),'Cititor','Student',concat('0776113242',to_char(v_nr))
          );
        --dbms_output.put_line(s||'********'||s2);
         --dbms_output.put_line(v_nr);
      END;
    END LOOP;
    COMMIT;
  END IF;
END;