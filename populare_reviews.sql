DECLARE
  v_nr_user pls_integer;
  v_nr_book pls_integer;
  v_contor_user INTEGER;
  v_contor_isbn INTEGER;
  v_id_final userr.id_user%type;
  v_isbn_final books.isbn%type;
  v_id userr.id_user%type;
  v_rand INTEGER;
  v_rand2 integer;
BEGIN
  FOR v_contor IN 1..100
  LOOP
    DECLARE
      CURSOR lista_isbn
      IS
        SELECT isbn FROM books ;
      v_isbn books.isbn%type;
      CURSOR lista_useri
      IS
        SELECT id_user FROM userr WHERE penalizari<3;
    BEGIN
      OPEN lista_useri;
      v_contor_user:=0;
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
      v_rand2:=dbms_random.value(1,20);
      FOR v_contor2 IN 1..v_rand2
      LOOP
        v_contor_isbn:=0;
        v_nr_book    :=dbms_random.value(1,10011);
        OPEN lista_isbn;
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
        CLOSE lista_isbn;
        v_rand  :=dbms_random.value(1,10);
        IF v_rand=1 THEN
          INSERT
          INTO reviews
            (
              id_user,
              isbn,
              review,
              nota,
              data_recenzie
            )
            VALUES
            (
              v_id_final,
              v_isbn_final,
              'Foarte frumoasa',
              TRUNC(dbms_random.value(7,10)),
              TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
            );
        ELSE
          IF v_rand=2 THEN
            INSERT
            INTO reviews
              (
                id_user,
                isbn,
                review,
                nota,
                data_recenzie
              )
              VALUES
              (
                v_id_final,
                v_isbn_final,
                'Mi-a placut mult. o recomand!',
                TRUNC(dbms_random.value(7,10)),
                TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
              );
          ELSE
            IF v_rand=3 THEN
              INSERT
              INTO reviews
                (
                  id_user,
                  isbn,
                  review,
                  nota,
                  data_recenzie
                )
                VALUES
                (
                  v_id_final,
                  v_isbn_final,
                  'A fost o carte neasteptat de interesanta!',
                  TRUNC(dbms_random.value(7,10)),
                  TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                );
            ELSE
              IF v_rand=4 THEN
                INSERT
                INTO reviews
                  (
                    id_user,
                    isbn,
                    review,
                    nota,
                    data_recenzie
                  )
                  VALUES
                  (
                    v_id_final,
                    v_isbn_final,
                    'Una din cartile mele preferate! O adevarata lectie de viata.',
                    TRUNC(dbms_random.value(7,10)),
                    TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                  );
              ELSE
                IF v_rand=5 THEN
                  INSERT
                  INTO reviews
                    (
                      id_user,
                      isbn,
                      review,
                      nota,
                      data_recenzie
                    )
                    VALUES
                    (
                      v_id_final,
                      v_isbn_final,
                      'Am fost profund dezamagit de carte. LA reputatia avuta ma asteptam la mult mai mult.',
                      TRUNC(dbms_random.value(1,7)),
                      TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                    );
                ELSE
                  IF v_rand=6 THEN
                    INSERT
                    INTO reviews
                      (
                        id_user,
                        isbn,
                        review,
                        nota,
                        data_recenzie
                      )
                      VALUES
                      (
                        v_id_final,
                        v_isbn_final,
                        'Desi e o carte atat de veche, e atat de actuala! Bravos!',
                        TRUNC(dbms_random.value(7,10)),
                        TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                      );
                  ELSE
                    IF v_rand=7 THEN
                      INSERT
                      INTO reviews
                        (
                          id_user,
                          isbn,
                          review,
                          nota,
                          data_recenzie
                        )
                        VALUES
                        (
                          v_id_final,
                          v_isbn_final,
                          'Mi-a adus aminte de copilarie. M-a emotionat pana la lacrimi ',
                          TRUNC(dbms_random.value(7,10)),
                          TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                        );
                    ELSE
                      IF v_rand=8 THEN
                        INSERT
                        INTO reviews
                          (
                            id_user,
                            isbn,
                            review,
                            nota,
                            data_recenzie
                          )
                          VALUES
                          (
                            v_id_final,
                            v_isbn_final,
                            'A fost incredibil de plictisitoare! Actiunea e nula!',
                            TRUNC(dbms_random.value(1,7)),
                            TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                          );
                      ELSE
                        IF v_rand=9 THEN
                          INSERT
                          INTO reviews
                            (
                              id_user,
                              isbn,
                              review,
                              nota,
                              data_recenzie
                            )
                            VALUES
                            (
                              v_id_final,
                              v_isbn_final,
                              'O carte cu atateaa minciuni! e strigator la cer',
                              TRUNC(dbms_random.value(1,6)),
                              TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                            );
                        ELSE
                          IF v_rand=10 THEN
                            INSERT
                            INTO reviews
                              (
                                id_user,
                                isbn,
                                review,
                                nota,
                                data_recenzie
                              )
                              VALUES
                              (
                                v_id_final,
                                v_isbn_final,
                                'ce kitsch! O alta carte comerciala care nu spune nimic.',
                                TRUNC(dbms_random.value(1,5)),
                                TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                              );
                          ELSE
                            IF v_rand=11 THEN
                              INSERT
                              INTO reviews
                                (
                                  id_user,
                                  isbn,
                                  review,
                                  nota,
                                  data_recenzie
                                )
                                VALUES
                                (
                                  v_id_final,
                                  v_isbn_final,
                                  'asta se numeste roman de actiune?! serios? Am asteptat pana la ultima pagina actiunea si nimic!',
                                  TRUNC(dbms_random.value(1,7)),
                                  TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                                );
                            ELSE
                              IF v_rand=12 THEN
                                INSERT
                                INTO reviews
                                  (
                                    id_user,
                                    isbn,
                                    review,
                                    nota,
                                    data_recenzie
                                  )
                                  VALUES
                                  (
                                    v_id_final,
                                    v_isbn_final,
                                    'Un roman atat de imprevizibil! am stat cu sufletul la gura pana la ultima pagina. Mi-a placut!',
                                    TRUNC(dbms_random.value(7,10)),
                                    TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                                  );
                              ELSE
                                IF v_rand=13 THEN
                                  INSERT
                                  INTO reviews
                                    (
                                      id_user,
                                      isbn,
                                      review,
                                      nota,
                                      data_recenzie
                                    )
                                    VALUES
                                    (
                                      v_id_final,
                                      v_isbn_final,
                                      'Nici rea, nici buna. Fara prea mult piper dar nici nu pot spune ca a fost total plictisitoare...',
                                      TRUNC(dbms_random.value(6,8)),
                                      TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                                    );
                                ELSE
                                  IF v_rand=14 THEN
                                    INSERT
                                    INTO reviews
                                      (
                                        id_user,
                                        isbn,
                                        review,
                                        nota,
                                        data_recenzie
                                      )
                                      VALUES
                                      (
                                        v_id_final,
                                        v_isbn_final,
                                        'Nu m-a dat pe spate.. ba chiar in unele locuri am avut asa un deja-vu. Atatea repetitii...',
                                        TRUNC(dbms_random.value(5,7)),
                                        TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                                      );
                                  ELSE
                                    IF v_rand=15 THEN
                                      INSERT
                                      INTO reviews
                                        (
                                          id_user,
                                          isbn,
                                          review,
                                          nota,
                                          data_recenzie
                                        )
                                        VALUES
                                        (
                                          v_id_final,
                                          v_isbn_final,
                                          'Multe informatii false. Nu mi-a placut. Singurul lucru interesant a fost mini povestea de iubire, dar nu e un motiv suficient pt a recomanda cartea!',
                                          TRUNC(dbms_random.value(1,6)),
                                          TO_DATE( TRUNC( DBMS_RANDOM.VALUE(TO_CHAR(DATE '2017-01-01','J') ,TO_CHAR(DATE '2017-04-11','J') ) ),'J' )
                                        );
                                    END IF;
                                  END IF;
                                END IF;
                              END IF;
                            END IF;
                          END IF;
                        END IF;
                      END IF;
                    END IF;
                  END IF;
                END IF;
              END IF;
            END IF;
          END IF;
        END IF;
      END LOOP;
      CLOSE lista_useri;
    END;
  END LOOP;
END; 