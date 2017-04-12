create or replace PACKAGE biblioteca AS

        type t_book is table of student.books%rowtype;
        type t_author is table of student.authors%rowtype;
        type t_user is table of student.userr%rowtype;
        type t_rev is table of student.reviews%rowtype;
        
        function proc(p_n in int) return int;
        
END biblioteca;
/


create or replace package body biblioteca as

  function proc(p_n in int) 
  return int as
     
    begin
      dbms_output.put_line('as');
      return p_n;
    end;
end biblioteca;
