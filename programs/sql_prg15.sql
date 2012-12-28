//Assignment-17
SQL>create table u (id number(2), pass varchar2(10));
Table created.
SQL>create table mark1(sid number(2), m1 number(3), m2 number(3), m3 number(3), tot number(3));
Table created.
create or replace package sumit5 as 
   procedure p(id1 number);
   function p1(id1 number,pass1 varchar2) return number;
   end sumit5;
Package created.
create or replace package body sumit5 as
 procedure p(id number) is
 a number(2);
 b number(2);
 c varchar2(10);
 begin
 select pass into c from u where id = id1;
 if(SQL%FOUND) then
 b:=p1(id1,c);
 end if;
 if(b = 1)then
 dbms_output.put_line('You are authenticated user..');
 end if;
 exception
  when no_data_found then
 dbms_output_put_line('You are not authenticated user..');
 
 end p;
 function p1(id1 number, pass1 varchar2)return number is
 y varchar2(10);
 begin
 select pass into y from u where pass=pass1 and id=id1;
 return 1;
 exception
 when no_data_found then
 return 0;
 end p1;
 end sumit5;
 /
Package body created.
SQL> select * from u;
	ID	PASS
  ------------ -----------
 	1	sumit
	2	satish
SQL>select * from mark1;
	SID	M1	M2	M3	TOT
------------ -------- --------- ------- ---------
	1	100	100	100	100
SQL> execute sumit5.p(6);
you are not authenciated user.
PL/SQL procedure successfully completed.
SQL>execute sumit5.p(1);
you are authenticated user.
PL/SQL procedure successfully completed.