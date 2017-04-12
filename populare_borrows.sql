DECLARE
  v_nr_user pls_integer;
  v_nr_book pls_integer;
  v_contor_user INTEGER;
  v_contor_isbn INTEGER;
  v_id_final userr.id_user%type;
  v_isbn_final books.isbn%type;
  v_id userr.id_user%type;
BEGIN
  FOR v_contor IN 1..500
  LOOP
    DECLARE
      CURSOR lista_isbn
      IS
        SELECT isbn FROM books WHERE disponibila=1 ORDER BY isbn;
      v_isbn books.isbn%type;
      CURSOR lista_useri
      IS
        SELECT id_user FROM userr WHERE nr_carti_permise>0 AND penalizari<3;
    BEGIN
      OPEN lista_useri;
      OPEN lista_isbn;
      v_contor_user:=0;
      v_contor_isbn:=0;
      v_nr_book    :=dbms_random.value(1,10011);
      v_nr_user    :=dbms_random.value(1,10011);
      LOOP
        FETCH lista_useri INTO v_id;
        EXIT
      WHEN lista_useri%NOTFOUND;
        -- DBMS_OUTPUT.PUT_LINE(v_id);
        v_contor_user  :=v_contor_user+1;
        IF v_contor_user=v_nr_user THEN
          v_id_final   :=v_id;
          EXIT;
        END IF;
      END LOOP;
      LOOP
        FETCH lista_isbn INTO v_isbn;
        EXIT
      WHEN lista_isbn%NOTFOUND;
        --DBMS_OUTPUT.PUT_LINE(v_isbn);
        v_contor_isbn  :=v_contor_isbn+1;
        IF v_contor_isbn=v_nr_book THEN
          v_isbn_final :=v_isbn;
          EXIT;
        END IF;
      END LOOP;
      CLOSE lista_useri;
      CLOSE lista_isbn;
    END;
    INSERT
    INTO borrows
      (
        id_user,
        isbn,
        data_imprumut,
        data_scadenta,
        penalizare
      )
      VALUES
      (
        v_id_final,
        v_isbn_final,
        TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-12','J') ) ),'J' ),
        TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-04-12','J') ,TO_CHAR(DATE '2017-04-17','J') ) ),'J' ),
        0
      );
    UPDATE userr SET nr_carti_permise=nr_carti_permise-1 WHERE id_user=v_id_final;
    UPDATE books SET disponibila=0 WHERE isbn=v_isbn_final;
  END LOOP;
END; 