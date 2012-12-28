Q13 PL/SQL Block for create a function.
SQL> select * from emp_master;
	EMP_ID	E_NAME		DEPT
-------------- ----------- ------------------
	11	manish		computer
	12	hemant		science
	13	ramesh		management	
	14	ashok		computer
	
//Function
create or replace function func(emp_id2 in number)
return number is
name varchar2(10);
e_id number(2);
begin
e_id:=emp)id2;
select e_name into name from emp_master where emp_id=e_id;
return i;
EXCEPTION
	WHEN NO_DATA_FOUND then
return 0;
end;/
-----------------

SQL>@ass13.sql
function created
-------------------
declare 
	e_id number(2);
	name varchar2(10);
	dept1 varchar2(10);
	d number(2);
begin
	e_id:=&id;
	d:=func(e_id);
	if(d=1)then
	select e_name into name from emp_master where emp_id=e_id;
	select dept into dept1 from emp_master where emp_id=e_id;
	dbms_output.put_line(name||''||dept1);
	else
	 dbms_output.put_line('no data found');
	end if;
end;
/
