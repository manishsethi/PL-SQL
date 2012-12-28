//Assignment-16
SQL>create or replace procedure manish
 2 as;
 3 begin
 4 dbms_output_put_Line('another procedure call');
 5 end manish;
 6 /
Procedure created.
---------------------------------------
SQL>create table emp2 (id number(2), name varchar2(10), desg varchar2(10));
Table created.
SQL>insert into emp2 values(1,'manish','ceo');
1 row created.
SQL>insert into emp2 values(2,'satish','admin');
1 row created.
SQL>insert into emp2 values(3,'sourabh','manager');
1 row created.
SQL>commit;
Commit created.
SQL>select * from emp2;
	ID	NAME		DESG
  ---------- --------------- -----------------
	1	manish		ceo
	2	satish		admin
	3	sourabh		manager
SQL>create or replace procedure manish1
 2 (desg1 in emp2.desg%type)as
 3 chk varchar2(10);
 4 begin
 5 select desg into chk from emp2 where desg=desg1;
 6 if(SQL%FOUND)then
 7 manish;
 8 end if;
 9 exception
 10 when no_data_found then
 11 dbms_output_put_line('You are not administrator');
 12 end manish1;
 13/
 Procedure created.
----------------------------------------------------------------
SQL>declare
 2 begin
 3 manish1('clark');
 4 end;
 5 /
You are not administrator.
PL/SQL procedure successfully completed.
SQL>declare
 2 begin
 3 manish1('admin');
 4 end;
 5 /
another procedure call
PL/SQL procedure successfully completed.