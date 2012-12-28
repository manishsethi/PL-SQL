* Q6.On completion of the project the manager decides to assign another project to all the employee working on this project. 
  write a PL/SQL block to accept project id of project just completed & project_id of new project to be assigned. Display appropriate message using SQL% found
  SQL%notFound, sql%rowcount like employee were transfered or not & how many employee were transfered.

-------------------------------------------------------------------------------------------------------------------------------------------------+

declare 
pr_id number(3);
count1 varchar2(9);
pe_id number(3);
begin
pr_id:='&pr_id';
pe_id:='&pe_id';
update project set status = 'processing', pr_id=pe_id where status = 'completed' AND pr_id =pe_id;
count1:= to_char(SQL%ROWCOUNT);  
dbms_output.put_line('affected rows = '||count1);
end;
/

--------------Before execution output-----------------

SQL> select * from project;
	PR_ID		EMP_ID		STATUS
   -----------------  ---------------  ----------------
	  1		100		processing
	  1		101		processing
	  1		102		processing
	 10		200		processing
	 10		201		processing 	
	 10		202		processing
	  3		300		completed
	  3		301		completed
	  3		302		completed
	  4		400		completed
	  4		401		completed
12 rows selected.

---------------After execution Output----------------------
SQL>@ass6;
Enter value for pr_id : 3
old  6: pr_id:=&'pr_id';
new  6: pr_id:='3';
Enter value for pe_id : 14
old  6: pe_id:=&'pe_id';
new  6: pe_id:='14';
affected rows = 3
PL/SQL Procedure successfully completed.
SQL>select * from project;

	PR_ID		EMP_ID		STATUS
   -----------------  ---------------  ----------------
	  1		100		processing
	  1		101		processing
	  1		102		processing
	 10		200		processing
	 10		201		processing 	
	 10		202		processing
	 14		300		processing
	 14		301		processing
	 14		302		processing
	  4		400		completed
	  4		401		completed
12 rows selected.