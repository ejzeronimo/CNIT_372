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

SELECT DISTINCT * FROM subscriptions FETCH FIRST 5 ROWS ONLY;

DROP TABLE subscriptions;

/*
Step 1: Find the subscriptions by date. Group all subscriptions by the date they were renewed.

Step 2: Using the previous query, make a query to find the sum of all the subscriptions by renew date.

Step 3: Using this information make a PLSQL function that returns the average amount of money made on each renew date.
*/

SELECT renewdate, COUNT(*)
FROM subscriptions
GROUP BY renewdate;

SELECT renewdate, SUM(price)
FROM subscriptions
GROUP BY renewdate;

SELECT SUM(price) / count( DISTINCT renewdate)
FROM subscriptions;

DECLARE
    average NUMBER(9,2);
BEGIN
    SELECT SUM(price) / count( DISTINCT renewdate) INTO average
    FROM subscriptions;

    dbms_output.put_line('Average made on renew date is: $' || average);
END;
/