Q5. Write a PL/SQL block that determine top 5 highest paid employee from emp table.
Use appropriate cursor attribute print top 5 employee to the screen.
Table used:- Employee(emp_no, ename, job,mgr,hiredate,sal,comm,deptno,)
Table

EMP_NO	   ENAME	JOB		MGR		HIREDATE	SAL	
   COMM		DEPTNO
--------- ---------- -------------- ---------  ------------------- -----------------
 --------- ----------------
7829	King	president			17-NOV-81		5000
   		10
7698	blake	manager			7839	01-MAY-81		2850
   		30
7782	clark	manager			7839	09-JUNE-81		2450
   		10
7566	Jones	manager			7839	02-APR-81		2975
   		20
7654	martin	Salesman		7698	28-SEP-81		1250
     1400	30
7499	alien	Salesman		7698	20-FEB-81		1600
     300	30
7844	turner	Salesman		7698	08-SEP-81		1500
     		30
7900	James	clerk			7698	03-DEC-81		950
     		30
7521	ward	Salesman		7698	22-FEB-81		1250
     600	30
7902		forg	analyst		7566	03-DEC-81		3000
7396		smith	clerk		7566	17-DEC-81		8000


PL/SQL Block:-
declare:-
cursor n_sal is 
   select ename,sal from employee
	order by sal desc;
name varchar2(10);
salary number(6);
begin
open n_sal;
dbms_output.put_Line('Employee  Name      Salary ');
dbms_output.put_Line('------------------   ------------------');
loop
fetch n_sal into name, salary;
exit when(n_sal%rowcount - 1) =5;
dbms_output.put_Line(name||'				' ||salary);
end loop;
end;

/


Output:-
SQL> @ass5;
Employee 	NAME		SALARY
-------------------------	---------------------
king				5000
scott				3000
ford				3000
jones				2975
