/*
Ethan Zeronik
CNIT372 Lab Section #4
Estimated Time Spent: 1hr
Late hours used: 0
*/

-- defaults to on
SET verify off;
/**/

-- NOTE: Question #a1
CREATE TABLE customer_new AS
    SELECT *
    FROM cnit372ta.customer_new;
ALTER TABLE customer_new ADD PRIMARY KEY (customerid);
/* Question #a1 Query Results
TABLE created.

TABLE altered.
*/

-- NOTE: Question #a2
CREATE VIEW customer_new_view AS
    SELECT custname, companyname, address, city, state, postalcode, phone, emailaddr
    FROM customer_new;
/* Question #a2 Query Results
VIEW created.
*/

-- NOTE: Question #a3
INSERT INTO customer_new_view (
    custname, address, city, state, postalcode
) VALUES (
    'John Doe', '401 N. Grant St.', 'West Lafayette', 'IN', '47907'
)
 /* Question #a3 Query Results
I cannot add them because they are missing a primary key

INSERT INTO customer_new_view (
*
ERROR at line 32:
ORA-01400: cannot insert NULL into ("EZERONIK"."CUSTOMER_NEW"."CUSTOMERID")
*/
 -- NOTE: Question #a4
CREATE VIEW customer_all AS
    SELECT c.customerid, c.custfirstname || ' ' || c.custlastname AS custname, c.companyname, c.address, c.city, c.state, c.postalcode, c.phone, c.emailaddr
    FROM customer c UNION ALL
        SELECT cu.customerid, cu.custname, cu.companyname, cu.address, cu.city, cu.state, cu.postalcode, cu.phone, cu.emailaddr
        FROM customer_new cu;
/* Question #a4 Query Results
VIEW created.
*/

-- NOTE: Question #a5
INSERT INTO customer_all (
    customerid, custname, address, city, state, postalcode
) VALUES (
    'C-001', 'John Doe', '401 N. Grant St.', 'West Lafayette', 'IN', '47907'
);
/* Question #a5 Query Results
I cannot insert because insertion is illegal on a view

INSERT INTO customer_all (
            *
ERROR at line 57:
ORA-01732: data manipulation operation not legal on this view
*/

-- NOTE: Question #a6
CREATE VIEW indiana_customer AS
    SELECT *
    FROM customer_new
    WHERE state = 'IN';
/* Question #a6 Query Results
VIEW created.
*/

-- NOTE: Question #a7
INSERT INTO indiana_customer (
    customerid, custname, address, city, state, postalcode
) VALUES (
    'C-001', 'John Doe', '401 N. Grant St.', 'West Lafayette', 'IN', '47907'
);
COMMIT;
/* Question #a7 Query Results
1 row created.

Commit complete.
*/

-- NOTE: Question #a8
DELETE FROM indiana_customer
WHERE
    customerid = 'C-001';
SELECT *
FROM indiana_customer
WHERE customerid = 'C-001';
SELECT *
FROM customer_new
WHERE customerid = 'C-001';
COMMIT;
/* Question #a8 Query Results
Neither view has a customer

1 row deleted.

no rows selected

no rows selected

Commit complete.
*/

-- NOTE: Question #a9
DELETE FROM indiana_customer;
SELECT *
FROM indiana_customer;
ROLLBACK;
SELECT *
FROM indiana_customer;
/* Question #a9 Query Results
While not commited the view still shows the change from the delete

no rows selected

Rollback complete.

CUSTOMERID	CUSTNAME	COMPANYNAME	CUSTTITLE	ADDRESS	CITY	STATE	POSTALCODE	FAX	PHONE	EMAILADDR
C-301	John Day	Purdue University	Mr.	401 N. Grant St.	West Lafayette	IN	47907		765-494-2560	johnday@purdue.edu
C-302	Shannon Jing	Purdue University	Ms.	500 Oval Dr.	Wset Lafayette	IN	47907		765-588-7610	jing@purdue.edu
C-303	Julia Rayz	Purdue University	Dr.	401 N. Grant St.	West Lafayette	IN	47907		765-494-9525	jtaylor1@purdue.edu
I-301	Shannon Jing		Ms.	500 Oval Dr.	West Lafayette	IN	47907		765-588-7610	tarokingu@gmail.com
I-304	Kate Sun		Ms.	405 Sagamore Pkwy S.	Lafayette	IN	47904			katesun@gmail.com
*/

-- NOTE: Question #a10
TRUNCATE TABLE customer_new;
SELECT *
FROM customer_new;
ROLLBACK;
SELECT *
FROM customer_new;
/* Question #a10 Query Results
The rollback appears not to have worked where as in question 9 it worked

TABLE truncated.

no rows selected

Rollback complete.

no rows selected
*/

-- NOTE: Question #a11
GRANT READ ON customer_all TO cnit372ta;
/* Question #a11 Query Results
Grant succeeded.
*/

-- NOTE: Question #a12
REVOKE READ ON customer_all FROM cnit372ta;
/* Question #a12 Query Results
Revoke succeeded.
*/

-- NOTE: Question #a13
GRANT SELECT, INSERT, DELETE ON customer_all TO cnit372ta;
/* Question #a13 Query Results
Grant succeeded.
*/

-- NOTE: Question #a14
REVOKE SELECT, INSERT, DELETE ON customer_all FROM cnit372ta;
/* Question #a14 Query Results
Revoke succeeded.
*/

-- NOTE: Question #a15
REVOKE SELECT ON customer_all FROM ezeronik;
/* Question #a15 Query Results
REVOKE SELECT ON customer_all FROM ezeronik
                                   *
ERROR at line 183:
ORA-01749: you may not GRANT/REVOKE privileges to/from yourself
*/

-- NOTE: Question #a16
DROP TABLE customer_new;
DROP VIEW customer_new_view;
DROP VIEW customer_all;
DROP VIEW indiana_customer;
/* Question #a16 Query Results
TABLE dropped.

VIEW dropped.

VIEW dropped.

VIEW dropped.
*/

-- NOTE: Question #a17
GRANT EXECUTE ON hello_world TO cnit372ta;
/* Question #a17 Query Results
https://docs.oracle.com/database/121/TTPLS/accesscntl.htm#TTPLS267

Grant succeeded.
*/

-- NOTE: Question #a18
GRANT EXECUTE ON number_of_employees TO cnit372ta;
/* Question #a18 Query Results
Grant succeeded.
*/

-- NOTE: Question #a19
REVOKE EXECUTE ON number_of_employees FROM cnit372ta;
/* Question #a19 Query Results
Revoke succeeded.
*/

-- NOTE: Question #a20
DROP PROCEDURE hello_world;
CREATE OR REPLACE PROCEDURE hello_world (
    p_greeting IN VARCHAR2, p_name IN VARCHAR2
) AS
    v_output VARCHAR2 (75);
BEGIN
    v_output := p_greeting || ' ' || p_name;
    dbms_output.put_line (v_output);
END hello_world;
/
SELECT *
FROM user_tab_privs;
/* Question #a20 Query Results
No the TA no longer has permissions to execute

PROCEDURE dropped.

PROCEDURE created.

GRANTEE	OWNER	TABLE_NAME	GRANTOR	PRIVILEGE	GRANTABLE	HIERARCHY	COMMON	TYPE	INHERITED
PUBLIC	SYS	EZERONIK	EZERONIK	INHERIT PRIVILEGES	NO	NO	NO	USER	NO
*/

-- NOTE: Question #a21
GRANT EXECUTE ON number_of_employees TO cnit372ta;
/* Question #a21 Query Results
Grant succeeded.
*/

-- NOTE: Question #a22
CREATE OR REPLACE FUNCTION number_of_employees (
    p_jobtitle IN employee.jobtitle%type
) RETURN NUMBER AS
    v_number_of_employees NUMBER := 0;
BEGIN
    SELECT COUNT ( * ) INTO v_number_of_employees
    FROM employee
    WHERE lower (jobtitle) = trim (lower (p_jobtitle) );
    RETURN v_number_of_employees;
END number_of_employees;
/
SELECT *
FROM user_tab_privs;
/* Question #a22 Query Results
Yes the TA does retain permissions to execute

FUNCTION created.

GRANTEE	OWNER	TABLE_NAME	GRANTOR	PRIVILEGE	GRANTABLE	HIERARCHY	COMMON	TYPE	INHERITED
CNIT372TA	EZERONIK	NUMBER_OF_EMPLOYEES	EZERONIK	EXECUTE	NO	NO	NO	FUNCTION	NO
PUBLIC	SYS	EZERONIK	EZERONIK	INHERIT PRIVILEGES	NO	NO	NO	USER	NO
*/

-- NOTE: Question #a23
/*
It seems that if you replace a procedure it maintains its permissions but if removed then remade it loses permissions
*/