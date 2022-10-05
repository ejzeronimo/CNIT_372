/*
Ethan Zeronik
CNIT372 Lab Section #4
Estimated Time Spent: 1.5hrs
Late hours used: 0
*/

-- defaults to on
SET verify off;
/**/

-- NOTE: Question #1a
CREATE OR REPLACE PROCEDURE print_employee_roster AS
    current_employeeid employee.employeeid%type;
    current_lastname   employee.lastname%type;
    current_firstname  employee.firstname%type;
    CURSOR all_employees IS
        SELECT employeeid, lastname, firstname
        FROM employee;
BEGIN
    OPEN all_employees;
    FETCH all_employees INTO current_employeeid, current_lastname, current_firstname;
    WHILE all_employees%found LOOP
        dbms_output.put (rpad (current_employeeid, 15, ' ') );
        dbms_output.put (rpad (current_lastname, 30, ' ') );
        dbms_output.put_line (current_firstname);
        FETCH all_employees INTO current_employeeid, current_lastname, current_firstname;
    END LOOP;
    CLOSE all_employees;
END print_employee_roster;
/
/**/

-- NOTE: Question #1b
execute print_employee_roster ();
/* Question #1b Query Results
100001         Manaugh                       Jim
100101         Rosner                        Joanne
100103         Bush                          Rita
100104         Abbott                        Michael
100106         Eckelman                      Paul
100112         Hickman                       Steven
100120         Nairn                         Michelle
100125         Stevenson                     Gabrielle
100127         Wendling                      Jason
100200         Zobitz                        Beth
100204         Keck                          David
100206         Xolo                          Kathleen
100209         Yates                         Tina
100220         Vigus                         Todd
100330         Gustavel                      Kristen
100365         Cheswick                      Sherman
100399         Day                           Ronald
100475         Hess                          Steve
100488         Osman                         Jamie
100550         Roland                        Allison
100559         Tyrie                         Meghan
100600         Zollman                       Calie
100650         Lilley                        Edna
100700         Jones                         Charles
100880         German                        Gary
100892         Platt                         Joseph
100944         Stahley                       Ryan
100967         Albregts                      Nicholas
100989         Deagen                        Kathryn
101007         Krasner                       Jason
101030         Moore                         Kristey
101045         Ortman                        Austin
101066         Rodgers                       Laura
101088         Underwood                     Patricha
101089         Alvarez                       Melissa
101097         Brose                         Jack
101115         Cochran                       Steve
101135         Deppe                         David
101154         Hettinger                     Gregory
101166         Reece                         Phil
*/

-- NOTE: Question #2a
CREATE OR REPLACE PROCEDURE print_employee_roster AS
    CURSOR all_employees IS
        SELECT employeeid, lastname, firstname
        FROM employee;
    current_employee all_employees%rowtype;
BEGIN
    OPEN all_employees;
    FETCH all_employees INTO current_employee;
    WHILE all_employees%found LOOP
        dbms_output.put (rpad (current_employee.employeeid, 15, ' ') );
        dbms_output.put (rpad (current_employee.lastname, 30, ' ') );
        dbms_output.put_line (current_employee.firstname);
        FETCH all_employees INTO current_employee;
    END LOOP;
    CLOSE all_employees;
END print_employee_roster;
/
/**/

-- NOTE: Question #2b
execute print_employee_roster ();
/* Question #2b Query Results
100001         Manaugh                       Jim
100101         Rosner                        Joanne
100103         Bush                          Rita
100104         Abbott                        Michael
100106         Eckelman                      Paul
100112         Hickman                       Steven
100120         Nairn                         Michelle
100125         Stevenson                     Gabrielle
100127         Wendling                      Jason
100200         Zobitz                        Beth
100204         Keck                          David
100206         Xolo                          Kathleen
100209         Yates                         Tina
100220         Vigus                         Todd
100330         Gustavel                      Kristen
100365         Cheswick                      Sherman
100399         Day                           Ronald
100475         Hess                          Steve
100488         Osman                         Jamie
100550         Roland                        Allison
100559         Tyrie                         Meghan
100600         Zollman                       Calie
100650         Lilley                        Edna
100700         Jones                         Charles
100880         German                        Gary
100892         Platt                         Joseph
100944         Stahley                       Ryan
100967         Albregts                      Nicholas
100989         Deagen                        Kathryn
101007         Krasner                       Jason
101030         Moore                         Kristey
101045         Ortman                        Austin
101066         Rodgers                       Laura
101088         Underwood                     Patricha
101089         Alvarez                       Melissa
101097         Brose                         Jack
101115         Cochran                       Steve
101135         Deppe                         David
101154         Hettinger                     Gregory
101166         Reece                         Phil
*/

-- NOTE: Question #2c
/*
current_employee is based on a row returned from the all_employees cursor
*/

-- NOTE: Question #3a
CREATE OR REPLACE PROCEDURE print_employee_roster AS
    CURSOR all_employees IS
        SELECT employeeid, lastname || ', ' || firstname AS name
        FROM employee;
    current_employee all_employees%rowtype;
BEGIN
    OPEN all_employees;
    FETCH all_employees INTO current_employee;
    WHILE all_employees%found LOOP
        dbms_output.put (rpad (current_employee.employeeid, 15, ' ') );
        dbms_output.put_line (current_employee.name);
        FETCH all_employees INTO current_employee;
    END LOOP;
    CLOSE all_employees;
END print_employee_roster;
/
/**/

-- NOTE: Question #3b
execute print_employee_roster ();
/* Question #3b Query Results
100001         Manaugh, Jim
100101         Rosner, Joanne
100103         Bush, Rita
100104         Abbott, Michael
100106         Eckelman, Paul
100112         Hickman, Steven
100120         Nairn, Michelle
100125         Stevenson, Gabrielle
100127         Wendling, Jason
100200         Zobitz, Beth
100204         Keck, David
100206         Xolo, Kathleen
100209         Yates, Tina
100220         Vigus, Todd
100330         Gustavel, Kristen
100365         Cheswick, Sherman
100399         Day, Ronald
100475         Hess, Steve
100488         Osman, Jamie
100550         Roland, Allison
100559         Tyrie, Meghan
100600         Zollman, Calie
100650         Lilley, Edna
100700         Jones, Charles
100880         German, Gary
100892         Platt, Joseph
100944         Stahley, Ryan
100967         Albregts, Nicholas
100989         Deagen, Kathryn
101007         Krasner, Jason
101030         Moore, Kristey
101045         Ortman, Austin
101066         Rodgers, Laura
101088         Underwood, Patricha
101089         Alvarez, Melissa
101097         Brose, Jack
101115         Cochran, Steve
101135         Deppe, David
101154         Hettinger, Gregory
101166         Reece, Phil
*/

-- NOTE: Question #4a
CREATE OR REPLACE PROCEDURE print_employee_roster AS
    CURSOR all_employees IS
        SELECT employeeid, lastname || ', ' || firstname AS name
        FROM employee;
BEGIN
    FOR current_employee IN all_employees LOOP
        dbms_output.put (rpad (current_employee.employeeid, 15, ' ') );
        dbms_output.put_line (current_employee.name);
    END LOOP;
END print_employee_roster;
/
/**/

-- NOTE: Question #4b
execute print_employee_roster ();
/* Question #4b Query Results
100001         Manaugh, Jim
100101         Rosner, Joanne
100103         Bush, Rita
100104         Abbott, Michael
100106         Eckelman, Paul
100112         Hickman, Steven
100120         Nairn, Michelle
100125         Stevenson, Gabrielle
100127         Wendling, Jason
100200         Zobitz, Beth
100204         Keck, David
100206         Xolo, Kathleen
100209         Yates, Tina
100220         Vigus, Todd
100330         Gustavel, Kristen
100365         Cheswick, Sherman
100399         Day, Ronald
100475         Hess, Steve
100488         Osman, Jamie
100550         Roland, Allison
100559         Tyrie, Meghan
100600         Zollman, Calie
100650         Lilley, Edna
100700         Jones, Charles
100880         German, Gary
100892         Platt, Joseph
100944         Stahley, Ryan
100967         Albregts, Nicholas
100989         Deagen, Kathryn
101007         Krasner, Jason
101030         Moore, Kristey
101045         Ortman, Austin
101066         Rodgers, Laura
101088         Underwood, Patricha
101089         Alvarez, Melissa
101097         Brose, Jack
101115         Cochran, Steve
101135         Deppe, David
101154         Hettinger, Gregory
101166         Reece, Phil
*/

-- NOTE: Question #4c
/*
open, fetch, and close are all handled implicitly in the for loop
*/

-- NOTE: Question #5a
CREATE OR REPLACE PROCEDURE print_employee_roster (
    p_jobtitle IN employee.jobtitle%type
) AS
    CURSOR all_employees IS
        SELECT employeeid, lastname || ', ' || firstname AS name
        FROM employee
        WHERE upper (trim (jobtitle) ) = upper (trim (p_jobtitle) );
BEGIN
    FOR current_employee IN all_employees LOOP
        dbms_output.put (rpad (current_employee.employeeid, 15, ' ') );
        dbms_output.put_line (current_employee.name);
    END LOOP;
END print_employee_roster;
/
/**/

-- NOTE: Question #5b
execute print_employee_roster ('sales');
/* Question #5b Query Results
100600         Zollman, Calie
101007         Krasner, Jason
101066         Rodgers, Laura
*/

-- NOTE: Question #5c
execute print_employee_roster ('assembly');
/* Question #5c Query Results
100101         Rosner, Joanne
100120         Nairn, Michelle
100204         Keck, David
100399         Day, Ronald
100475         Hess, Steve
100550         Roland, Allison
100892         Platt, Joseph
100967         Albregts, Nicholas
100989         Deagen, Kathryn
101030         Moore, Kristey
101045         Ortman, Austin
101088         Underwood, Patricha
101089         Alvarez, Melissa
101097         Brose, Jack
101115         Cochran, Steve
101135         Deppe, David
101154         Hettinger, Gregory
101166         Reece, Phil
*/

-- NOTE: Question #5d
execute print_employee_roster ('student');
/* Question #5d Query Results
it returns nothing because there is nothing in the cursor
*/

-- NOTE: Question #6a
CREATE OR REPLACE PROCEDURE print_employee_roster (
    p_jobtitle IN employee.jobtitle%type
) AS
    CURSOR all_employees IS
        SELECT employeeid, lastname || ', ' || firstname AS name
        FROM employee
        WHERE upper (trim (jobtitle) ) = upper (trim (p_jobtitle) );
BEGIN
    FOR current_employee IN all_employees LOOP
        dbms_output.put (rpad (current_employee.employeeid, 15, ' ') );
        dbms_output.put_line (current_employee.name);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put (sqlcode);
        dbms_output.put (': ');
        dbms_output.put_line (substr (sqlerrm, 1, 100) );
END print_employee_roster;
/
/**/

-- NOTE: Question #6b
execute print_employee_roster ('assembly');
/* Question #6b Query Results
100101         Rosner, Joanne
100120         Nairn, Michelle
100204         Keck, David
100399         Day, Ronald
100475         Hess, Steve
100550         Roland, Allison
100892         Platt, Joseph
100967         Albregts, Nicholas
100989         Deagen, Kathryn
101030         Moore, Kristey
101045         Ortman, Austin
101088         Underwood, Patricha
101089         Alvarez, Melissa
101097         Brose, Jack
101115         Cochran, Steve
101135         Deppe, David
101154         Hettinger, Gregory
101166         Reece, Phil
*/

-- NOTE: Question #6c
/*
if there is an error it will be printed as "code: message"
*/

-- NOTE: Question #7a
CREATE OR REPLACE PROCEDURE customer_roster (
    p_state IN customer.state%type
) AS
 -- cursor for the roster
    CURSOR all_customers IS
        SELECT companyname, city, state, custlastname || ', ' || custfirstname AS contact
        FROM customer
        WHERE upper (trim (state) ) = upper (trim (p_state) );
 -- instance of cursor row type
    current_customer all_customers%rowtype;
BEGIN
 -- print roster
    OPEN all_customers;
    FETCH all_customers INTO current_customer;
    WHILE all_customers%found LOOP
        dbms_output.put (rpad (current_customer.city, 15, ' ') );
        dbms_output.put (rpad (current_customer.state, 10, ' ') );
        dbms_output.put (rpad (current_customer.contact, 30, ' ') );
        dbms_output.put_line (current_customer.companyname);
        FETCH all_customers INTO current_customer;
    END LOOP;
    CLOSE all_customers;
 -- exception handling
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put (sqlcode);
        dbms_output.put (': ');
        dbms_output.put_line (substr (sqlerrm, 1, 100) );
END customer_roster;
/
/**/

-- NOTE: Question #7b
execute customer_roster ('GA');
/* Question #7b Query Results
Athens         GA        Thompson, Jamie
Macon          GA        Vanderhoff, Rosemary
Nahunta        GA        Malady, Frank
Adel           GA        Strong, Susan                 Family Medical Center
Elberton       GA        Torres, Don                   Down Deep Drilling Inc.
Swainsboro     GA        Osborne, Shirley
*/

-- NOTE: Question #8a
CREATE OR REPLACE PROCEDURE customer_search (
    p_name IN customer.custlastname%type
) AS
 -- cursor for the roster
    CURSOR all_customers IS
        SELECT companyname, custfirstname, custlastname, custtitle
        FROM customer
        WHERE upper (trim (custlastname) ) LIKE '%' || upper (trim (p_name) ) || '%';
BEGIN
 -- print roster
    FOR current_customer IN all_customers LOOP
        dbms_output.put (rpad (current_customer.custtitle, 8, ' ') );
        dbms_output.put (rpad (current_customer.custfirstname, 15, ' ') );
        dbms_output.put (rpad (current_customer.custlastname, 15, ' ') );
        dbms_output.put_line (current_customer.companyname);
    END LOOP;
 -- exception handling
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put (sqlcode);
        dbms_output.put (': ');
        dbms_output.put_line (substr (sqlerrm, 1, 100) );
END customer_search;
/
/**/

-- NOTE: Question #8b
execute customer_search ('NA');
/* Question #8b Query Results
Dr.     Dorlan         Bresnaham
Mr.     Jay            Hanau
Mr.     Matt           Nakanishi
Mr.     Jim            Manaugh
Mr.     Daniel         Hundnall       Bobs Repair Service
Ms.     Jessica        Nakamura       Automart
*/

-- NOTE: Question #8c
CREATE OR REPLACE PROCEDURE customer_search (
    p_name IN customer.custlastname%type
) AS
 -- cursor for the roster
    CURSOR all_customers IS
        SELECT companyname, custfirstname, custlastname, custtitle
        FROM customer
        WHERE upper (trim (custlastname) ) LIKE '%' || upper (trim (p_name) ) || '%' OR upper (trim (custfirstname) ) LIKE '%' || upper (trim (p_name) ) || '%';
BEGIN
 -- print roster
    FOR current_customer IN all_customers LOOP
        dbms_output.put (rpad (current_customer.custtitle, 8, ' ') );
        dbms_output.put (rpad (current_customer.custfirstname, 15, ' ') );
        dbms_output.put (rpad (current_customer.custlastname, 15, ' ') );
        dbms_output.put_line (current_customer.companyname);
    END LOOP;
 -- exception handling
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put (sqlcode);
        dbms_output.put (': ');
        dbms_output.put_line (substr (sqlerrm, 1, 100) );
END customer_search;
/
/**/

-- NOTE: Question #8d
execute customer_search ('na');
/* Question #8d Query Results
Dr.     Dorlan         Bresnaham
Ms.     Verna          McGrew
Mrs.    Christina      Wilson
Mr.     Jay            Hanau
Mr.     Matt           Nakanishi
Mrs.    Nancy          Basham
Mr.     Jim            Manaugh
Mr.     Jonathon       Blanco
Mr.     Daniel         Hundnall       Bobs Repair Service
Ms.     Jessica        Nakamura       Automart
Dr.     Anna           Mayton
Mr.     Ronald         Miller
*/

-- NOTE: Question #8e
CREATE OR REPLACE PROCEDURE customer_search (
    p_name IN customer.custlastname%type
) AS
BEGIN
 -- print roster
    FOR current_customer IN (
        SELECT companyname, custfirstname, custlastname, custtitle
        FROM customer
        WHERE upper (trim (custlastname) ) LIKE '%' || upper (trim (p_name) ) || '%' OR upper (trim (custfirstname) ) LIKE '%' || upper (trim (p_name) ) || '%'
    ) LOOP
        dbms_output.put (rpad (current_customer.custtitle, 8, ' ') );
        dbms_output.put (rpad (current_customer.custfirstname, 15, ' ') );
        dbms_output.put (rpad (current_customer.custlastname, 15, ' ') );
        dbms_output.put_line (current_customer.companyname);
    END LOOP;
 -- exception handling
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put (sqlcode);
        dbms_output.put (': ');
        dbms_output.put_line (substr (sqlerrm, 1, 100) );
END customer_search;
/
/**/

-- NOTE: Question #8f
execute customer_search ('na');
/* Question #8f Query Results
Dr.     Dorlan         Bresnaham
Ms.     Verna          McGrew
Mrs.    Christina      Wilson
Mr.     Jay            Hanau
Mr.     Matt           Nakanishi
Mrs.    Nancy          Basham
Mr.     Jim            Manaugh
Mr.     Jonathon       Blanco
Mr.     Daniel         Hundnall       Bobs Repair Service
Ms.     Jessica        Nakamura       Automart
Dr.     Anna           Mayton
Mr.     Ronald         Miller
*/