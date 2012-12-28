/*Q4 write a PL/SQL block, count number of books giving titleid from the book details table and 
insert corresponding title id recording in the summary.
tables
Tables used:-
  1. Mbook(title_id, name);
  2. Mbook_detail(title_id, book_id, status);
  3  Mbook_sumry(title_id, No_of_books, System_Date);
*/
------------------------------------------------------------------------------------
Tables:
SQL>  desc Mbook;
 NAME						NULL?   TYPE
 ------------------------------------------ ----------- ----------------
 TILE_ID						VARCHAR2(15)
 NAME							VARCHAR2(20)
**************************************************************************************
SQL>  desc Mbook_detail;
 NAME						NULL?   TYPE
 ------------------------------------------ ----------- ----------------
 TILE_ID						VARCHAR2(15)
 BOOK_ID						VARCHAR2(10)
 STATS							VARCHAR2(2)
**************************************************************************************
SQL>  desc Mbook_detail;
 NAME						NULL?   TYPE
 ------------------------------------------ ----------- ----------------
 TILE_ID						VARCHAR2(15)
 NO_OF_BOOKS						NUMBER(4)
 SYS_DATE						DATE

**************************************************************************************

Value in Tables:-

SQL>select * from mbook_detail;
TITLE_ID			BOOK_ID		ST
----------------------	---------------------	------------------
100			mca100			av
100			mca101			na	
100			mca102			av	
101			mca103			av
101			mca104			na
101			mca105			av
102			mca106			av
102			mca107			av
103			mca108			na
104			mca109			av
104			mca110			av

------------------PL/SQL-------------------------
declare
tid varchar2(15);
count1 number(4);
begin
tid:=&tid;
select count(title_id) into count1 from Mbook_detail where title_id = id;
insert into Mbook_sumry values(tid,count1, sysdate);
end;
/

------------------------------------------------------------------------
SQL>@plsql;
Enter the value of tid = 102
old 	8: tid:=&tid;
old 	8: tid:=102;
PL/SQL procedure successfully completed
------------------------------------------------
SQL> select * from Mbook_sumry;

TITLE_ID			NO_OF_BOOKS		SYS_DATE
----------------------	---------------------	------------------
102				2			28-JUL-12