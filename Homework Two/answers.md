# Answers
These are my answers to HW 2 for CNIT 372

## QA.1
The paramemter is name_in and it is a varchar2 (string). The result would be 99999 if the course number does not exist.

## QA.2
The paramemter is name_in and it is a varchar2 (string). Assuming that the input is valid it adds the course name and number into the student_courses table.

## QC.1
The Eagle company has given you access to a copy of their database in order to have you write some special procedures for data access and automation. 

## QC.2
Write a procedure to find the total amount of money spent by a given company.

## QC.3
- customer_copy
- custorder_copy
- custorderline_copy

### Table Specifications:
| customerid | companyname | custfirstname | custlastname | custtitle | address             | city      | state | postalcode | phone        | fax | emailaddr        |
| ---------- | ----------- | ------------- | ------------ | --------- | ------------------- | --------- | ----- | ---------- | ------------ | --- | ---------------- |
| I-300051	 |             | Lynne         | Lagunes      |Ms.	      | 2820 Beechmont Ave. | Pocatello | ID    | 83209      | 208-502-9976 |     |hello@zeronet.net |

| orderid    | customerid | orderdate | requireddate |
| ---------- | ---------- | --------- | ------------ |
| 2000000381 | C-300064	  | 06-DEC-10 | 09-DEC-10    |

| orderid    | partnumber | unitprice | orderquantity | discount | status  |
| ---------- | ---------- | --------- | ------------- | -------- | ------- |
| 2000000110 | MON-008    | 139.99	  | 12	          | 10	     | SHIPPED |

### Query for create and populate the example table:
```sql
CREATE TABLE custorder_copy AS
    SELECT *
    FROM custorder;

CREATE TABLE custorderline_copy AS
    SELECT *
    FROM custorderline;
```

## QC.4
Step 1: Using the customer table, find every customerid related to the company **Baker and Company**.

Step 2: Using the previous query, make a query to find all the orderids for the company **Baker and Company**.

Step 3: Using the previous query, find the total price of all orders for the given company.

Step 4: Take the last three steps and put them into a PLSQL procedure called **FindCompanyTotal** where the company name and result are parameters.

## QC.5
Step 1:
```sql
SELECT customerid
FROM customer_copy
WHERE companyname = 'Baker and Company';

/*
CUSTOMERID	COMPANYNAME
C-300001	Baker and Company
*/
```

Step 2:
```sql
SELECT orderid
FROM custorder_copy
WHERE customerid IN (
        SELECT customerid
        FROM customer_copy
        WHERE companyname = 'Baker and Company'
    );

/*
ORDERID
2001000563
2001000681
2001000741
2000000019
2000000032
2000000093
2000000365
*/
```

Step 3:
```sql
SELECT sum(unitprice * orderquantity * discount)
FROM custorderline_copy
WHERE orderid IN (
        SELECT orderid
        FROM custorder_copy
        WHERE customerid IN (
                SELECT customerid
                FROM customer_copy
                WHERE companyname = 'Baker and Company'
            )
    );

/*
SUM(UNITPRICE*ORDERQUANTITY*DISCOUNT)
694193.37
*/
```

Step 4:
```sql
CREATE OR REPLACE PROCEDURE findcompanytotal (
    company_name IN customer_copy.companyname%type, company_total OUT NUMBER
) AS
BEGIN
    SELECT SUM (unitprice * orderquantity * discount) INTO company_total
    FROM custorderline_copy
    WHERE orderid IN (
            SELECT orderid
            FROM custorder_copy
            WHERE customerid IN (
                    SELECT customerid
                    FROM customer_copy
                    WHERE companyname = company_name
                )
        );
END findcompanytotal;
```
