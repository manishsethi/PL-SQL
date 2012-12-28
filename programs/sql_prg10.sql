//Assignment-12
SQL> create table emp
 2 (id number(2), name varchar2(10), salary number(6));
Table created.
SQL> insert into emp
 2 values(1,'Ram',6000);
1 row created.
SQL> insert into emp
 2 values(2,'sam',5000);
1 row created.
SQL> insert into emp
 2 values(3,'rishi',7000);
1 row created.
SQL>commit;
Commit complete.
SQL>select * from emp;
SQL> select * from person;
	ID	NAME		SALARY
----------- --------------- ---------------
	1	Ram		  6000
	2	sam		  5000
	3	rishi		  7000
SQL> create or replace procedure Ram(id1 in emp.id%type,name1 in emp.name%type,salary in emp.salary%type)as
 2 a number(2);
 3 begin
 4 select id into a from emp where id=id1;
 5 if(SQL%FOUND)then
 6 dbms_output.put_line('the record are exists');
 7 end if
 8 ;
 9 exception
10 when no_data_found then
11 insert into emp
12 values(id1,'name1',salary);
13 end Ram;
14 /
Procedure created.
SQL> set serveroutput on
SQL>declare
 2 begin
 3 sumit(&id,'&name',&salary);
 4 end;
 5 /
Enter value for id: 4
Enter value for name:satish
Enter value for salary: 4000
old 3: sumit(&id,'&name',&salary);
new 3: sumit(4,'satish',4000);
