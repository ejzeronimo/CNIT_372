/*
Ethan Zeronik
CNIT372 Lab #1
Estimated Time Spent: hrs
Late hours used: 0
*/

-- NOTE: Question #1
/* 
5. SELECT NAME, COUNT(*), AVG(RATING)
1. FROM BOOKSHELF
2. WHERE RATING>1
3. GROUP BY CATEGORY_NAME
4. HAVING CATEGORY_NAME LIKE ‘A%’
6. ORDER BY COUNT(*);
*/

-- NOTE: Question #2
SELECT DISTINCT SUBSTR(phone,0,3) AS areaCode
FROM customer
WHERE state = 'CO';

/* Q2 Query Results
AREACODE
719
970
728
720
644
*/

-- NOTE: Question #3
SELECT SUBSTR(phone,0,3) AS areaCode, COUNT(*)
FROM customer
WHERE state = 'CO'
GROUP BY SUBSTR(phone,0,3)
ORDER BY COUNT(*) DESC;

/* Q3 Query Results
AREACODE,COUNT(*)
719,4
970,2
728,1
720,1
644,1
*/

-- NOTE: Question #4
SELECT SUBSTR(phone,0,3) AS areaCode
FROM customer
WHERE state = 'CO'
GROUP BY SUBSTR(phone,0,3)
HAVING COUNT(*) = 
(
    SELECT MAX(COUNT(*)) 
    FROM customer
    WHERE state = 'CO'
    GROUP BY SUBSTR(phone,0,3)
);

/* Q4 Query Results
AREACODE
719
*/

-- NOTE: Question #5
SELECT custlastname || ',' || custfirstname AS name, city, state, phone
FROM customer
WHERE state = 'CO' 
AND SUBSTR(phone,0,3) = (
    SELECT SUBSTR(phone,0,3) AS areaCode
    FROM customer
    WHERE state = 'CO'
    GROUP BY SUBSTR(phone,0,3)
    HAVING COUNT(*) = 
    (
        SELECT MAX(COUNT(*)) 
        FROM customer
        WHERE state = 'CO'
        GROUP BY SUBSTR(phone,0,3)
    )
);

/* Q5 Query Results
NAME,CITY,STATE,PHONE
Rodkey,Daniel,Lamar,CO,719-748-3205
Kaakeh,Paul,Gunnison,CO,719-750-4539
Smith,Matt,Montrose,CO,719-822-8828
Rice,Paul,Craig,CO,719-541-1837
*/

-- NOTE: Question #6
/*
We might want to know the most populus area code so that we can target that area with ads or expand infrastructure.
*/

-- NOTE: Question #7
SELECT customerid, COUNT(*)
FROM custorder
WHERE orderdate LIKE '%AUG-10'
GROUP BY customerid;

/* Q7 Query Results
CUSTOMERID,COUNT(*)
I-300070,1
C-300017,1
C-300055,2
I-300016,2
C-300041,2
I-300031,1
I-300126,1
C-300001,1
I-300091,1
I-300020,1
C-300011,1
I-300069,1
C-300033,1
I-300024,1
I-300117,1
C-300002,1
C-300031,2
I-300132,1
I-300005,1
C-300010,1
I-300122,1
C-300013,1
C-300053,1
C-300006,3
I-300068,1
C-300020,1
I-300096,1
I-300120,1
I-300112,1
I-300115,1
I-300014,2
I-300076,1
C-300035,1
I-300012,1
I-300095,1
I-300017,1
I-300010,2
I-300026,1
I-300042,1
I-300097,1
I-300093,1
I-300102,1
I-300007,1
I-300138,1
I-300043,1
I-300108,1
I-300044,1
I-300110,1
C-300051,1
I-300009,1
C-300004,1
C-300005,2
C-300027,2
C-300026,1
C-300003,1
I-300004,1
I-300025,1
I-300129,1
I-300002,1
I-300011,1
I-300015,2
I-300081,1
I-300088,1
I-300013,1
I-300061,1
I-300018,1
*/

-- NOTE: Question #8
SELECT MAX(COUNT(*))
FROM custorder
WHERE orderdate LIKE '%AUG-10'
GROUP BY customerid;

/* Q8 Query Results
MAX(COUNT(*))
3
*/

-- NOTE: Question #9
SELECT customerid, COUNT(*)
FROM custorder
WHERE orderdate LIKE '%AUG-10'
GROUP BY customerid
HAVING COUNT(*) = 
    (
        SELECT MAX(COUNT(*))
        FROM custorder
        WHERE orderdate LIKE '%AUG-10'
        GROUP BY customerid
    );

/* Q9 Query Results
CUSTOMERID,COUNT(*)
C-300006,3
*/

-- NOTE: Question #10
SELECT customerid, COUNT(*)
FROM custorder
WHERE orderdate LIKE '%AUG-10'
GROUP BY customerid
HAVING COUNT(*) > 
    (
        SELECT AVG(COUNT(*))
        FROM custorder
        WHERE orderdate LIKE '%AUG-10'
        GROUP BY customerid
    )
ORDER BY COUNT(*) DESC;

/* Q10 Query Results
CUSTOMERID,COUNT(*)
C-300006,3
I-300016,2
C-300041,2
C-300031,2
I-300015,2
C-300055,2
I-300010,2
C-300005,2
C-300027,2
I-300014,2
*/

-- NOTE: Question #11
SELECT customerid, COUNT(*)
FROM custorder
WHERE orderdate LIKE '%AUG-10'
GROUP BY customerid
HAVING COUNT(*) < 
    (
        SELECT AVG(COUNT(*))
        FROM custorder
        WHERE orderdate LIKE '%AUG-10'
        GROUP BY customerid
    )
ORDER BY COUNT(*) ASC;

/* Q11 Query Results
CUSTOMERID,COUNT(*)
I-300070,1
I-300018,1
I-300031,1
I-300126,1
C-300001,1
I-300091,1
I-300020,1
C-300011,1
I-300069,1
C-300033,1
I-300024,1
I-300117,1
C-300002,1
I-300132,1
I-300005,1
C-300010,1
I-300122,1
C-300013,1
C-300053,1
I-300068,1
C-300020,1
I-300096,1
I-300120,1
I-300112,1
I-300115,1
I-300076,1
C-300035,1
I-300012,1
I-300095,1
I-300017,1
I-300026,1
I-300042,1
I-300097,1
I-300093,1
I-300102,1
I-300007,1
I-300138,1
I-300043,1
I-300108,1
I-300044,1
I-300110,1
C-300051,1
I-300009,1
C-300004,1
C-300026,1
C-300003,1
I-300004,1
I-300025,1
I-300129,1
I-300002,1
I-300011,1
I-300081,1
I-300088,1
I-300013,1
I-300061,1
C-300017,1
*/

-- NOTE: Question #12
/*
A business might want to know this info to decide who gets promos or coupons. It is a good metric to figure out how is a loyal customer is to the website/product.
*/

-- NOTE: Question #13
SELECT custorder.customerid, customer.companyname, customer.custlastname || ', ' || customer.custfirstname AS name, TO_CHAR(custorder.orderdate , 'MM.DD.YYYY') AS "date"
FROM custorder
INNER JOIN customer
    ON custorder.customerid = customer.customerid
WHERE custorder.orderdate LIKE '%10'
AND customer.state = 'IN';

/* Q13 Query Results
CUSTOMERID,COMPANYNAME,NAME,date
I-300147,,Yaun,Steven,12.07.2010
C-300001,Baker and Company,Abbott,Gregory,07.08.2010
C-300001,Baker and Company,Abbott,Gregory,07.14.2010
C-300001,Baker and Company,Abbott,Gregory,08.13.2010
I-300030,,Quintero,Eric,09.15.2010
C-300014,R and R Air,Bending,Cathy,10.04.2010
C-300001,Baker and Company,Abbott,Gregory,12.02.2010
*/

-- NOTE: Question #14
SELECT custorder.customerid, customer.companyname, customer.custtitle || '. ' || SUBSTR(customer.custfirstname, 0 , 1) || '. ' || customer.custlastname  AS name, custorder.orderdate, custorder.requireddate
FROM custorder
INNER JOIN customer
    ON custorder.customerid = customer.customerid
WHERE custorder.customerid = 'C-300001'
ORDER BY custorder.orderdate DESC;

/* Q14 Query Results
CUSTOMERID,COMPANYNAME,NAME,ORDERDATE,REQUIREDDATE
C-300001,Baker and Company,Mr.. G. Abbott,10-MAR-11,15-MAR-11
C-300001,Baker and Company,Mr.. G. Abbott,24-FEB-11,03-MAR-11
C-300001,Baker and Company,Mr.. G. Abbott,27-JAN-11,03-FEB-11
C-300001,Baker and Company,Mr.. G. Abbott,02-DEC-10,08-DEC-10
C-300001,Baker and Company,Mr.. G. Abbott,13-AUG-10,20-AUG-10
C-300001,Baker and Company,Mr.. G. Abbott,14-JUL-10,15-JUL-10
C-300001,Baker and Company,Mr.. G. Abbott,08-JUL-10,12-JUL-10
*/

-- NOTE: Question #15
SELECT co.orderid, col.partnumber, ip.partdescription, col.unitprice, col.orderquantity, cat.categoryname
FROM custorder co
INNER JOIN custorderline col
    ON co.orderid = col.orderid
INNER JOIN inventorypart ip
    ON col.partnumber = ip.partnumber
INNER JOIN category cat
    ON ip.categoryid = cat.categoryid
WHERE ip.partdescription = 'BOARD GAMES'
ORDER BY col.orderquantity DESC

/* Q15 Query Results
ORDERID,PARTNUMBER,PARTDESCRIPTION,UNITPRICE,ORDERQUANTITY,CATEGORYNAME
2001000536,SFT-005,BOARD GAMES,9.99,15,Software
2000000050,SFT-005,BOARD GAMES,9.99,14,Software
2000000279,SFT-005,BOARD GAMES,9.99,10,Software
2000000426,SFT-005,BOARD GAMES,9.99,10,Software
2000000348,SFT-005,BOARD GAMES,9.99,2,Software
2000000139,SFT-005,BOARD GAMES,9.99,2,Software
2001000722,SFT-005,BOARD GAMES,9.99,1,Software
2000000206,SFT-005,BOARD GAMES,9.99,1,Software
2000000362,SFT-005,BOARD GAMES,9.99,1,Software
2000000005,SFT-005,BOARD GAMES,9.99,1,Software
2000000436,SFT-005,BOARD GAMES,9.99,1,Software
2001000600,SFT-005,BOARD GAMES,9.99,1,Software
2000000040,SFT-005,BOARD GAMES,9.99,1,Software
2000000011,SFT-005,BOARD GAMES,9.99,1,Software
*/

-- NOTE: Question #16
SELECT co.orderid, ip.partnumber, ip.partdescription, col.unitprice, col.orderquantity
FROM custorder co
INNER JOIN customer c
    ON co.customerid = c.customerid
INNER JOIN custorderline col
    ON co.orderid = col.orderid
INNER JOIN inventorypart ip
    ON col.partnumber = ip.partnumber
INNER JOIN category cat
    ON ip.categoryid = cat.categoryid
WHERE co.customerid = 'C-300001'
    AND co.orderdate = '14-JUL-10'
ORDER BY col.orderquantity DESC;

/* Q16 Query Results
ORDERID,PARTNUMBER,PARTDESCRIPTION,UNITPRICE,ORDERQUANTITY
2000000032,BRK-011,2ND PARALLEL PORT,5.99,20
2000000032,CTR-019,FLY XPST,1717.99,9
2000000032,ADT-003,EXTERNAL SCSI-3 MALE TERMINATOR,39.99,8
2000000032,SCN-002,SCANJET BUSINESS SERIES COLOR SCANNER,249,4
*/

-- NOTE: Question #17
SELECT TO_CHAR(co.orderdate , 'MM.DD.YYYY') AS "date", co.orderid, ip.partnumber, ip.partdescription, col.unitprice, col.orderquantity
FROM custorder co
INNER JOIN customer c
    ON co.customerid = c.customerid
INNER JOIN custorderline col
    ON co.orderid = col.orderid
INNER JOIN inventorypart ip
    ON col.partnumber = ip.partnumber
INNER JOIN category cat
    ON ip.categoryid = cat.categoryid
WHERE c.companyname = 'Bankruptcy Help'
    AND co.orderdate LIKE '%11'
ORDER BY co.orderdate DESC, col.orderquantity DESC;

/* Q17 Query Results
date,ORDERID,PARTNUMBER,PARTDESCRIPTION,UNITPRICE,ORDERQUANTITY
03.22.2011,2001000778,BRK-002,1X4 USB CABLE AND BRACKET,9.99,20
03.22.2011,2001000778,MEM-004,30.7GB HARD DRIVE,269.99,10
03.22.2011,2001000778,P-006,600 PENTIUM III PROCESSOR,339.99,6
02.28.2011,2001000699,MOD-002,112K DUAL MODEM,89.99,16
02.28.2011,2001000699,MEM-001,2MB FLASH BUFFER MEMORY,259.95,12
02.28.2011,2001000699,PRT-003,LASER JET 2500SE,699,3
02.24.2011,2001000676,MIC-009,WHEEL MOUSE,29.5,27
02.14.2011,2001000622,BB-004,SOCKET MINI BAREBONE,199.99,6
02.14.2011,2001000622,P-005,700 PENTIUM III PROCESSOR,399.99,4
*/

-- NOTE: Question #18
SELECT TO_CHAR(co.orderdate , 'MM.DD.YYYY') AS "date", co.orderid, ip.partnumber, ip.partdescription, (col.unitprice * col.orderquantity) AS lineItemTotal
FROM custorder co
INNER JOIN customer c
    ON co.customerid = c.customerid
INNER JOIN custorderline col
    ON co.orderid = col.orderid
INNER JOIN inventorypart ip
    ON col.partnumber = ip.partnumber
INNER JOIN category cat
    ON ip.categoryid = cat.categoryid
WHERE c.companyname = 'Bankruptcy Help'
    AND co.orderdate LIKE '%11'
ORDER BY co.orderdate DESC, col.orderquantity DESC;

/* Q18 Query Results
date,ORDERID,PARTNUMBER,PARTDESCRIPTION,LINEITEMTOTAL
03.22.2011,2001000778,BRK-002,1X4 USB CABLE AND BRACKET,199.8
03.22.2011,2001000778,MEM-004,30.7GB HARD DRIVE,2699.9
03.22.2011,2001000778,P-006,600 PENTIUM III PROCESSOR,2039.94
02.28.2011,2001000699,MOD-002,112K DUAL MODEM,1439.84
02.28.2011,2001000699,MEM-001,2MB FLASH BUFFER MEMORY,3119.4
02.28.2011,2001000699,PRT-003,LASER JET 2500SE,2097
02.24.2011,2001000676,MIC-009,WHEEL MOUSE,796.5
02.14.2011,2001000622,BB-004,SOCKET MINI BAREBONE,1199.94
02.14.2011,2001000622,P-005,700 PENTIUM III PROCESSOR,1599.96
*/

-- NOTE: Question #19
SELECT c.customerid, c.companyname, c.custlastname || ', ' || c.custfirstname AS "name", COUNT(co.orderid)
FROM customer c
INNER JOIN custorder co
    ON c.customerid = co.customerid
WHERE co.orderdate LIKE '%JAN-11'
AND c.state = 'IN'
GROUP BY c.customerid, c.companyname, c.custlastname, c.custfirstname
ORDER BY COUNT(co.orderid) ASC

/* Q19 Query Results
CUSTOMERID,COMPANYNAME,name,COUNT(CO.ORDERID)
C-300001,Baker and Company,Abbott, Gregory,1
C-300014,R and R Air,Bending, Cathy,1
I-300030,,Quintero, Eric,2
*/

-- NOTE: Question #20
SELECT cat.categoryname, ROUND(AVG(ip.stocklevel),2)
FROM category cat
INNER JOIN inventorypart ip
    ON cat.categoryid = ip.categoryid
GROUP BY cat.categoryname
ORDER BY AVG(ip.stocklevel) ASC

/* Q20 Query Results
CATEGORYNAME,ROUND(AVG(IP.STOCKLEVEL),2)
Computers,2.45
Accessories,9.21
Power,10.5
Storage,20.47
Basics,20.5
Processors,23.74
Software,33.89
Cables,35.86
*/

-- NOTE: Question #21
SELECT cat.categoryname || ': ' || cat.description as categorydetail, COUNT(ip.partnumber) 
FROM category cat
INNER JOIN inventorypart ip
    ON cat.categoryid = ip.categoryid
GROUP BY cat.categoryname, cat.description
ORDER BY COUNT(ip.partnumber) ASC

/* Q21 Query Results
CATEGORYDETAIL,COUNT(IP.PARTNUMBER)
Power: Power Supplies,4
Software: Games, maps,9
Accessories: Scanners, Printers, Modems,14
Processors: Athlon, Celeron, Pentium, Fans,19
Storage: CD-ROM, DVD, Hard Drives, Memory,19
Computers: Assembled Computers,29
Cables: Printer, Keyboard, Internal, SCSI, Connectors, Brackets,36
Basics: Casing, Barebone, Monitors, Keyboards, Mice,44
*/

-- NOTE: Question #22
SELECT MAX(ip.weight)
FROM inventorypart ip
INNER JOIN category cat
    ON ip.categoryid = cat.categoryid
WHERE cat.categoryname = 'Software'

/* Q22 Query Results
MAX(IP.WEIGHT)
0.438
*/

-- NOTE: Question #23
SELECT cat.categoryname, MAX(ip.weight)
FROM inventorypart ip
INNER JOIN category cat
    ON ip.categoryid = cat.categoryid
WHERE cat.categoryname IN ('Power','Software','Storage')
GROUP BY cat.categoryname
ORDER BY cat.categoryname ASC

/* Q23 Query Results
CATEGORYNAME,MAX(IP.WEIGHT)
Power,3
Software,0.438
Storage,4
*/

-- NOTE: Question #24
SELECT cat.categoryname, MAX(ip.weight), MAX(ip.partdescription)
FROM inventorypart ip
INNER JOIN category cat
    ON ip.categoryid = cat.categoryid
WHERE cat.categoryname IN ('Power','Software','Storage')
GROUP BY cat.categoryname
ORDER BY cat.categoryname ASC

/* Q24 Query Results
CATEGORYNAME,MAX(IP.WEIGHT),MAX(IP.PARTDESCRIPTION)
Power,3,300 WATT PS/2 POWER SUPPLY
Software,0.438,TRAVEL MAPS USA
Storage,4,ETHERNET FIBER OPTIC MINI-TRANSCEIVER
*/

-- NOTE: Question #25
/* 
I think that the join could be made a left join and there could be some optimization made to how the max value is found but for the most part this is okay.
*/