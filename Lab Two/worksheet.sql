/*
Ethan Zeronik
CNIT372 Lab #2
Estimated Time Spent: 1.5hrs
Late hours used: 0
*/

-- NOTE: Question #1
SELECT ip.partnumber, ip.partdescription, round (AVG (col.orderquantity) , 1)
FROM inventorypart ip
    INNER JOIN custorderline col
    ON ip.partnumber = col.partnumber
WHERE ip.categoryid = 'ACCESS'
GROUP BY ip.partnumber, ip.partdescription
ORDER BY AVG (col.orderquantity) DESC;
/* Q1 Query Results
PARTNUMBER,PARTDESCRIPTION,ROUND(AVG(COL.ORDERQUANTITY),1)
MOD-001,PCI DATA/FAX/VOICE MODEM,8.3
MOD-002,112K DUAL MODEM,5.1
PRT-006,SINGLEHEAD THERMAL INKJET PRINTER,3.8
PRT-004,3-IN-1 COLOR INKJET PRINTER,3.6
SCN-002,SCANJET BUSINESS SERIES COLOR SCANNER,3.5
PRT-003,LASER JET 2500SE,3.4
MOD-005,V.90/K56 FLEX 56K FAX MODEM,3.1
PRT-001,LASER JET 1999SE,2.9
MOD-003,PCI MODEM,2.4
PRT-002,LASER JET 2000SE,2.3
SCN-001,SCANJET CSE COLOR SCANNER,1.8
MOD-004,PCI V.90 DATA/FAX/VOICE MODEM,1.6
*/

-- NOTE: Question #2a
SELECT to_char (co.orderdate, 'MM') , to_char (co.orderdate, 'YYYY') , round (AVG (col.orderquantity) , 1)
FROM custorder co
    INNER JOIN custorderline col
    ON co.orderid = col.orderid
WHERE col.partnumber = 'DVD-001'
GROUP BY to_char (co.orderdate, 'YYYY') , to_char (co.orderdate, 'MM')
ORDER BY to_char (co.orderdate, 'YYYY') , to_char (co.orderdate, 'MM');
/* Q2a Query Results
TO_CHAR(CO.ORDERDATE,'MM'),TO_CHAR(CO.ORDERDATE,'YYYY'),ROUND(AVG(COL.ORDERQUANTITY),1)
07,2010,1.5
09,2010,4
10,2010,1
11,2010,2
12,2010,1
01,2011,1
02,2011,8
03,2011,1
*/

-- NOTE: Question #2b
/*
The average rose, then dropped until FEB 2011 where it spiked.
*/

-- NOTE: Question #3a
SELECT to_char (co.orderdate, 'MM-YYYY') , round (SUM (col.orderquantity) , 1)
FROM custorder co
    INNER JOIN custorderline col
    ON co.orderid = col.orderid
WHERE col.partnumber = 'DVD-001'
GROUP BY to_char (co.orderdate, 'MM-YYYY')
ORDER BY to_date (to_char (co.orderdate, 'MM-YYYY') , 'MM-YYYY') ASC;
/* Q3a Query Results
TO_CHAR(CO.ORDERDATE,'MM-YYYY'),ROUND(SUM(COL.ORDERQUANTITY),1)
07-2010,3
09-2010,12
10-2010,1
11-2010,4
12-2010,3
01-2011,1
02-2011,16
03-2011,1
*/

-- NOTE: Question #3b
/*
I would plan to stay low in stock until winter where I would stock more because of Christmas.
*/

-- NOTE: Question #4
SELECT to_char (co.orderdate, 'MM') , to_char (co.orderdate, 'YYYY') , COUNT (co.orderid)
FROM custorder co
    INNER JOIN custorderline col
    ON co.orderid = col.orderid
WHERE col.partnumber = 'DVD-001'
GROUP BY to_char (co.orderdate, 'YYYY') , to_char (co.orderdate, 'MM')
ORDER BY to_char (co.orderdate, 'YYYY') , to_char (co.orderdate, 'MM');
/* Q4 Query Results
TO_CHAR(CO.ORDERDATE,'MM'),TO_CHAR(CO.ORDERDATE,'YYYY'),COUNT(CO.ORDERID)
07,2010,2
09,2010,3
10,2010,1
11,2010,2
12,2010,3
01,2011,1
02,2011,2
03,2011,1
*/

--NOTE: Question #5a
/*
They are all trying to answer the question of what the demand for DVD-001 is.
*/

-- NOTE: Question #5b
/*
It sells more closer to Christmas and the winter seasons than in the summer.
*/

-- NOTE: Question #5c
/*
They agree with each other somewhat which increases our confidence.
*/

-- NOTE: Question #6a
SELECT co.orderid, sh.shipmentid, ps.packagenumber, ps.shippeddate, sh.shipname, sh.shipaddress
FROM custorder co
    INNER JOIN shipment sh
    ON co.orderid = sh.orderid
    INNER JOIN packingslip ps
    ON sh.shipmentid = ps.shipmentid
WHERE co.orderid = '2000000007';
/* Q6a Query Results
ORDERID,SHIPMENTID,PACKAGENUMBER,SHIPPEDDATE,SHIPNAME,SHIPADDRESS
2000000007,H003,1,05-JUL-10,Evelyn Cassens,6094 Pearson Ave.
2000000007,H003,2,05-JUL-10,Evelyn Cassens,6094 Pearson Ave.
2000000007,H003,3,05-JUL-10,Evelyn Cassens,6094 Pearson Ave.
*/

-- NOTE: Question #6b
/*
The results shows each package relating to each shipment for the given order id.
*/

-- NOTE: Question #7a
SELECT c.custlastname || ', ' || c.custfirstname, c.customerid, co.orderid, c.companyname
FROM customer c
    LEFT OUTER JOIN custorder co
    ON c.customerid = co.customerid
WHERE c.companyname IS NULL
    AND c.state = 'PA';
/* Q7a Query Results
C.CUSTLASTNAME||','||C.CUSTFIRSTNAME,CUSTOMERID,ORDERID,COMPANYNAME
Wolfe, Thomas,I-300149,2000000497,
Wolfe, Thomas,I-300149,2001000670,
Wolfe, Thomas,I-300149,2001000736,
Wolfe, Thomas,I-300149,2001000751,
Wolfe, Thomas,I-300149,2001000768,
Kaleta, Don,I-300028,,
*/

-- NOTE: Question #7b
SELECT c.custlastname || ', ' || c.custfirstname, c.customerid, co.orderid, c.companyname
FROM custorder co
    RIGHT OUTER JOIN customer c
    ON co.customerid = c.customerid
WHERE c.companyname IS NULL
    AND c.state = 'PA';
/* Q7b Query Results
C.CUSTLASTNAME||','||C.CUSTFIRSTNAME,CUSTOMERID,ORDERID,COMPANYNAME
Wolfe, Thomas,I-300149,2000000497,
Wolfe, Thomas,I-300149,2001000670,
Wolfe, Thomas,I-300149,2001000736,
Wolfe, Thomas,I-300149,2001000751,
Wolfe, Thomas,I-300149,2001000768,
Kaleta, Don,I-300028,,
*/

-- NOTE: Question #8
SELECT ip.partnumber, cat.categoryname
FROM inventorypart ip
    FULL OUTER JOIN category cat
    ON ip.categoryid = cat.categoryid
 /* Q8 Query Results
PARTNUMBER,CATEGORYNAME
ADT-001,Storage
ADT-002,Cables
ADT-003,Cables
ADT-004,Cables
ADT-005,Cables
ADT-006,Cables
ADT-007,Cables
BB-001,Basics
BB-002,Basics
BB-003,Basics
BB-004,Basics
BB-005,Basics
BRK-001,Cables
BRK-002,Cables
BRK-003,Cables
BRK-004,Cables
BRK-005,Cables
BRK-006,Cables
BRK-007,Cables
BRK-008,Cables
BRK-009,Cables
BRK-010,Cables
BRK-011,Cables
C-001,Basics
C-002,Basics
C-003,Basics
CAB-001,Cables
CAB-002,Cables
CAB-003,Cables
CAB-004,Cables
CAB-005,Cables
CAB-006,Cables
CAB-007,Cables
CAB-008,Cables
CAB-009,
CAB-010,
CAB-011,
CAB-012,
CAB-013,
CAB-014,
CAB-015,
CAB-016,
CAB-017,
CAB-018,
CAB-019,
CAB-020,
CAB-021,
CAB-022,
CAB-023,
CAB-024,
CAB-025,
CAB-026,
CAB-027,
CAB-028,
CD-001,Storage
CD-002,Storage
CD-003,Storage
CD-004,Storage
CF-001,Processors
CF-002,Processors
CF-003,Processors
CF-004,Processors
CF-005,Processors
CF-006,Processors
CF-007,Processors
CF-008,Processors
CF-009,Processors
CRD-001,
CRD-002,
CRD-003,
CRD-004,
CRD-005,
CRD-006,
CRD-007,
CRD-008,
CRD-009,
CTR-001,Computers
CTR-002,Computers
CTR-003,Computers
CTR-004,Computers
CTR-005,Computers
CTR-006,Computers
CTR-007,Computers
CTR-008,Computers
CTR-009,Computers
CTR-010,Computers
CTR-011,Computers
CTR-012,Computers
CTR-013,Computers
CTR-014,Computers
CTR-015,Computers
CTR-016,Computers
CTR-017,Computers
CTR-018,Computers
CTR-019,Computers
CTR-020,Computers
CTR-021,Computers
CTR-022,Computers
CTR-023,Computers
CTR-024,Computers
CTR-025,Computers
CTR-026,Computers
CTR-027,Computers
CTR-028,Computers
CTR-029,Computers
DVD-001,Storage
DVD-002,Storage
ICAB-001,Cables
ICAB-002,Cables
ICAB-003,Cables
ICAB-004,Cables
ICAB-005,Cables
ICAB-006,Cables
ICAB-007,Cables
ICAB-008,Cables
KEY-001,Basics
KEY-002,Basics
KEY-003,Basics
KEY-004,Basics
KEY-005,Basics
KEY-006,Basics
KEY-007,Basics
KEY-008,Basics
KEY-009,Basics
MEM-001,Storage
MEM-002,Storage
MEM-003,Storage
MEM-004,Storage
MEM-005,Storage
MEM-006,Storage
MEM-007,Storage
MEM-008,Storage
MEM-009,Storage
MEM-010,Storage
MEM-011,Storage
MEM-012,Storage
MIC-001,Basics
MIC-002,Basics
MIC-003,Basics
MIC-004,Basics
MIC-005,Basics
MIC-006,Basics
MIC-007,Basics
MIC-008,Basics
MIC-009,Basics
MIC-010,Basics
MIC-011,Basics
MIC-012,Basics
MOD-001,Accessories
MOD-002,Accessories
MOD-003,Accessories
MOD-004,Accessories
MOD-005,Accessories
MOM-001,Basics
MOM-002,Basics
MOM-003,Basics
MOM-004,Basics
MON-001,Basics
MON-002,Basics
MON-003,Basics
MON-004,Basics
MON-005,Basics
MON-006,Basics
MON-007,Basics
MON-008,Basics
P-001,Processors
P-002,Processors
P-003,Processors
P-004,Processors
P-005,Processors
P-006,Processors
P-007,Processors
P-008,Processors
P-009,Processors
P-010,Processors
POW-001,Cables
POW-002,Cables
POW-003,Cables
PRT-001,Accessories
PRT-002,Accessories
PRT-003,Accessories
PRT-004,Accessories
PRT-005,Accessories
PRT-006,Accessories
PS-001,Power
PS-002,Power
PS-003,Power
PS-004,Power
SCN-001,Accessories
SCN-002,Accessories
SCN-003,Accessories
SFT-001,Software
SFT-002,Software
SFT-003,Software
SFT-004,Software
SFT-005,Software
SFT-006,Software
SFT-007,Software
SFT-008,Software
SFT-009,Software
SP-001,Basics
SP-002,Basics
SP-003,Basics
,Tablets
*/
 -- NOTE: Question #9a
    SELECT c.custfirstname || ' ' || c.custlastname, c.customerid, co.orderdate, sh.shipmentid, ps.packagenumber, sh.shipname, ps.shippeddate
    FROM customer c
        FULL OUTER JOIN custorder co
        ON c.customerid = co.customerid
        FULL OUTER JOIN shipment sh
        ON co.orderid = sh.orderid
        FULL OUTER JOIN packingslip ps
        ON sh.shipmentid = ps.shipmentid
    WHERE co.orderid = '2001000807';
/* Q9a Query Results
C.CUSTFIRSTNAME||''||C.CUSTLASTNAME,CUSTOMERID,ORDERDATE,SHIPMENTID,PACKAGENUMBER,SHIPNAME,SHIPPEDDATE
Cecil Scheetz,C-300003,31-MAR-11,H384,,Cecil Scheetz,
*/

-- NOTE: Question #9b
SELECT c.custfirstname || ' ' || c.custlastname, c.customerid, co.orderdate, sh.shipmentid, sh.shipname
FROM customer c
    RIGHT OUTER JOIN custorder co
    ON c.customerid = co.customerid
    LEFT OUTER JOIN shipment sh
    ON co.orderid = sh.orderid
    LEFT OUTER JOIN packingslip ps
    ON sh.shipmentid = ps.shipmentid
WHERE ps.shippeddate IS NULL;
/* Q9b Query Results
C.CUSTFIRSTNAME||''||C.CUSTLASTNAME,CUSTOMERID,ORDERDATE,SHIPMENTID,SHIPNAME
Verna McGrew,I-300069,27-MAR-11,L257,Verna McGrew
Charles Jones,I-300087,30-MAR-11,L260,Charles Jones
Zack Hill,I-300120,23-FEB-11,M129,Zack Hill
Mary Jo Wales,I-300125,30-MAR-11,L261,Mary Jo Wales
Tom Baker,I-300134,29-MAR-11,L259,Tom Baker
Daniel Rodkey,I-300141,31-MAR-11,L262,Daniel Rodkey
Steven Yaun,I-300147,27-MAR-11,L258,Michelle Oakley
Andy Huegel,I-300151,31-MAR-11,M162,Andy Huegel
Phil Reece,I-300154,29-MAR-11,M159,Phil Reece
Cecil Scheetz,C-300003,31-MAR-11,H384,Cecil Scheetz
Larry Osmanova,C-300026,30-MAR-11,H382,Larry Osmanova
Archie Doremski,C-300032,29-MAR-11,H380,Archie Doremski
Marjorie Vandermay,C-300045,31-MAR-11,H383,Marjorie Vandermay
Orville Gilliland,C-300069,30-MAR-11,H381,Orville Gilliland
Shirley Osborne,I-300013,30-MAR-11,M161,Shirley Osborne
Karen Mangus,I-300015,29-MAR-11,M160,Karen Mangus
Joan Hedden,I-300024,01-MAR-11,M137,Joan Hedden
Louise Cool,I-300044,13-MAR-11,M147,Louise Cool
*/

-- NOTE: Question #10a
SELECT customerid
FROM customer
WHERE state = 'PA' INTERSECT
    SELECT customerid
    FROM custorder;
/* Q10a Query Results
CUSTOMERID
C-300006
C-300040
C-300062
I-300149
*/

-- NOTE: Question #10b
SELECT customerid
FROM customer
WHERE state = 'PA' MINUS
    SELECT customerid
    FROM custorder;
/* Q10b Query Results
CUSTOMERID
I-300028
*/

-- NOTE: Question #10c
SELECT customerid
FROM customer
WHERE state = 'PA' INTERSECT
    SELECT customerid
    FROM custorder
    WHERE orderdate LIKE '%-11';
/* Q10c Query Results
CUSTOMERID
C-300006
C-300040
I-300149
*/

-- NOTE: Question #10d
SELECT customerid
FROM customer
WHERE state = 'PA' MINUS
    SELECT customerid
    FROM custorder
    WHERE orderdate LIKE '%-11';
/* Q10d Query Results
CUSTOMERID
C-300062
I-300028
*/

-- NOTE: Question #11a
SELECT partnumber
FROM inventorypart
WHERE categoryid = 'CAB' INTERSECT
    SELECT partnumber
    FROM custorderline;
/* Q11a Query Results
PARTNUMBER
ADT-003
ADT-004
ADT-005
ADT-006
ADT-007
BRK-001
BRK-002
BRK-003
BRK-004
BRK-005
BRK-007
BRK-008
BRK-009
BRK-010
BRK-011
CAB-001
CAB-003
CAB-005
CAB-006
CAB-007
CAB-008
ICAB-001
ICAB-002
ICAB-003
ICAB-004
ICAB-005
ICAB-006
ICAB-007
ICAB-008
POW-002
POW-003
*/

-- NOTE: Question #11b
SELECT partnumber
FROM inventorypart
WHERE categoryid = 'CAB' MINUS
    SELECT partnumber
    FROM custorderline;
/* Q11b Query Results
PARTNUMBER
ADT-002
BRK-006
CAB-002
CAB-004
POW-001
*/

-- NOTE: Question #11c
SELECT partnumber
FROM inventorypart
WHERE categoryid = 'CAB' INTERSECT
    SELECT partnumber
    FROM custorderline
        INNER JOIN custorder
        ON custorderline.orderid = custorder.orderid
    WHERE custorder.orderdate > TO_DATE ('12/31/2009', 'MM/DD/YYYY');
/* Q11c Query Results
PARTNUMBER
ADT-003
ADT-004
ADT-005
ADT-006
ADT-007
BRK-001
BRK-002
BRK-003
BRK-004
BRK-005
BRK-007
BRK-008
BRK-009
BRK-010
BRK-011
CAB-001
CAB-003
CAB-005
CAB-006
CAB-007
CAB-008
ICAB-001
ICAB-002
ICAB-003
ICAB-004
ICAB-005
ICAB-006
ICAB-007
ICAB-008
POW-002
POW-003
*/

-- NOTE: Question #11d
SELECT partnumber
FROM inventorypart
WHERE categoryid = 'CAB' MINUS
    SELECT partnumber
    FROM custorderline
        INNER JOIN custorder
        ON custorderline.orderid = custorder.orderid
    WHERE custorder.orderdate > TO_DATE ('12/31/2009', 'MM/DD/YYYY');
/* Q11d Query Results
PARTNUMBER
ADT-002
BRK-006
CAB-002
CAB-004
POW-001
*/

-- NOTE: Question #12a
SELECT custlastname AS firstname, custlastname AS lastname
FROM customer
WHERE state = 'FL' UNION
    SELECT firstname, lastname
    FROM employee
    ORDER BY firstname, lastname ASC;
/* Q12a Query Results
FIRSTNAME,LASTNAME
Allison,Roland
Austin,Ortman
Barrick,Barrick
Beth,Zobitz
Calie,Zollman
Charles,Jones
David,Deppe
David,Keck
Edna,Lilley
Emore,Emore
Gabrielle,Stevenson
Gary,German
Gregory,Hettinger
Gunderson,Gunderson
Jack,Brose
Jamie,Osman
Jason,Krasner
Jason,Wendling
Jim,Manaugh
Joanne,Rosner
Jones,Jones
Jordan,Jordan
Joseph,Platt
Kathleen,Xolo
Kathryn,Deagen
Kristen,Gustavel
Kristey,Moore
Laura,Rodgers
Manaugh,Manaugh
Mangus,Mangus
Meghan,Tyrie
Melissa,Alvarez
Michael,Abbott
Michelle,Nairn
Moore,Moore
Nicholas,Albregts
Patricha,Underwood
Paul,Eckelman
Phil,Reece
Reece,Reece
Reeder,Reeder
Rita,Bush
Roland,Roland
Ronald,Day
Ryan,Stahley
Sherman,Cheswick
Stahley,Stahley
Steve,Cochran
Steve,Hess
Steven,Hickman
Tina,Yates
Todd,Vigus
*/

-- NOTE: Question #12b
SELECT custlastname AS firstname, custlastname AS lastname
FROM customer
WHERE state = 'FL' UNION ALL
    SELECT firstname, lastname
    FROM employee
    ORDER BY firstname, lastname ASC;
/* Q12b Query Results
FIRSTNAME,LASTNAME
Allison,Roland
Austin,Ortman
Barrick,Barrick
Beth,Zobitz
Calie,Zollman
Charles,Jones
David,Deppe
David,Keck
Edna,Lilley
Emore,Emore
Gabrielle,Stevenson
Gary,German
Gregory,Hettinger
Gunderson,Gunderson
Jack,Brose
Jamie,Osman
Jason,Krasner
Jason,Wendling
Jim,Manaugh
Joanne,Rosner
Jones,Jones
Jordan,Jordan
Joseph,Platt
Kathleen,Xolo
Kathryn,Deagen
Kristen,Gustavel
Kristey,Moore
Laura,Rodgers
Manaugh,Manaugh
Mangus,Mangus
Meghan,Tyrie
Melissa,Alvarez
Michael,Abbott
Michelle,Nairn
Moore,Moore
Nicholas,Albregts
Patricha,Underwood
Paul,Eckelman
Phil,Reece
Reece,Reece
Reeder,Reeder
Rita,Bush
Roland,Roland
Ronald,Day
Ryan,Stahley
Sherman,Cheswick
Stahley,Stahley
Steve,Cochran
Steve,Hess
Steven,Hickman
Tina,Yates
Todd,Vigus
*/

-- NOTE: Question #13a
SELECT customer.custfirstname || ' ' || customer.custlastname || ', residential', customer.customerid, custorder.orderid, custorder.orderdate
FROM customer
    FULL OUTER JOIN custorder
    ON customer.customerid = custorder.customerid
WHERE customer.state = 'PA'
    AND customer.companyname IS NULL UNION
    SELECT customer.custfirstname || ' ' || customer.custlastname || ', ' || customer.companyname, customer.customerid, custorder.orderid, custorder.orderdate
    FROM customer
        FULL OUTER JOIN custorder
        ON customer.customerid = custorder.customerid
    WHERE customer.state = 'PA'
        AND customer.companyname IS NOT NULL;
/* Q13a Query Results
CUSTOMER.CUSTFIRSTNAME||''||CUSTOMER.CUSTLASTNAME||',RESIDENTIAL',CUSTOMERID,ORDERID,ORDERDATE
Don Kaleta, residential,I-300028,,
George Purcell, BMA Advertising Design,C-300006,2000000050,26-JUL-10
George Purcell, BMA Advertising Design,C-300006,2000000083,10-AUG-10
George Purcell, BMA Advertising Design,C-300006,2000000110,20-AUG-10
George Purcell, BMA Advertising Design,C-300006,2000000130,27-AUG-10
George Purcell, BMA Advertising Design,C-300006,2000000355,01-DEC-10
George Purcell, BMA Advertising Design,C-300006,2001000643,17-FEB-11
George Purcell, BMA Advertising Design,C-300006,2001000729,07-MAR-11
Mildred Jones, Computer Consultants,C-300040,2000000012,06-JUL-10
Mildred Jones, Computer Consultants,C-300040,2000000284,02-NOV-10
Mildred Jones, Computer Consultants,C-300040,2001000721,03-MAR-11
Mildred Jones, Computer Consultants,C-300040,2001000782,23-MAR-11
Scott Gray, Security Installation,C-300062,2000000361,01-DEC-10
Scott Gray, Security Installation,C-300062,2000000421,10-DEC-10
Scott Gray, Security Installation,C-300062,2000000440,14-DEC-10
Scott Gray, Security Installation,C-300062,2000000496,17-DEC-10
Thomas Wolfe, residential,I-300149,2000000497,17-DEC-10
Thomas Wolfe, residential,I-300149,2001000670,23-FEB-11
Thomas Wolfe, residential,I-300149,2001000736,08-MAR-11
Thomas Wolfe, residential,I-300149,2001000751,13-MAR-11
Thomas Wolfe, residential,I-300149,2001000768,20-MAR-11
*/

-- NOTE: Question #13b
SELECT customer.custfirstname || ' ' || customer.custlastname || ', ' || nvl (customer.companyname, 'residential') , customer.customerid, custorder.orderid, custorder.orderdate
FROM customer
    FULL OUTER JOIN custorder
    ON customer.customerid = custorder.customerid
WHERE customer.state = 'PA';
/* Q13b Query Results
CUSTOMER.CUSTFIRSTNAME||''||CUSTOMER.CUSTLASTNAME||','||NVL(CUSTOMER.COMPANYNAME,'RESIDENTIAL'),CUSTOMERID,ORDERID,ORDERDATE
Scott Gray, Security Installation,C-300062,2000000421,10-DEC-10
Scott Gray, Security Installation,C-300062,2000000440,14-DEC-10
Scott Gray, Security Installation,C-300062,2000000496,17-DEC-10
Thomas Wolfe, residential,I-300149,2000000497,17-DEC-10
George Purcell, BMA Advertising Design,C-300006,2001000643,17-FEB-11
Thomas Wolfe, residential,I-300149,2001000670,23-FEB-11
Mildred Jones, Computer Consultants,C-300040,2001000721,03-MAR-11
George Purcell, BMA Advertising Design,C-300006,2001000729,07-MAR-11
Thomas Wolfe, residential,I-300149,2001000736,08-MAR-11
Thomas Wolfe, residential,I-300149,2001000751,13-MAR-11
Thomas Wolfe, residential,I-300149,2001000768,20-MAR-11
Mildred Jones, Computer Consultants,C-300040,2001000782,23-MAR-11
Mildred Jones, Computer Consultants,C-300040,2000000012,06-JUL-10
George Purcell, BMA Advertising Design,C-300006,2000000050,26-JUL-10
George Purcell, BMA Advertising Design,C-300006,2000000083,10-AUG-10
George Purcell, BMA Advertising Design,C-300006,2000000110,20-AUG-10
George Purcell, BMA Advertising Design,C-300006,2000000130,27-AUG-10
Mildred Jones, Computer Consultants,C-300040,2000000284,02-NOV-10
George Purcell, BMA Advertising Design,C-300006,2000000355,01-DEC-10
Scott Gray, Security Installation,C-300062,2000000361,01-DEC-10
Don Kaleta, residential,I-300028,,
*/

-- NOTE: Question #14a
CREATE TABLE lab2_contact AS
    SELECT custfirstname, last.custlastname, loc.city, loc.state
    FROM customer cross
        JOIN (
            SELECT custlastname
            FROM customer
        ) last CROSS JOIN (
            SELECT city, state
            FROM customer
        ) loc;
-- NOTE: Question #14b
SELECT COUNT ( * )
FROM lab2_contact;
SELECT COUNT (DISTINCT custfirstname) , COUNT (DISTINCT custlastname) , COUNT (DISTINCT city) , COUNT (DISTINCT state)
FROM lab2_contact;
/* Q14b Query Results
COUNT(*)
12326391

COUNT(DISTINCTCUSTFIRSTNAME),COUNT(DISTINCTCUSTLASTNAME),COUNT(DISTINCTCITY),COUNT(DISTINCTSTATE)
161,220,224,50
*/