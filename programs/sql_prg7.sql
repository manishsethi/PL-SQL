* Q7.Write a PL/SQL code to Activate all In-Active accounts of Shastri Nagar branch.
Table used: 1. account(acc_no, balance, branch_code, status);
	2.branch(branch_code, branch_name);

--------------Tables-----------------

SQL> select * from account;

	ACC_NO		BALANCE		BR_CODE		STATUS
  ----------------  --------------  ---------------  -----------------
	1001		10000		10		Active
	1002		20000		11		In-Active
	1003		25000		11		Active
	1004		35000		10		In-Active
	1005		23000		12		In-Active
	1006		29000		13		Active
	1007		45000		14		In-Active
	1008		50000		13		Active

8 rows selected.

SQL> select * from branch;

	BR_CODE		BR_NAME
   ---------------  --------------
	10		Shastri Nagar
	11		Paota	
	12		Sardarpura
	13		Chopasni
	14		Mandore


--------- PL/SQL----------
declare 
    c_rows number(4);
begin
    update account set status = "Active" where status = "In-Active" and br_code in(select br_code from branch where br_name = "Shastri Nagar");
    c_rows:=SQL%ROWCOUNT;
    if SQL%ROWCOUNT >0 then
         dbms_output.put_line(c_rows||'account(s) activated successfully');
    else
         dbms_output.put_line(c_rows||'No In-Activated accounts found'); 
    endif
 end;
/


---------------OUTPUT-------------------
SQL>  @account.sql;
1 account(s) activated successfully.

PL/SQL procedure successfully completed.

SQL> select * from account;

	ACC_NO		BALANCE		BR_CODE		STATUS
  ----------------  --------------  ---------------  -----------------
	1001		10000		10		Active
	1002		20000		11		In-Active
	1003		25000		11		Active
	1004		35000		10		Active
	1005		23000		12		In-Active
	1006		29000		13		Active
	1007		45000		14		In-Active
	1008		50000		13		Active

8 rows selected.
	 