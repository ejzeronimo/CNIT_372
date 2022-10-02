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
    FOR my_counter in 1 .. my_count LOOP
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

-- TODO: Question #1a

/* Question #1a Query Results

*/

-- TODO: Question #1b

/* Question #1b Query Results

*/

-- TODO: Question #1c

/* Question #1c Query Results

*/

-- TODO: Question #1d

/* Question #1d Query Results

*/

-- TODO: Question #2

/* Question #2 Query Results

*/

-- TODO: Question #3

/* Question #3 Query Results

*/

-- TODO: Question #3a

/* Question #3a Query Results

*/

-- TODO: Question #3b

/* Question #3b Query Results

*/

-- TODO: Question #3c

/* Question #3c Query Results

*/

-- TODO: Question #3d

/* Question #3d Query Results

*/

-- TODO: Question #3e

/* Question #3e Query Results

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

-- TODO: Question #5

/* Question #5 Query Results

*/

-- TODO: Question #6

/* Question #6 Query Results

*/

-- TODO: Question #6a

/* Question #6a Query Results

*/

-- TODO: Question #6b

/* Question #6b Query Results

*/

-- TODO: Question #6c

/* Question #6c Query Results

*/

-- TODO: Question #6d

/* Question #6d Query Results

*/

-- TODO: Question #6e

/* Question #6e Query Results

*/

-- TODO: Question #6f

/* Question #6f Query Results

*/

-- TODO: Question #6g

/* Question #6g Query Results

*/

-- TODO: Question #6h

/* Question #6h Query Results

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
-- TODO: Question #7b

/* Question #7b Query Results

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
-- TODO: Question #8b

/* Question #8b Query Results

*/

-- TODO: Question #9a

/* Question #9a Query Results

*/

-- TODO: Question #9b

/* Question #9b Query Results

*/