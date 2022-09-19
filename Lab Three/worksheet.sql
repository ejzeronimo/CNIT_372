/*
Ethan Zeronik
CNIT372 Lab #3
Estimated Time Spent: 1.5hrs
Late hours used: 0
*/

-- NOTE: DEBUG: PART A

-- NOTE: Question #1
BEGIN
    dbms_output.put_line ('Hello World');
END;
/
/* Question #1 Query Results
Nothing was printed.
*/

-- NOTE: Question #2
SET serveroutput on;
/
-- NOTE: Question #3
/*
Hello World was printed.

Nothing was printed because the environment variable was not saved.
*/

-- NOTE: Question #4
/*
SERVEROUTPUT determines whether output is printed from the DBMS_OUTPUT package.

https://www.ibm.com/docs/en/db2/11.5?topic=commands-set-serveroutput
*/

-- NOTE: Question #5
BEGIN
    dbms_output.put_line ('The Ubiquitous Hello World');
END;
/
/* Question #5 Query Results
The Ubiquitous Hello World
*/

-- NOTE: Question #6
BEGIN
    dbms_output.put ('The');
    dbms_output.put (' ');
    dbms_output.put ('Ubiquitous');
    dbms_output.put (' ');
    dbms_output.put ('Hello');
    dbms_output.put (' ');
    dbms_output.put_line ('World');
END;
/
/* Question #6 Query Results
The Ubiquitous Hello World
*/

-- NOTE: Question #7
/*
To me this reads like PUT does not add a new line and PUT_LINE puts '/r/n' at the end of the string
*/

-- NOTE: Question #8
/*
This procedure places a partial line in the buffer.

https://docs.oracle.com/database/121/TTPLP/d_output.htm#TTPLP71212
*/

-- NOTE: Question #9
/*
This procedure places a line in the buffer.

https://docs.oracle.com/database/121/TTPLP/d_output.htm#TTPLP71215
*/

-- NOTE: Question #10
/*
The difference is that PUT does not create a new line but PUT_LINE creates a new line
*/

-- NOTE: Question #11
BEGIN
    dbms_output.put_line ('My name is ' || '&sv_YourName');
END;
/
/* Question #11 Query Results
It prompts for input then prints the result.

My name is Foo Bar
*/

-- NOTE: Question #12
SET verify on;
/
-- NOTE: Question #13
BEGIN
    dbms_output.put_line ('My name is ' || '&sv_YourName');
END;
/
/*
The main difference is that the command with the substitution and without it printed.

Enter value for sv_YourName: 
foo

old   2:     dbms_output.put_line ('My name is ' || '&sv_YourName');

new   2:     dbms_output.put_line ('My name is ' || 'foo');

My name is foo
*/

-- NOTE: Question #14
SET verify off;
/
-- NOTE: Question #15
BEGIN
    dbms_output.put_line ('My name is ' || '&sv_YourName');
END;
/
/* Question #15 Query Results
Enter value for sv_YourName: 
bar

My name is bar
*/

-- NOTE: Question #16
/*
Determines whether to show the before and after of a command that has a substitution variable.

https://www.oreilly.com/library/view/oracle-sqlplus-the/0596007469/re106.html
*/

-- NOTE: Question #17
BEGIN
    dbms_output.put_line ('My name is ' || '&sv_YourNamer');
END;
/
BEGIN
    dbms_output.put_line ('My name is ' || '&sv_YourNamer');
END;
/
/*
I am prompted twice which implies that & variables do not persist.
*/

-- NOTE: Question #18
BEGIN
    dbms_output.put_line ('Today is ' || '&sv_day');
    dbms_output.put_line ('Tomorrow is ' || '&sv_day');
END;
/
/* Question #18 Query Results
Enter value for sv_day: 
1

Enter value for sv_d: 
2

Today is 1
Tomorrow is 2

You can, it will prompt you for each occurrence.
*/

-- NOTE: Question #19
BEGIN
    dbms_output.put_line ('Today is ' || '&&sv_day');
    dbms_output.put_line ('Tomorrow is ' || '&sv_day');
END;
/
/* Question #19 Query Results
Enter value for sv_day: 
1

Today is 1
Tomorrow is 1

I was not prompted twice, the cause is simple. Whenever you define a variable with two && PlSQL will DEFINE the user input for that variable.
*/

-- NOTE: Question #20
BEGIN
    dbms_output.put_line ('Today is ' || '&&sv_day');
    dbms_output.put_line ('Tomorrow is ' || '&sv_day');
END;
/
/* Question #20 Query Results
Today is 1
Tomorrow is 1

No prompt. This implies that the && varaibles persist through the session.
*/

-- NOTE: Question #21
DECLARE
    v_day VARCHAR2 (10) := '&sv_day1';
BEGIN
    dbms_output.put_line ('Today is ' || v_day);
END;
/
/* Question #21 Query Results
Enter value for sv_day1: 
Today!

Today is Today!
*/

-- NOTE: Question #22
DECLARE
    v_day VARCHAR2 (10);
BEGIN
    v_day := to_char (sysdate, 'Day');
    dbms_output.put_line ('Today is ' || v_day);
    dbms_output.put_line ('Tomorrow is ' || to_char (sysdate + 1, 'Day') );
END;
/
/* Question #22 Query Results
Today is Wednesday
Tomorrow is Thursday
*/

-- NOTE: Question #23
SELECT employeeid
FROM employee
WHERE employeeid = '100001';
/* Question #23 Query Results
One row was returned.

EMPLOYEEID
100001
*/

-- NOTE: Question #24
DECLARE
    v_employeeid employee.employeeid%type;
    v_lastname   employee.lastname%type;
    v_firstname  employee.firstname%type;
BEGIN
    SELECT employeeid, lastname, firstname INTO v_employeeid, v_lastname, v_firstname
    FROM employee
    WHERE employeeid = '100001';
 -- print the result
    dbms_output.put_line ('Employee ID      Last Name       First Name');
    dbms_output.put_line ('===========================================');
    dbms_output.put (v_employeeid);
    dbms_output.put ('      ');
    dbms_output.put (v_lastname);
    dbms_output.put ('      ');
    dbms_output.put_line (v_firstname);
END;
/
/* Question #24 Query Results
Employee ID      Last Name       First Name
===========================================
100001      Manaugh      Jim
*/

-- NOTE: Question #25
SELECT employeeid
FROM employee;
/* Question #25 Query Results
40 rows are returned.

EMPLOYEEID
100001
100101
100103
100104
100106
100112
100120
100125
100127
100200
100204
100206
100209
100220
100330
100365
100399
100475
100488
100550
100559
100600
100650
100700
100880
100892
100944
100967
100989
101007
101030
101045
101066
101088
101089
101097
101115
101135
101154
101166
*/

-- NOTE: Question #26
DECLARE
    v_employeeid employee.employeeid%type;
    v_lastname   employee.lastname%type;
    v_firstname  employee.firstname%type;
BEGIN
    SELECT employeeid, lastname, firstname INTO v_employeeid, v_lastname, v_firstname
    FROM employee;
 -- print the result
    dbms_output.put_line ('Employee ID      Last Name       First Name');
    dbms_output.put_line ('===========================================');
    dbms_output.put (v_employeeid);
    dbms_output.put ('      ');
    dbms_output.put (v_lastname);
    dbms_output.put ('      ');
    dbms_output.put_line (v_firstname);
END;
/
/* Question #26 Query Results
DECLARE
*
ERROR at line 311:
ORA-01422: exact fetch returns more than requested number of rows
ORA-06512: at line 6
*/

-- NOTE: Question #27
/*
You are trying to put 40 rows of data into one varaible in the PL/SQL block.

This will cause an error
*/

-- NOTE: Question #28
/*
In a scalar type varialbe only one value can be held at a time.
*/

-- NOTE: Question #29
DECLARE
    v_employee employee%rowtype;
BEGIN
    SELECT * INTO v_employee
    FROM employee
    WHERE employeeid = '100001';
 -- print the result
    dbms_output.put_line ('Employee ID      Last Name       First Name');
    dbms_output.put_line ('===========================================');
    dbms_output.put_line (v_employee.employeeid || '      ' || v_employee.lastname || '      ' || v_employee.firstname);
END;
/
/* Question #29 Query Results
Employee ID      Last Name       First Name
===========================================
100001      Manaugh      Jim

Unlike in Q24 this uses the entire Employee object and as such has access to all of its properties. It also uses a different way to print the results.
*/

-- NOTE: Question #30
/*
v_code VARCHAR2 (3);
*/

-- NOTE: Question #31a
DECLARE
    v_num INTEGER;
BEGIN
    SELECT MAX (COUNT (substr (phone, 0, 3) ) ) INTO v_num
    FROM customer
    GROUP BY substr (phone, 0, 3);
END;
/
-- NOTE: Question #31b
DECLARE
    v_num  INTEGER;
    v_code VARCHAR2 (3);
BEGIN
    SELECT MAX (substr (phone, 0, 3) ) , MAX (COUNT (substr (phone, 0, 3) ) ) INTO v_code, v_num
    FROM customer
    GROUP BY substr (phone, 0, 3);
 -- print results
    dbms_output.put_line ('The area code is ' || v_code || ' with ' || v_num || ' customers');
END;
/
/* Question #32 Query Results
The area code is 978 with 8 customers
*/

-- NOTE: DEBUG: PART B

-- NOTE: Question #1
BEGIN
    dbms_output.put_line ('Today is ' || to_char (sysdate, 'MM/DD/YYYY') );
END;
/
/* Question #1 Query Results
Today is 09/18/2022
*/

-- NOTE: Question #2
BEGIN
    dbms_output.put ('Today is ' || to_char (sysdate, 'Day') );
    dbms_output.put ('Last Year it was ' || to_char (sysdate - 365, 'Day') );
END;
/
/* Question #2 Query Results
No Output
*/

-- NOTE: Question #3
/*
PUT does not send the line to the STDIO (because it creates a fragement of the output buffer) but putline sends the whole buffer.
*/

-- NOTE: Question #4
DECLARE
    v_name VARCHAR2 (30) := '&sv_name';
    v_date date := to_date ('&sv_date', 'MM/DD/YYYY');
BEGIN
    dbms_output.put_line (v_name || ', born on ' || v_date || ', is ' || round ( (sysdate - v_date) / 365, 2) || ' years old');
END;
/
/* Question #4 Query Results
Enter value for sv_name: 
Ethan Zeronik

Enter value for sv_date: 
02/14/2001

Ethan Zeronik, born on 14-FEB-01, is 21.61 years old
*/

-- NOTE: Question #5
/*
Both variables could be declared as constants because they only need to be input a single time.
*/

-- NOTE: Question #6
DECLARE
    v_id         VARCHAR2 (10);
    v_count      INTEGER;
    v_supervisor employee%rowtype;
BEGIN
 -- get max supervisor id
    SELECT MAX (supervisor) , MAX (COUNT (supervisor) ) INTO v_id, v_count
    FROM employee
    GROUP BY supervisor;
 -- get supervisor name
    SELECT * INTO v_supervisor
    FROM employee
    WHERE employeeid = v_id;
 -- print results
    dbms_output.put_line (v_supervisor.firstname || ' ' || v_supervisor.lastname || ' has ' || v_count || ' employees');
END;
/
/* Question #6 Query Results
Ryan Stahley has 5 employees
*/

-- NOTE: Question #7
DECLARE
    v_id         employee.employeeid%type;
    v_count      INTEGER;
    v_supervisor employee%rowtype;
BEGIN
 -- get max supervisor id
    SELECT MAX (supervisor) , MAX (COUNT (supervisor) ) INTO v_id, v_count
    FROM employee
    GROUP BY supervisor;
 -- get supervisor name
    SELECT * INTO v_supervisor
    FROM employee
    WHERE employeeid = v_id;
 -- print results
    dbms_output.put_line (v_supervisor.firstname || ' ' || v_supervisor.lastname || ' has ' || v_count || ' employees');
END;
/
/* Question #7 Query Results
Ryan Stahley has 5 employees
*/

-- NOTE: Question #8
DECLARE
    TYPE dictionary IS
        TABLE OF INTEGER INDEX BY employee.employeeid%type;
    v_supervisors dictionary;
 -- iterator vars
    v_it          employee.employeeid%type;
    v_supervisor  employee%rowtype;
BEGIN
 -- get all supervisor ids and counts
    FOR r IN (
        SELECT supervisor, COUNT (supervisor) AS countvalue
        FROM employee
        WHERE supervisor IS NOT NULL
        GROUP BY supervisor
    ) LOOP
        v_supervisors (r.supervisor) := r.countvalue;
    END LOOP;
 -- print supervisor info
    v_it := v_supervisors.first;
    WHILE (v_it IS NOT NULL) LOOP
 -- get employee info
        SELECT * INTO v_supervisor
        FROM employee
        WHERE employeeid = v_it;
 -- print the info
        dbms_output.put_line (v_supervisor.firstname || ' ' || v_supervisor.lastname || ' has ' || v_supervisors (v_it) || ' employees');
 -- iterate
        v_it := v_supervisors.next (v_it);
    END LOOP;
END;
/
/* Question #8 Query Results
Jim Manaugh has 2 employees
Rita Bush has 2 employees
Michael Abbott has 3 employees
Gabrielle Stevenson has 3 employees
Jason Wendling has 2 employees
Beth Zobitz has 2 employees
Kathleen Xolo has 1 employees
Tina Yates has 4 employees
Kristen Gustavel has 2 employees
Sherman Cheswick has 3 employees
Meghan Tyrie has 5 employees
Edna Lilley has 2 employees
Gary German has 3 employees
Ryan Stahley has 5 employees
*/

-- NOTE: Question #9
DECLARE
    v_id         employee.employeeid%type;
    v_count      INTEGER;
    v_supervisor employee%rowtype;
BEGIN
 -- get max supervisor id
    SELECT supervisor, COUNT (supervisor) INTO v_id, v_count
    FROM employee
    GROUP BY supervisor;
 -- get supervisor name
    SELECT * INTO v_supervisor
    FROM employee
    WHERE employeeid = v_id;
 -- print results
    dbms_output.put_line (v_supervisor.firstname || ' ' || v_supervisor.lastname || ' has ' || v_count || ' employees');
END;
/
/* Question #9 Query Results
DECLARE
*
ERROR at line 544:
ORA-01422: exact fetch returns more than requested number of rows
ORA-06512: at line 7

This happens because we are assigning an array of results to a scalar variable. I fixed this issue in my question 8.
*/

-- NOTE: Question #10
DECLARE
    myname VARCHAR2 (10) NOT NULL := '';
BEGIN
    dbms_output.put_line ('my name is ' || myname);
END;
/
/* Question #10 Query Results
DECLARE
*
ERROR at line 572:
ORA-06502: PL/SQL: numeric or value error
ORA-06512: at line 2

To correct the code it needs to be fed a non-null string.
*/

-- NOTE: Question #11
DECLARE
    myname CONSTANT VARCHAR2 (10) NOT NULL := '';
BEGIN
    dbms_output.put_line ('my name is ' || myname);
END;
/
/* Question #11 Query Results
DECLARE
*
ERROR at line 589:
ORA-06502: PL/SQL: numeric or value error
ORA-06512: at line 2

Still an error, constant does not fix this because you are trying to set a non-null string to null.
*/

-- NOTE: Question #12
/*
Yes, my fix of changing the stinrg to 'NO NAME' would fix both 10 and 11. This is because the contsant attribute does not change the root issue with this code block.
*/

-- NOTE: Question #13
/*
The variable name '1egit' would not work because a variable name cannot start with a number.
*/

-- NOTE: Question #14
/*
The code will not run because you are trying to assign a VARCHAR into an INTEGER in INNER_BLOCK1.

You can fix this by not redeclaring c_id or changing it to a VARCHAR.
*/

-- NOTE: Question #15
/*
INNER_BLOCK1 should be imporved because it seems to have no real purpose.
*/

-- NOTE: Question #16
/*
    The values are 'C-300001' and 'C-300001' since it is looking for the same customer id.
*/

-- NOTE: Question #17
/* Question #17 Query Results
 In this case the only value is at 16.a where it is 2001000741.
*/

-- NOTE: Question #18
DECLARE
    v_power    inventorypart.partdescription%type;
    v_software inventorypart.partdescription%type;
    v_temp     inventorypart.weight%type;
BEGIN
 -- get the heaviest object in the power category
    SELECT partdescription INTO v_power
    FROM inventorypart
    WHERE categoryid = 'POW' AND weight = (
            SELECT MAX (weight)
            FROM inventorypart
            WHERE categoryid = 'POW'
        )
    ORDER BY partnumber ASC FETCH FIRST 1 ROWS ONLY;
 -- get the heaviest object in the software category
    SELECT partdescription INTO v_software
    FROM inventorypart
    WHERE categoryid = 'SOFT' AND weight = (
            SELECT MAX (weight)
            FROM inventorypart
            WHERE categoryid = 'SOFT'
        )
    ORDER BY partnumber ASC FETCH FIRST 1 ROWS ONLY;
 -- print
    dbms_output.put_line ('The heaviest part in the Power category is ' || v_power || ', and the heaviest part in the Software category is ' || v_software || '.');
END;
/
/* Question #18 Query Results
The heaviest part in the Power category is 300 WATT POWER SUPPLY, and the heaviest part in the Software category is BOARD GAMES.
*/