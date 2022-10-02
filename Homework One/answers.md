# Answers
These are my answers to HW 1 for CNIT 372

## QA.1
10
5
10

## QA.2
It will result in a scope error before it ever prints.

## QC.1 Problem Background
John is running an online business program. One of his daily tasks is to figure out his daily revenue.

## QC.2 Overall Problem 
What is John's average amount of money made?

## QC.3 Example Table

### Table Name: 
- subscriptions

### Table Specification:
| subscriptionid | customerid | renewdate | price |
| -------------- | ---------- | --------- | ----- |
| 5 	           | C-300001	  | 01-JUL-10	| 47.9  |
| 5 	           | C-300002	  | 01-JUL-10	| 47.9  |
| 5 	           | C-300005	  | 01-JUL-10	| 47.9  |
| 5 	           | C-300002	  | 01-JUL-10	| 49.98 |
| 5 	           | C-300002	  | 02-JUL-10	| 23.8  |

### Query for create and populate the example table:
```sql
CREATE TABLE subscriptions (
    subscriptionid int,
    customerid VARCHAR2(10),
    renewdate DATE,
    price NUMBER(9,2)
);

INSERT INTO subscriptions
SELECT * FROM (
    (SELECT DISTINCT packagenumber AS subscriptionid FROM packingslip FETCH FIRST 5 ROWS ONLY) 
    CROSS JOIN 
    (SELECT DISTINCT customerid FROM customer FETCH FIRST 5 ROWS ONLY) 
    CROSS JOIN 
    (SELECT DISTINCT orderdate AS renewdate FROM custorder FETCH FIRST 5 ROWS ONLY)
    CROSS JOIN
    (SELECT DISTINCT unitcost AS price FROM suppliedpart FETCH FIRST 5 ROWS ONLY)
); 
```

## QC.4 Key steps to solve the overall problem
Step 1: Find the subscriptions by date. Group all subscriptions by the date they were renewed.

Step 2: Using the previous query, make a query to find the sum of all the subscriptions by renew date.

Step 3: Using this information make a PLSQL function that returns the average amount of money made on each renew date.

## QC.5 Answers to each step
Step 1:
```sql
SELECT renewdate, COUNT(*)
FROM subscriptions
GROUP BY renewdate;

/*
RENEWDATE	COUNT(*)
02-JUL-10	125
06-JUL-10	125
07-JUL-10	125
01-JUL-10	125
05-JUL-10	125
*/
```

Step 2:
```sql
SELECT renewdate, sum(price)
FROM subscriptions
GROUP BY renewdate;

/*
RENEWDATE	SUM(PRICE)
02-JUL-10	5516.75
06-JUL-10	5516.75
07-JUL-10	5516.75
01-JUL-10	5516.75
05-JUL-10	5516.75
*/
```

Step 3:
```sql
DECLARE
    average NUMBER(9,2);
BEGIN
    SELECT SUM(price) / count( DISTINCT renewdate) INTO average
    FROM subscriptions;

    dbms_output.put_line('Average made on renew date is: $' || average);
END;
/

/*
Average made on renew date is: $5516.75
*/
```