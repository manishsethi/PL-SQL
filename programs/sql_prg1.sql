
/*

 Program in PL/SQL code that first deposit an amount of Rs 5000 or some amount in a given account number than withdraws some amount
 from the same account. check if the current balance is less than minimum balance, then undo the withdrawal just made. 
 author:-manish sethi
*/
 

set serveroutput on;

DECLARE
acc_n1 number(5);
bal1 number(5);
depo number(5);
sum number(5);
sub number(5);
withd number(5);
bal2 number(5);
min_bal constant number := 5000;
begin
acc_no1:=&acc_no1;
depo:=&depo;
update acc set bal = bal + depo where acc_no = acc_no1;
withd:=&withd;
savepoint s1;
update acc set bal = bal - withd where acc_no = acc_no1;
select bal into bal1 from acc where acc_no = acc_no1;
if(bal<min_bal)then
 rollback to savepoint s1;
 dbms_output.put_line('Transaction Cancelled');
end if;
commit;
end;
/


/*
SQL> select * from acc;
	ACC_NO		BAL
  ---------------- -----------------
	101		20000
	102		16800
	103		18000
	104		18000
	105		18000
	106		18000
6 rows selected.
SQL>@ass3;
Enter value for acc_no1:101
old 11:  acc_no1:=&acc_no1;
new 11:	 acc_no1:=101;
Enter value for depo:2000
old 11:  depo:=&depo;
new 11:	 depo:=2000;
Enter value for withd:20000
old 11:  withd:=&withd;
new 11:	 withd:=20000;
Transaction Cancelled

SQL>@ass3;
Enter value for acc_no1:102
old 11:  acc_no1:=&acc_no1;
new 11:	 acc_no1:=102;
Enter value for depo:200
old 11:  depo:=&depo;
new 11:	 depo:=200;
Enter value for withd:7000
old 11:  withd:=&withd;
new 11:	 withd:=7000;
PL/SQL procedure successfully completed.

SQL> select * from acc;
	ACC_NO		BAL
  ---------------- -----------------
	101		20000
	102		10000
	103		18000
	104		18000
	105		18000
	106		18000
6 rows selected.
*/