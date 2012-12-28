//Assignment-14
SQL>describe audt1;
NAME		NULL?		Type
------------ ------------- ------------------
CNO				NUMBER(3)
CNAME				VARCHAR2(10)
BALDUE				NUMBER(6)
USERID				NUMBER(3)
CDATE				DATE
------------------------------------------------
SQL> select * from audt1;
	CNO	CNAME		BALDUE		USERID		CDATE
 ------------ ---------- ------------------ ------------- -------------
	101	bhanu		5000		123		12-JAN-12
	102	bharti		8000		124		15-FEB-12
	103	chitra		6000		125		24-MAR-12
SQL>describe audt11;
NAME		NULL?		Type
------------ ------------- ------------------
CNO				NUMBER(3)
CNAME				VARCHAR2(10)
BALDUE				NUMBER(6)
USERID				NUMBER(3)
OPR				VARCHAR2(7)
CDATE				DATE

SQL>select * from audt11;
no row selected.

-------------------------------------------------
CREATE OR REPLACE TRIGGER TN1
AFTER UPDATE OR DELETE ON AUDT1
FOR EACH ROW
DECLARE
OP VARCHAR2(8);
BEGIN
IF updating THEN
OP:='UPDATE';
END IF;
IF deleting THEN
OP:='DELETE'
END IF;
INSERT INTO audt11 VALUES(:OLD.cno,:OLD.cname,:OLD.baldue, :OLD.userid, SYSDATE);
END;
/
----------------OUTPUT-------------------------------------------------
SQL>delete from audt11;
	CNO	CNAME		BALDUE		USERID		OPR	CDATE
 ------------ ---------- ------------------ ------------- --------- -------------
	103 	chitra		6000		125		DELETE	07-OCT-12
SQL>update audt1 set balance=70000 where cno=103;
1 row updated.
SQL> select * from audt11;
	CNO	CNAME		BALDUE		USERID		OPR	CDATE
 ------------ ---------- ------------------ ------------- --------- -------------
	103 	chitra		70000		125		UPDATE	07-OCT-12