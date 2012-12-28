//Assignment-11
user defined exception
SQL> select * from person;
	ID	NAME		SALARY
----------- --------------- ---------------
	1	a		100000
	2	b		  1000
	3	c		  4000
declare
a number(2);
bal number(5);
mi number(5);
amt number(5);
excep exception;
begin
mi:=2000;
a:=&id;
bal:=&bals;
select balance into amt from person where id=a;
	if amt-bal <= mi then
		raise excep;
	else
		update person
		set balance=balance-bal
		where id=a;
		dbms_output.put_line('Transaction complete successfully');
	endif;
exception
	when excep then
		dbms_output.put_line('exception occur');
end;
/

************Output***********
SQL>select * from person;
	ID	NAME		SALARY
----------- -------------- -----------------
	1	a		980000
	2	b		  1000
	3	c		  4000