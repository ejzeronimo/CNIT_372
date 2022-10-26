/*
Ethan Zeronik
CNIT372 Lab Section #4
Estimated Time Spent: 0hrs
Late hours used: 0
*/

-- defaults to on
SET verify off;
/**/

-- NOTE: Question #1
CREATE TABLE person_of_interest (
    name VARCHAR2 (30) , company_name VARCHAR2 (30) , telephone VARCHAR2 (15) , email_address VARCHAR2 (50)
);
/* Question #1 Query Results
TABLE created.
*/

-- NOTE: Question #2
SELECT (custfirstname || ' ' || custlastname) , phone, emailaddr, nvl (companyname, 'None on record')
FROM customer;
/* Question #2 Query Results
(CUSTFIRSTNAME||''||CUSTLASTNAME)	PHONE	EMAILADDR	NVL(COMPANYNAME,'NONEONRECORD')
Lynne Lagunes	208-502-9976	hello@zeronet.net	None on record
...
*/

-- NOTE: Question #3
INSERT INTO person_of_interest (
    name, telephone, email_address, company_name
)
    SELECT (custfirstname || ' ' || custlastname) , phone, emailaddr, nvl (companyname, 'None on record')
    FROM customer;
/* Question #3 Query Results
231 rows created.
*/

-- NOTE: Question #4
UPDATE person_of_interest
SET
    email_address = 'None on record'
WHERE
    email_address IS NULL;
/* Question #4 Query Results
39 rows updated.
*/

-- TODO: Question #5

/* Question #5 Query Results

*/

-- TODO: Question #6

/* Question #6 Query Results

*/

-- TODO: Question #7

/* Question #7 Query Results

*/

-- TODO: Question #8

/* Question #8 Query Results

*/

-- TODO: Question #9

/* Question #9 Query Results

*/

-- TODO: Question #10

/* Question #10 Query Results

*/

-- TODO: Question #11

/* Question #11 Query Results

*/

-- TODO: Question #12

/* Question #12 Query Results

*/

-- NOTE: Question #13
CREATE TABLE employee_bottom_25 (
    employee_id VARCHAR (10) , employee_name VARCHAR (36) , job_title VARCHAR2 (35) , salary NUMBER (9, 2)
);
--
CREATE TABLE employee_top_10 (
    employee_id VARCHAR (10) , employee_name VARCHAR (36) , job_title VARCHAR2 (35) , salary NUMBER (9, 2)
);
--
CREATE TABLE employee_others (
    employee_id VARCHAR (10) , employee_name VARCHAR (36) , job_title VARCHAR2 (35) , salary NUMBER (9, 2)
);
/* Question #13 Query Results
TABLE created.

TABLE created.

TABLE created.
*/

-- NOTE: Question #14
INSERT ALL
    WHEN salarywage < (
        SELECT (.25 * AVG (salarywage) ) FROM employee
    ) THEN INTO employee_bottom_25
    WHEN salarywage >= (
        SELECT PERCENTILE_CONT (.1) WITHIN GROUP (ORDER BY salarywage DESC) FROM employee
    ) THEN INTO employee_top_10 ELSE INTO employee_others
        SELECT employeeid, (firstname || ' ' || lastname) , jobtitle, salarywage
        FROM employee;
--
SELECT *
FROM employee_bottom_25;
--
SELECT *
FROM employee_top_10;
--
SELECT *
FROM employee_others;
/* Question #14 Query Results
EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100101	Joanne Rosner	Assembly	16.3
100120	Michelle Nairn	Assembly	16.75
100204	David Keck	Assembly	17.8
100220	Todd Vigus	Accountant	15
100399	Ronald Day	Assembly	16.25
100475	Steve Hess	Assembly	17.6
100550	Allison Roland	Assembly	16.85
100600	Calie Zollman	Sales	17.35
100892	Joseph Platt	Assembly	17.95
100967	Nicholas Albregts	Assembly	15.5
100989	Kathryn Deagen	Assembly	16.95
101007	Jason Krasner	Sales	12.75
101030	Kristey Moore	Assembly	13.6
101045	Austin Ortman	Assembly	10.5
101066	Laura Rodgers	Sales	12.6
101088	Patricha Underwood	Assembly	18.45
101089	Melissa Alvarez	Assembly	13.25
101097	Jack Brose	Assembly	12.05
101115	Steve Cochran	Assembly	10.5
101135	David Deppe	Assembly	11.65
101154	Gregory Hettinger	Assembly	11.25
101166	Phil Reece	Assembly	10.5

EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100103	Rita Bush	VP Operations	85800
100206	Kathleen Xolo	VP Finance	80700
100365	Sherman Cheswick	President	99900
100650	Edna Lilley	VP Information	93900

EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100001	Jim Manaugh	Chief Financial Officer	75500
100104	Michael Abbott	Engineer	74400
100106	Paul Eckelman	Accountant	53600
100112	Steven Hickman	Programmer Analyst	57600
100125	Gabrielle Stevenson	Chief Information Officer	75300
100127	Jason Wendling	Operations Officer	65600
100200	Beth Zobitz	Engineer	55200
100209	Tina Yates	Engineer	52000
100330	Kristen Gustavel	Operations Officer	68800
100488	Jamie Osman	Programmer Analyst	46300
100559	Meghan Tyrie	Engineer	50100
100700	Charles Jones	DBA	65600
100880	Gary German	Chief Sales Officer	48900
100944	Ryan Stahley	Engineer	48600
*/

-- TODO: Question #15

/* Question #15 Query Results

*/

-- TODO: Question #16

/* Question #16 Query Results

*/

-- TODO: Question #17

/* Question #17 Query Results

*/

-- TODO: Question #18

/* Question #18 Query Results

*/

-- TODO: Question #19

/* Question #19 Query Results

*/

-- TODO: Question #20

/* Question #20 Query Results

*/

-- TODO: Question #21

/* Question #21 Query Results

*/

-- TODO: Question BONUS

/* Question BONUS Query Results

*/