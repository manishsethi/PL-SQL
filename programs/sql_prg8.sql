Q10. Student Result.

SQL> desc marks;
Name							NULL?	Type
--------------------------------------------------- --------- ---------
RNO								NUMBER
M1								NUMBER
M2								NUMBER
M3								NUMBER
M4								NUMBER
M5								NUMBER
TOTAL								NUMBER
PER								NUMBER
STATUS								VARCHAR2(7)
DIVISION							VARCHAR2(5)
---------------------------------------------------------------------------
SQL>select * from marks;

RNO	M1	M2	M3	M4	M5	TOTAL	PER	STATUS	DIVIS
------ ------ ------ -------- ------- ------- -------- ------- -------- -------
36474	45	32	33	65	80	255	51	atkt	II
47844	22	45	33	42	36	178	35.6	atkt	fail	
78445	36	45	52	55	45	233	46.6	pass	II
248136	78	68	89	95	92	422	84.4	pass	Hon
45145	78	65	87	65	78	373	74.6	pass	I
47554	23	45	22	33	23	146	29.2	fail	fail
45457	45	66	70	62	68	311	62.2	pass	I
7 rows selected
----------------------------------------------------------------------
declare
perc number;
tot number;
cou number;
stat varchar2(7);
div varchar2(5);
minim number(10);
cursur mark is select * from marks;
begin
	for mv in mark
	loop
		tot:=mv.m1+mv.m2+mv.m3+mv.m46mv.m5;
		perc:=tot/5;
		/*checkin conditions for status */
		cou:=0;
		if mv.m1<36 then
 			cou:=cou+1;
		end if;
		if mv.m2<36 then
 			cou:=cou+1;
		end if;
		if mv.m3<36 then
 			cou:=cou+1;
		end if;
		if mv.m4<36 then
 			cou:=cou+1;
		end if;
		if mv.m5<36 then
 			cou:=cou+1;
		end if;
	//Set status
	if mv.m1 >= 36 AND mv.m2 >= 36 AND mv.m3 >= 36 AND mv.m4 >= 36 AND mv.m5 >= 36 then
		stat:='pass';
	elseif cou=1 then
		select LEAST(m1,m2,m3,m4,m5)into minim from marks;
			if minim >31 then
				stat:='grace';
			else
				stat:='atkt';
			end if;
	elseif cou = 2 then
		stat:='atkt';
	elseif cou >2 then
		stat:='fail';
	end if;
      //set Division
	if perc>=75then
		div:='Hon';
 	
	elseif perc>=60then
		div:='I';
	
	elseif perc>=50then
		div:='II';
	
	elseif perc>=36then
		div:='III';
	else
	div:='fail';
	endif;
update marks set total=tot where rno=mv.rno;
update marks set per=perc where rno=mv.rno;
update marks set status=stat where rno=mv.rno;-
update marks set division=div where rno=mv.rno;
end loop;
end;
/