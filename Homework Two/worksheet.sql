CREATE TABLE customer_copy AS
    SELECT *
    FROM customer;
CREATE TABLE custorder_copy AS
    SELECT *
    FROM custorder;
CREATE TABLE custorderline_copy AS
    SELECT *
    FROM custorderline;
--

SELECT customerid
FROM customer_copy
WHERE companyname = 'Baker and Company';
--


SELECT orderid
FROM custorder_copy
WHERE customerid IN (
        SELECT customerid
        FROM customer_copy
        WHERE companyname = 'Baker and Company'
    );
--

SELECT SUM (unitprice * orderquantity * discount)
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
--

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
/
--
DECLARE
    foo NUMBER;
BEGIN
    findcompanytotal ('Baker and Company', foo);
    dbms_output.put_line (foo);
END;