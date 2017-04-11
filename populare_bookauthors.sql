delete from BOOKauthors ;
INSERT INTO BOOKauthors
  (ISBN,id_autor
  )
SELECT books.ISBN, trunc(DBMS_RANDOM.VALUE(2,5400)) FROM books;