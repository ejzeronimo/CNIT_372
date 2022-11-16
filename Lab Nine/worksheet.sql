/*
Ethan Zeronik
CNIT372 Lab Section #4
Estimated Time Spent: ?hr
Late hours used: 0
*/

-- defaults to on
SET verify off;
/**/

-- NOTE: Question #1a
CREATE TABLE lab9_employee AS
    SELECT *
    FROM employee;
/* Question #1a Query Results
TABLE created.
*/

-- NOTE: Question #1b
CREATE OR REPLACE TRIGGER tbds_lab9_employee BEFORE
    DELETE ON lab9_employee
BEGIN
    dbms_output.put_line ('Trigger fired before deleteing anything from lab9_employee');
END;
/
/* Question #1b Query Results
The trigger is defined on the lab9_employee table and it triggers before a delete occurs on the table

TRIGGER created.
*/

-- NOTE: Question #1c
CREATE OR REPLACE TRIGGER tbdr_lab9_employee BEFORE
    DELETE ON lab9_employee FOR EACH ROW
BEGIN
    dbms_output.put_line ('Trigger fired before deleteing a row from lab9_employee');
END;
/
/* Question #1c Query Results
The trigger is defined on the table but it is fired before each row delete rather than before a delete statement

TRIGGER created.
*/

-- NOTE: Question #1d
CREATE OR REPLACE TRIGGER tads_lab9_employee AFTER
    DELETE ON lab9_employee
BEGIN
    dbms_output.put_line ('Trigger fired after deleteing anything from lab9_employee');
END;
/
/* Question #1d Query Results
The trigger is defined on the lab9_employee table and it triggers after a delete occurs on the table

TRIGGER created.
*/

-- NOTE: Question #1e
CREATE OR REPLACE TRIGGER tadr_lab9_employee AFTER
    DELETE ON lab9_employee FOR EACH ROW
BEGIN
    dbms_output.put_line ('Trigger fired after deleteing a row from lab9_employee');
END;
/
/* Question #1c Query Results
The trigger is defined on the table but it is fired after each row delete rather than after a delete statement

TRIGGER created.
*/

-- NOTE: Question #1f
DELETE FROM lab9_employee
WHERE
    employeeid = '101135';
/* Question #1f Query Results
All of the triggers fired once, the sequence can be seen below

Trigger fired before deleteing anything from lab9_employee
Trigger fired before deleteing a row from lab9_employee
Trigger fired after deleteing a row from lab9_employee
Trigger fired after deleteing anything from lab9_employee

1 row deleted.
*/

-- NOTE: Question #1g
ROLLBACK;
/* Question #1g Query Results
The data is restored which implies that triggers implicitly commit

Rollback complete.
*/

-- NOTE: Question #1h
DELETE FROM lab9_employee
WHERE
    jobtitle = 'Sales';
/* Question #1h Query Results
All four triggers fired, the anything triggers fired once while the per rows fired 3 times each

Trigger fired before deleteing anything from lab9_employee
Trigger fired before deleteing a row from lab9_employee
Trigger fired after deleteing a row from lab9_employee
Trigger fired before deleteing a row from lab9_employee
Trigger fired after deleteing a row from lab9_employee
Trigger fired before deleteing a row from lab9_employee
Trigger fired after deleteing a row from lab9_employee
Trigger fired after deleteing anything from lab9_employee

3 rows deleted.
*/

-- NOTE: Question #1i
ROLLBACK;
/* Question #1i Query Results
Yes the data is rolled back and it is what I expected

Rollback complete.
*/

-- NOTE: Question #1j
TRUNCATE TABLE lab9_employee;
/* Question #1j Query Results
None of the triggers fired

Table LAB9_EMPLOYEE truncated.
*/

-- NOTE: Question #2a
CREATE OR REPLACE TRIGGER tbis_lab9_employee BEFORE
    INSERT ON lab9_employee
BEGIN
    dbms_output.put_line ('Trigger fired before insert anything from lab9_employee');
END;
/
CREATE OR REPLACE TRIGGER tais_lab9_employee AFTER
    INSERT ON lab9_employee
BEGIN
    dbms_output.put_line ('Trigger fired after insert anything from lab9_employee');
END;
/
CREATE OR REPLACE TRIGGER tbir_lab9_employee BEFORE
    INSERT ON lab9_employee FOR EACH ROW
BEGIN
    dbms_output.put_line ('Trigger fired before inserting a row from lab9_employee');
END;
/
CREATE OR REPLACE TRIGGER tair_lab9_employee AFTER
    INSERT ON lab9_employee FOR EACH ROW
BEGIN
    dbms_output.put_line ('Trigger fired after inserting a row from lab9_employee');
END;
/
/* Question #2a Query Results
TRIGGER created.

TRIGGER created.

TRIGGER created.

TRIGGER created.
*/

-- NOTE: Question #2b
/*
I expect that all of the triggers will fire in the order shown below

before any insert
before row insert
after row insert
after any insert
*/

-- NOTE: Question #2c
INSERT INTO lab9_employee (
    employeeid
) VALUES (
    'E-1337'
);
/* Question #2c Query Results
This test proved my hypothesis

Trigger fired before insert anything from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after insert anything from lab9_employee

1 row inserted.
*/

-- NOTE: Question #2d
/*
I expect that all of the triggers will fire in the order shown below

before any insert
    \/ This block will fire 40 times in this order
before row insert
after row insert
    /\ End block
after any insert
*/

-- NOTE: Question #2e
INSERT INTO lab9_employee
    SELECT *
    FROM employee FETCH FIRST 40 ROWS ONLY;
/* Question #2e Query Results
While I was right about the amount that fired I was incorrect about the order

Trigger fired before insert anything from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired before inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after inserting a row from lab9_employee
Trigger fired after insert anything from lab9_employee

40 rows inserted.
*/

-- NOTE: Question #3a
CREATE OR REPLACE TRIGGER restrict_update BEFORE
    UPDATE OF emailaddr ON lab9_employee FOR EACH ROW WHEN (new.emailaddr NOT LIKE '%.com')
BEGIN
    raise_application_error ( - 20000, 'syntax of email not adhered to');
END;
/
/* Question #3a Query Results
TRIGGER created.
*/

-- NOTE: Question #3b
UPDATE lab9_employee
SET
    emailaddr = 'foo@bar.baz'
WHERE
    employeeid = '100001';
UPDATE lab9_employee
SET
    emailaddr = 'foo@bar.com'
WHERE
    employeeid = '100001';
/* Question #3b Query Results
UPDATE lab9_employee
       *
ERROR at line 308:
ORA-20000: syntax of email not adhered to
ORA-06512: at "EZERONIK.RESTRICT_UPDATE", line 2
ORA-04088: error during execution of trigger 'EZERONIK.RESTRICT_UPDATE'

1 row updated.
*/

-- NOTE: Question #3c
CREATE OR REPLACE TRIGGER restrict_update BEFORE
    UPDATE OF emailaddr ON lab9_employee FOR EACH ROW
BEGIN
    IF (:new.emailaddr NOT LIKE '%.com') THEN
        raise_application_error ( - 20000, 'syntax of email not adhered to');
    END IF;
END;
/
/* Question #3c Query Results
TRIGGER created.
*/

-- NOTE: Question #3d
UPDATE lab9_employee
SET
    emailaddr = 'foo@bar.baz'
WHERE
    employeeid = '100001';
UPDATE lab9_employee
SET
    emailaddr = 'foo@bar.com'
WHERE
    employeeid = '100001';
/* Question #3d Query Results
UPDATE lab9_employee
       *
ERROR at line 346:
ORA-20000: syntax of email not adhered to
ORA-06512: at "EZERONIK.RESTRICT_UPDATE", line 3
ORA-04088: error during execution of trigger 'EZERONIK.RESTRICT_UPDATE'

1 row updated.
*/

-- NOTE: Question #4
DROP TABLE lab9_employee CASCADE CONSTRAINTS;
/* Question #4 Query Results
TABLE dropped.
*/