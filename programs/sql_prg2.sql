// Write a program in PL/SQL for printing factorial into a table.
declare 
fact number(5);
num1 number(2);
i number(3);
j number(3);
total number(5);
begin
total:=&total;
for j in 1..total
loop
fact:=1;
	for i in 1..j
	loop
		fact:=fact*i;
		insert into fact1 values(num1, fact);
	end loop;
end loop;
end;
/

output:-
SQL>@ass2;
Enter value for total : 5
old  9: total:=&total;
new  9: total:=5;
PL/SQL procedure successfully completed.
SQL> select * from fact1
2;

	NUM	FACT
 -------------- --------------------

	2	2
	3	6
	4	24
	5	120
4 Rows selected 
