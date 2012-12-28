//Assignment-15
SQL>create table mark
 2 (id number(2), m1 number(3), m2 number(3), m3 number(3));
Table created.
SQL>create table result
 2 (id number(2), total number(5),per number(5), grade varchar2(5));
Table created.
--------------------------------------------------------------
SQL>CREATE OR REPLACE TRIGGER manish
 2 BEFORE INSERT OR UPDATE ON MARK
 3 FOR EACH ROW
 4 DECLARE
 5 total number(5);
 6 grade varchar2(1);
 7 per number(2);
 8 id number(2);
 9 BEGIN
 10 total:=:new.m1 + :new.m2 + :new.m3;
 11 per:= (total/3);
 12 if(per>=80)then
 13 grade='A';
 14 end if;
 15 if(per>=60 and.per<80)then
 16 grade='B';
 17 end if;
 18 if(per>=36 and.per<60)then
 19 grade='C';
 20 end if;
 21 if(per<36)then
 22 grade='F';
 23 end if;
 24 insert into result VALUES(:new.id,total,per,grade);
 25 end manish;
 26 /
Trigger Created
--------------------------------------------------------------
SQL>select * from mark;
no rows selected
SQL>select * from result;
no rows selected
SQL> insert into mark
 2 Values(9,100,100,100);
1 row created.
SQL>select * from mark;
	ID	M1	M2	M3
 ---------- --------- -------- ----------- 
	9	100	100	100
1 rows selected.
SQL> select * from result;
	ID	TOTAL	PER	GRADE
 ----------- --------- ------- -----------
	9	300	100	A
