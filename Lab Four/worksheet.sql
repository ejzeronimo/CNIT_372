/*
Ethan Zeronik
CNIT372 Lab #4
Estimated Time Spent: 1.5hrs
Late hours used: 0
*/

-- defaults to on
SET verify off;
/
-- NOTE: DEBUG: TABLE 1

-- NOTE: Question #1a
SELECT jobtitle, COUNT (employeeid)
FROM employee
GROUP BY jobtitle;
/* Question #1a Query Results
JOBTITLE	COUNT(EMPLOYEEID)
VP Finance	1
Sales	3
VP Information	1
Chief Information Officer	1
Chief Sales Officer	1
VP Operations	1
Accountant	2
President	1
DBA	1
Chief Financial Officer	1
Engineer	5
Programmer Analyst	2
Operations Officer	2
Assembly	18
*/

-- NOTE: Question #1b
DECLARE
    v_number_employees NUMBER;
    v_jobtitle         VARCHAR2 (50) := '&v_JOBTITLE';
BEGIN
    SELECT COUNT (employeeid) INTO v_number_employees
    FROM employee
    WHERE jobtitle = v_jobtitle;
 -- print results
    IF v_number_employees < 1 THEN
        dbms_output.put_line ('There are no employees with the Job Title: ' || v_jobtitle);
    ELSIF v_number_employees < 4 THEN
        dbms_output.put_line ('There are between 1 and 3 employees with the Job Title: ' || v_jobtitle);
    ELSIF v_number_employees < 7 THEN
        dbms_output.put_line ('There are between 4 and 6 employees with the Job Title: ' || v_jobtitle);
    ELSE
        dbms_output.put_line ('There are no employees with the Job Title: ' || v_jobtitle);
    END IF;
END;
/
/* Question #1b Query Results
There are no employees with the Job Title: CIO
*/

-- NOTE: Question #1c
/*
There are between 1 and 3 employees with the Job Title: Accountant
*/

-- NOTE: Question #1d
/*
There are between 4 and 6 employees with the Job Title: Engineer
*/

-- NOTE: Question #1e
/*
There are no employees with the Job Title: Assembly
*/

-- NOTE: Question #2a
DECLARE
    v_number_employees NUMBER;
    v_jobtitle         VARCHAR2 (50) := '&v_JOBTITLE';
BEGIN
    SELECT COUNT (employeeid) INTO v_number_employees
    FROM employee
    WHERE jobtitle = v_jobtitle;
 -- print results
    CASE v_number_employees
        WHEN 0 THEN
            dbms_output.put_line ('There are no employees with the Job Title: ' || v_jobtitle);
        WHEN 1 THEN
            dbms_output.put_line ('There are between 1 and 3 employees with the Job Title: ' || v_jobtitle);
        WHEN 2 THEN
            dbms_output.put_line ('There are between 1 and 3 employees with the Job Title: ' || v_jobtitle);
        WHEN 3 THEN
            dbms_output.put_line ('There are between 1 and 3 employees with the Job Title: ' || v_jobtitle);
        WHEN 4 THEN
            dbms_output.put_line ('There are between 4 and 6 employees with the Job Title: ' || v_jobtitle);
        WHEN 5 THEN
            dbms_output.put_line ('There are between 4 and 6 employees with the Job Title: ' || v_jobtitle);
        WHEN 6 THEN
            dbms_output.put_line ('There are between 4 and 6 employees with the Job Title: ' || v_jobtitle);
        ELSE
            dbms_output.put_line ('There are no employees with the Job Title: ' || v_jobtitle);
    END CASE;
END;
/
/* Question #2a Query Results
There are no employees with the Job Title: CIO
*/

-- NOTE: Question #2b
/*
There are between 1 and 3 employees with the Job Title: Accountant
*/

-- NOTE: Question #2c
/*
There are between 4 and 6 employees with the Job Title: Engineer
*/

-- NOTE: Question #2d
/*
There are no employees with the Job Title: Assembly
*/

-- NOTE: Question #3
DECLARE
    v_number_employees NUMBER;
    v_jobtitle         VARCHAR2 (50) := '&v_JOBTITLE';
    v_staff_level      VARCHAR2 (100);
BEGIN
    SELECT COUNT (employeeid) INTO v_number_employees
    FROM employee
    WHERE jobtitle = v_jobtitle;
 -- print results
    CASE v_number_employees
        WHEN 0 THEN
            v_staff_level := 'There are no employees with the Job Title: ';
        WHEN 1 THEN
            v_staff_level := 'There are between 1 and 3 employees with the Job Title: ';
        WHEN 2 THEN
            v_staff_level := 'There are between 1 and 3 employees with the Job Title: ';
        WHEN 3 THEN
            v_staff_level := 'There are between 1 and 3 employees with the Job Title: ';
        WHEN 4 THEN
            v_staff_level := 'There are between 4 and 6 employees with the Job Title: ';
        WHEN 5 THEN
            v_staff_level := 'There are between 4 and 6 employees with the Job Title: ';
        WHEN 6 THEN
            v_staff_level := 'There are between 4 and 6 employees with the Job Title: ';
        ELSE
            v_staff_level := 'There are no employees with the Job Title: ';
    END CASE;
 -- output
    dbms_output.put_line (v_staff_level || v_jobtitle);
END;
/
/* Question #3 Query Results
There are between 4 and 6 employees with the Job Title: Engineer
*/

-- NOTE: Question #4a
DECLARE
    my_count   INTEGER := '&MY_COUNT';
    my_counter INTEGER := 1;
    my_number  INTEGER;
BEGIN
    LOOP
        my_number := dbms_random.value (1, my_count);
        dbms_output.put (my_number || ', ');
        my_counter := my_counter + 1;
        EXIT WHEN my_counter > my_count;
    END LOOP;
    dbms_output.put_line ('');
END;
/
/* Question #4a Query Results
Enter value for MY_COUNT: 
5

4, 3, 4, 2, 5,
*/

-- NOTE: Question #4b
/*
This loop generates X random numbers where X is the value you give the function.
*/

-- NOTE: Question #5a
DECLARE
    my_count   INTEGER := '&MY_COUNT';
    my_counter INTEGER := 1;
    my_number  INTEGER;
BEGIN
    WHILE my_counter <= my_count LOOP
        my_number := dbms_random.value (1, my_count);
        dbms_output.put (my_number || ', ');
        my_counter := my_counter + 1;
    END LOOP;
    dbms_output.put_line ('');
END;
/
-- NOTE: Question #5b
/*
Enter value for MY_COUNT: 
5

3, 4, 3, 3, 3,
*/

-- NOTE: Question #6a
DECLARE
    my_count   INTEGER := '&MY_COUNT';
    my_counter INTEGER := 1;
    my_number  INTEGER;
BEGIN
    FOR my_counter IN 1..my_count LOOP
        my_number := dbms_random.value (1, my_count);
        dbms_output.put (my_number || ', ');
    END LOOP;
    dbms_output.put_line ('');
END;
/
-- NOTE: Question #6b
/*
Enter value for MY_COUNT: 
5

2, 2, 5, 5, 4,
*/

-- NOTE: DEBUG: TABLE 2

-- NOTE: Question #1a
CREATE OR REPLACE PROCEDURE hello_world AS
    v_output VARCHAR2 (35) := 'Hello World';
BEGIN
    dbms_output.put_line (v_output);
END hello_world;
/
/* Question #1a Query Results
PROCEDURE created.
*/

-- NOTE: Question #1b
/*
You need to use the EXECUTE keyword to run a procedure.
*/

-- NOTE: Question #1c
execute hello_world ();
/* Question #1c Query Results
Hello World
*/

-- NOTE: Question #1d
/*
Named blocks are reusable while unnamed blocks are not.
*/

-- NOTE: Question #2
CREATE OR REPLACE PROCEDURE hello_world AS
    v_output VARCHAR2 (35) := 'Hello World';
BEGIN
    dbms_output.put_line (v_output);
END hello_world;
/
/*
The result is the same because I have been formatting all of my blocks
*/

-- NOTE: Question #3
CREATE OR REPLACE PROCEDURE hello_world (
    p_name IN VARCHAR2
) AS
    v_output VARCHAR2 (35);
BEGIN
    v_output := 'Hello ' || p_name;
    dbms_output.put_line (v_output);
END hello_world;
/
-- NOTE: Question #3a
execute hello_world ('Ethan');
/* Question #3a Query Results
Hello Ethan
*/

-- NOTE: Question #3b
execute hello_world ('Mark.');
/* Question #3b Query Results
Hello Mark.
*/

-- NOTE: Question #3c
execute hello_world ('World procedure. I have so much fun coding in SQL and PLSQL.');
/* Question #3c Query Results
execute hello_world ('World procedure. I have so much fun coding in SQL and
PLSQL.');
*

ERROR at line 292:
ORA-06502: PL/SQL: numeric or value error: character string buffer too small
ORA-06512: at "EZERONIK.HELLO_WORLD", line 6
ORA-06512: at line 1

It returns an error because the buffer var is too small
*/

-- NOTE: Question #3d
CREATE OR REPLACE PROCEDURE hello_world (
    p_name IN VARCHAR2
) AS
    v_output VARCHAR2 (85);
BEGIN
    v_output := 'Hello ' || p_name;
    dbms_output.put_line (v_output);
END hello_world;
/
-- NOTE: Question #3e
execute hello_world ('World procedure. I have so much fun coding in SQL and PLSQL.');
/* Question #3e Query Results
Hello World procedure. I have so much fun coding in SQL and PLSQL.
*/

-- NOTE: Question #4
CREATE OR REPLACE PROCEDURE hello_world (
    p_greeting IN VARCHAR2, p_name IN VARCHAR2
) AS
    v_output VARCHAR2 (75);
BEGIN
    v_output := p_greeting || ' ' || p_name;
    dbms_output.put_line (v_output);
END hello_world;
/
-- NOTE: Question #4a
execute hello_world ('Hello', 'World');
/* Question #4a Query Results
Hello World
*/

-- NOTE: Question #4b
execute hello_world ('World');
/* Question #4b Query Results
execute hello_world ('World');

ERROR at line 140:
ORA-06550: line 1, column 7:
PLS-00306: wrong number or types of arguments in call to 'HELLO_WORLD'
ORA-06550: line 1, column 7:
PL/SQL: Statement ignored

The error is of type "wrong number of arguements"
*/

-- NOTE: Question #4c
execute hello_world ('Goodbye', 'Hal');
/* Question #4c Query Results
Goodbye Hal
*/

-- NOTE: Question #4d
execute hello_world ('Hello', NULL);
/* Question #4d Query Results
Hello
*/

-- NOTE: Question #5
CREATE OR REPLACE FUNCTION number_of_employees RETURN NUMBER AS
    v_number_of_employees NUMBER := 0;
BEGIN
    SELECT COUNT ( * ) INTO v_number_of_employees
    FROM employee;
    RETURN v_number_of_employees;
END number_of_employees;
/
BEGIN
    dbms_output.put_line ('The function returns: ' || number_of_employees);
END;
/
/* Question #5 Query Results
The function returns: 40
*/

-- NOTE: Question #6
CREATE OR REPLACE FUNCTION number_of_employees (
    p_jobtitle IN VARCHAR2
) RETURN NUMBER AS
    v_number_of_employees NUMBER := 0;
BEGIN
    SELECT COUNT ( * ) INTO v_number_of_employees
    FROM employee
    WHERE jobtitle = p_jobtitle;
    RETURN v_number_of_employees;
END number_of_employees;
/
-- NOTE: Question #6a
DECLARE
    v_jobtitle VARCHAR2 (35) := 'Engineer';
BEGIN
    dbms_output.put_line ('Number of ' || v_jobtitle || ': ' || number_of_employees (v_jobtitle) );
END;
/
/* Question #6a Query Results
Number of Engineer: 5
*/

-- NOTE: Question #6b
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
-- NOTE: Question #6c
DECLARE
    v_jobtitle VARCHAR2 (35) := 'engineer';
BEGIN
    dbms_output.put_line ('Number of ' || v_jobtitle || ': ' || number_of_employees (v_jobtitle) );
END;
/
/* Question #6c Query Results
Number of engineer: 5
*/

-- NOTE: Question #6d
DECLARE
    v_jobtitle VARCHAR2 (35) := 'dba';
BEGIN
    dbms_output.put_line ('Number of ' || v_jobtitle || ': ' || number_of_employees (v_jobtitle) );
END;
/
/* Question #6d Query Results
Number of dba: 1
*/

-- NOTE: Question #6e
DECLARE
    v_jobtitle VARCHAR2 (35) := 'DBA';
BEGIN
    dbms_output.put_line ('Number of ' || v_jobtitle || ': ' || number_of_employees (v_jobtitle) );
END;
/
/* Question #6e Query Results
Number of DBA: 1
*/

-- NOTE: Question #6f
DECLARE
    v_jobtitle VARCHAR2 (35) := 'chief sales officer';
BEGIN
    dbms_output.put_line ('Number of ' || v_jobtitle || ': ' || number_of_employees (v_jobtitle) );
END;
/
/* Question #6f Query Results
Number of chief sales officer: 1
*/

-- NOTE: Question #6g
DECLARE
    v_jobtitle VARCHAR2 (35) := '   chief sales officer   ';
BEGIN
    dbms_output.put_line ('Number of ' || v_jobtitle || ': ' || number_of_employees (v_jobtitle) );
END;
/
/* Question #6g Query Results
Number of    chief sales officer   : 1
*/

-- NOTE: Question #6h
DECLARE
    v_jobtitle VARCHAR2 (35) := 'CEO';
BEGIN
    dbms_output.put_line ('Number of ' || v_jobtitle || ': ' || number_of_employees (v_jobtitle) );
END;
/
/* Question #6h Query Results
Number of CEO: 0
*/

-- NOTE: Question #7a
CREATE OR REPLACE PROCEDURE days_away (
    p_date IN DATE
) AS
    v_output VARCHAR2 (75);
BEGIN
    v_output := (p_date - sysdate) || ' days away!';
    dbms_output.put_line (v_output);
END days_away;
/
-- NOTE: Question #7b
execute days_away (TO_DATE ('01-10-2022', 'DD-MM-YYYY') );
execute days_away (TO_DATE ('03-10-2022', 'DD-MM-YYYY') );
/* Question #7b Query Results
-1.62289351851851851851851851851851851852 days away!
.3771064814814814814814814814814814814815 days away!
*/

-- NOTE: Question #8a
CREATE OR REPLACE PROCEDURE day_of_the_week (
    p_date IN DATE
) AS
    v_output VARCHAR2 (75);
BEGIN
    v_output := to_char (p_date - 1, 'DAY') || ' ' || to_char (p_date, 'DAY') || ' ' || to_char (p_date + 1, 'DAY') || '!';
    dbms_output.put_line (v_output);
END day_of_the_week;
/
-- NOTE: Question #8b
execute day_of_the_week (TO_DATE ('01-07-2022', 'DD-MM-YYYY') );
execute day_of_the_week (SYSDATE () );
/* Question #8b Query Results
THURSDAY  FRIDAY    SATURDAY !
SATURDAY  SUNDAY    MONDAY   !
*/

-- TODO: Question #9a

/* Question #9a Query Results

*/

-- TODO: Question #9b

/* Question #9b Query Results

*/