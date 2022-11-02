/*
Ethan Zeronik
CNIT372 Lab Section #4
Estimated Time Spent: 1hr
Late hours used: 0
*/

-- defaults to on
SET verify off;
/**/

-- NOTE: Question #1a
CREATE OR REPLACE PACKAGE math_constants IS
    c_pi CONSTANT NUMBER := acos ( - 1);
END math_constants;
/
/* Question #1a Query Results
PACKAGE created.
*/

-- NOTE: Question #1b
SELECT acos ( - 1)
FROM dual;
/* Question #1b Query Results
acos is arccosine and when passed the value -1 it returns PI

ACOS(-1)
3.1415926535897932384626433832795028842
*/

-- NOTE: Question #1c
execute dbms_output.put_line (MATH_CONSTANTS.C_PI);
/
/* Question #1c Query Results
3.1415926535897932384626433832795028842
*/

-- NOTE: Question #1d
SELECT math_constants.c_pi
FROM dual;
/* Question #1d Query Results
you cannot call the constant in a select statement
*/

-- NOTE: Question #1e
CREATE OR REPLACE FUNCTION calculate_area (
    p_radius NUMBER
) RETURN NUMBER AS
    v_area NUMBER := 0;
BEGIN
    v_area := p_radius * math_constants.c_pi;
    RETURN v_area;
END calculate_area;
/
/* Question #1e Query Results
FUNCTION created.
*/

-- NOTE: Question #1f
BEGIN
    dbms_output.put_line (calculate_area (5) );
    dbms_output.put_line (calculate_area (10) );
    dbms_output.put_line (calculate_area (15) );
END;
/
/* Question #1f Query Results
15.707963267948966192313216916397514421
31.415926535897932384626433832795028842
47.123889803846898576939650749192543263
*/

-- NOTE: Question #2a
CREATE OR REPLACE FUNCTION parse_firstname (
    p_fullname supplier.contactname%type
) RETURN VARCHAR2 IS
    v_firstname supplier.contactname%type;
BEGIN
    v_firstname := substr (p_fullname, 1, instr (p_fullname, ' ', 1, 1) - 1);
    RETURN v_firstname;
END parse_firstname;
/
/* Question #2a Query Results
FUNCTION created.
*/

-- NOTE: Question #2b
SELECT parse_firstname (contactname)
FROM supplier;
/* Question #2b Query Results
PARSE_FIRSTNAME(CONTACTNAME)
Dorthy
Rob
Sandy
Timothy
Adam
William
Debra
Paul
Kelli
Kevin
Loraine
Wade
Elizabeth
David
Alice
Gordon
Jamie
Donald
Lance
Gary
Tim
Darlene
Pam
Thurman
Jennie
Travis
Stephen
Yauleng
Brenda
*/

-- NOTE: Question #2c
DROP FUNCTION parse_firstname;
/* Question #2c Query Results
FUNCTION dropped.
*/

-- NOTE: Question #2d
CREATE OR REPLACE PACKAGE pkg_format_eagle_data IS
    FUNCTION parse_firstname (
        p_fullname supplier.contactname%type
    ) RETURN VARCHAR2;
END pkg_format_eagle_data;
/
/* Question #2d Query Results
PACKAGE created.
*/

-- NOTE: Question #2e
CREATE OR REPLACE PACKAGE BODY pkg_format_eagle_data IS
    FUNCTION parse_firstname (
        p_fullname supplier.contactname%type
    ) RETURN VARCHAR2 IS
        v_firstname supplier.contactname%type;
    BEGIN
        v_firstname := substr (p_fullname, 1, instr (p_fullname, ' ', 1, 1) - 1);
        RETURN v_firstname;
    END parse_firstname;
END pkg_format_eagle_data;
/
/* Question #2e Query Results
PACKAGE BODY created.
*/

-- NOTE: Question #2f
SELECT pkg_format_eagle_data.parse_firstname (contactname)
FROM supplier;
/* Question #2f Query Results
PKG_FORMAT_EAGLE_DATA.PARSE_FIRSTNAME(CONTACTNAME)
Dorthy
Rob
Sandy
Timothy
Adam
William
Debra
Paul
Kelli
Kevin
Loraine
Wade
Elizabeth
David
Alice
Gordon
Jamie
Donald
Lance
Gary
Tim
Darlene
Pam
Thurman
Jennie
Travis
Stephen
Yauleng
Brenda
*/

-- NOTE: Question #2g
CREATE OR REPLACE PACKAGE pkg_format_eagle_data IS
 -- firstname parse
    FUNCTION parse_firstname (
        p_fullname supplier.contactname%type
    ) RETURN VARCHAR2;
 -- lastname parse
    FUNCTION parse_lastname (
        p_fullname supplier.contactname%type
    ) RETURN VARCHAR2;
END pkg_format_eagle_data;
/
/* Question #2g Query Results
PACKAGE created.
*/

-- NOTE: Question #2h
CREATE OR REPLACE PACKAGE BODY pkg_format_eagle_data IS
 -- firstname parse
    FUNCTION parse_firstname (
        p_fullname supplier.contactname%type
    ) RETURN VARCHAR2 IS
        v_firstname supplier.contactname%type;
    BEGIN
        v_firstname := substr (p_fullname, 1, instr (p_fullname, ' ', 1, 1) - 1);
        RETURN v_firstname;
    END parse_firstname;
 -- lastname parse
    FUNCTION parse_lastname (
        p_fullname supplier.contactname%type
    ) RETURN VARCHAR2 IS
        v_firstname supplier.contactname%type;
    BEGIN
        v_firstname := substr (p_fullname, instr (p_fullname, ' ', 1, 1) , length (p_fullname) );
        RETURN v_firstname;
    END parse_lastname;
END pkg_format_eagle_data;
/
/* Question #2h Query Results
PACKAGE BODY created.
*/

-- NOTE: Question #2i
SELECT pkg_format_eagle_data.parse_firstname (contactname) , pkg_format_eagle_data.parse_lastname (contactname)
FROM supplier;
/* Question #2i Query Results
PKG_FORMAT_EAGLE_DATA.PARSE_FIRSTNAME(CONTACTNAME)	PKG_FORMAT_EAGLE_DATA.PARSE_LASTNAME(CONTACTNAME)
Dorthy	 Beering
Rob	 Thomas
Sandy	 Goodman
Timothy	 Neal
Adam	 Cyr
William	 Newlon
Debra	 Cruz
Paul	 Smith
Kelli	 Jones
Kevin	 Martin
Loraine	 Platt
Wade	 Holle
Elizabeth	 Clark
David	 Becker
Alice	 Mynhier
Gordon	 Mayes
Jamie	 Pickett
Donald	 Blythe
Lance	 Andrews
Gary	 Mikels
Tim	 White
Darlene	 Jenkins
Pam	 Krick
Thurman	 Mezzo
Jennie	 Fry
Travis	 Honn
Stephen	 Bird
Yauleng	 Depoe
Brenda	 Pritchett
*/

-- NOTE: Question #3a-e
CREATE OR REPLACE PACKAGE pkg_shape_calculation IS
 -- function that takes length & width, verifies it
    FUNCTION rectangle_area (
        p_length NUMBER, p_width NUMBER
    ) RETURN NUMBER;
 -- function that takes length, verifies it
    FUNCTION rectangle_area (
        p_length NUMBER
    ) RETURN NUMBER;
 -- function that takes radius, verifies it
    FUNCTION circle_area (
        p_radius NUMBER
    ) RETURN NUMBER;
END pkg_shape_calculation;
/
CREATE OR REPLACE PACKAGE BODY pkg_shape_calculation AS
 -- constant for pi
    c_pi CONSTANT NUMBER := acos ( - 1);
 -- function that checks a number
    FUNCTION check_value (
        p_value NUMBER
    ) RETURN BOOLEAN AS
    BEGIN
        RETURN p_value > 0;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN false;
    END check_value;
 -- function that takes length & width, verifies it
    FUNCTION rectangle_area (
        p_length NUMBER, p_width NUMBER
    ) RETURN NUMBER AS
        v_area NUMBER := 0;
    BEGIN
        IF check_value (p_length) AND check_value (p_length) THEN
            v_area := p_length * p_width;
        END IF;
        RETURN v_area;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END rectangle_area;
 -- function that takes length, verifies it
    FUNCTION rectangle_area (
        p_length NUMBER
    ) RETURN NUMBER AS
        v_area NUMBER := 0;
    BEGIN
        IF check_value (p_length) THEN
            v_area := p_length * p_length;
        END IF;
        RETURN v_area;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END rectangle_area;
 -- function that takes radius, verifies it
    FUNCTION circle_area (
        p_radius NUMBER
    ) RETURN NUMBER AS
        v_area NUMBER := 0;
    BEGIN
        IF check_value (p_radius) THEN
            v_area := p_radius * p_radius * c_pi;
        END IF;
        RETURN v_area;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END circle_area;
END pkg_shape_calculation;
/
/* Question #3a-e Query Results
c - the advantage of making the constant private is that it cannot be modified outside of the package

PACKAGE created.

PACKAGE BODY created.
*/

-- NOTE: Question #3f
DECLARE
    b BOOLEAN := false;
BEGIN
 -- dual input
    dbms_output.put_line ('Dual input rectangle:');
    b := (pkg_shape_calculation.rectangle_area (0, 0) = 0);
    dbms_output.put_line ('zero? ' ||
        CASE
            WHEN b THEN
                'TRUE'
            WHEN NOT b THEN
                'FALSE'
        END);
    b := (pkg_shape_calculation.rectangle_area ( - 1, - 1) = 0);
    dbms_output.put_line ('negative? ' ||
        CASE
            WHEN b THEN
                'TRUE'
            WHEN NOT b THEN
                'FALSE'
        END);
    b := (pkg_shape_calculation.rectangle_area (1, 5) = 5);
    dbms_output.put_line ('positive? ' ||
        CASE
            WHEN b THEN
                'TRUE'
            WHEN NOT b THEN
                'FALSE'
        END);
 -- single input
    dbms_output.put_line ('Single input rectangle:');
    b := (pkg_shape_calculation.rectangle_area (0) = 0);
    dbms_output.put_line ('zero? ' ||
        CASE
            WHEN b THEN
                'TRUE'
            WHEN NOT b THEN
                'FALSE'
        END);
    b := (pkg_shape_calculation.rectangle_area ( - 1) = 0);
    dbms_output.put_line ('negative? ' ||
        CASE
            WHEN b THEN
                'TRUE'
            WHEN NOT b THEN
                'FALSE'
        END);
    b := (pkg_shape_calculation.rectangle_area (3) = 9);
    dbms_output.put_line ('positive? ' ||
        CASE
            WHEN b THEN
                'TRUE'
            WHEN NOT b THEN
                'FALSE'
        END);
 -- cirlce input
    dbms_output.put_line ('Circle:');
    b := (pkg_shape_calculation.circle_area (0) = 0);
    dbms_output.put_line ('zero? ' ||
        CASE
            WHEN b THEN
                'TRUE'
            WHEN NOT b THEN
                'FALSE'
        END);
    b := (pkg_shape_calculation.circle_area ( - 1) = 0);
    dbms_output.put_line ('negative? ' ||
        CASE
            WHEN b THEN
                'TRUE'
            WHEN NOT b THEN
                'FALSE'
        END);
    b := (pkg_shape_calculation.circle_area (1) = acos ( - 1) );
    dbms_output.put_line ('positive? ' ||
        CASE
            WHEN b THEN
                'TRUE'
            WHEN NOT b THEN
                'FALSE'
        END);
END;
/
/* Question #3f Query Results
Dual input rectangle:
zero? TRUE
negative? TRUE
positive? TRUE
Single input rectangle:
zero? TRUE
negative? TRUE
positive? TRUE
Circle:
zero? TRUE
negative? TRUE
positive? TRUE
*/