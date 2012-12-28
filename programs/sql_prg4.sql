
/*
 Program in PL/SQL code that first deposit an amount of Rs 5000 or some amount in a given account number than withdraws some amount
 from the same account. check if the current balance is less than minimum balance. 
 Author:-Manish Sethi
*/


set serveroutput on;

-- variable Declaration.
DECLARE

t_accno  number(5);
t_balance number(6);
t_amount number(6);
mini_constant number:= 10000;

-- Procedure.
BEGIN
t_accno:= &t_accno;
t_amount:=&t_amount;
select balance into t_balance from bank where acc_no =t_accno;
  update bank set balance = balance + 5000 where acc_no =t_accno;
 if(mini_constant<(t_balance-t_amount))then
   update bank set balance = balance-t_amount where acc_no =t_accno;
 else
   DBMS_OUTPUT.PUT_LINE('The amount cannot be withdrawal!!');
 end if;

END;
/

/*

Database Used:-

SQL> desc bank;
 Name                                      Null?    Type
 ----------------------------------------- -------- -----------------

 ACC_NO                                             NUMBER(5)
 CUST_NAME                                          VARCHAR2(15)
 BALANCE                                            NUMBER(6)

SQL> select * from bank;

    ACC_NO CUST_NAME          BALANCE
---------- --------------- ----------
       101 Manish Sethi         12000
       102 Mahipal Kansara     117000
       103 Rahul Bhatia         17000
       104 Ramesh Kumar         32000
       105 Ashok Singh          72000

Result:-
SQL> @C:\Users\Mohitsethi\Desktop\bank_trans.sql;
Enter value for t_accno: 101
old  10: t_accno:= &t_accno;
new  10: t_accno:= 101;
Enter value for t_amount: 5000
old  11: t_amount:=&t_amount;
new  11: t_amount:=5000;
The amount cannot be withdrawal!!

PL/SQL procedure successfully completed.
