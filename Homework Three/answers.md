# Answers
These are my answers to HW 3 for CNIT 372

## QA.1
```sql
CREATE TABLE cust_audit (
    transaction VARCHAR2(6),
    numrows INTEGER,
    "timestamp" TIMESTAMP,
    userid VARCHAR2(16),
    description VARCHAR2(100),
    CONSTRAINT foreign_key_userid FOREIGN KEY (userid) REFERENCES user (userid)
    CONSTRAINT check_transaction CHECK (transaction IN ('select', 'update', 'delete', 'insert'))
);
```

## QA.2
It will fire after the selete statement but since select is not an update/delete event it will not fire.

## QC.1
The Eagle company has given you access to a copy of their database in order to have you write some special procedures for data access and automation. 

## QC.2
Create a trigger that will fire when and order is fulfilled and give some context data.

## QC.3
- custorder_copy
- order_audit_copy

### Table Specifications:
| orderid    | customerid | orderdate | requireddate |
| ---------- | ---------- | --------- | ------------ |
| 2000000381 | C-300064	  | 06-DEC-10 | 09-DEC-10    |

| transaction | timestamp | orderid    |
| ----------- | --------- | ---------- |
| 2000000381  | 06-DEC-10 | 2000000110 |

### Query for create and populate the example table:
```sql
CREATE TABLE custorder_copy AS
    SELECT *
    FROM custorder;

CREATE TABLE order_audit_copy (
    transaction VARCHAR2 (6) CHECK (transaction IN ('select', 'update', 'delete', 'insert') ),
    "timestamp" timestamp,
    orderid VARCHAR2 (20)
);
```

## QC.4
Step 1: Create a trigger called **trig_order_created** that will fire when a row is added to *custorder_copy*.

Step 2: Using the previous trigger, add the functionality that will to determine the type of CRUD action taken.

Step 3: Building on the updated trigger, get the order id of the created order.

Step 4: Make the trigger insert the timestamp of the action take, the type, and the order id into the *order_audit_copy* table.

Step 5: Test the trigger by adding a new order to the **custorder_copy* table.

## QC.5
Step 1:
```sql
CREATE OR REPLACE TRIGGER trig_order_created AFTER
    INSERT ON custorder_copy FOR EACH ROW
BEGIN
    dbms_output.put_line ('Hello World!');
END;
```

Step 2:
```sql
CREATE OR REPLACE TRIGGER trig_order_created AFTER 
    INSERT ON custorder_copy FOR EACH ROW 
BEGIN
    IF inserting THEN
        dbms_output.put_line('Inserted');
    END IF;
END;
```

Step 3:
```sql
CREATE OR REPLACE TRIGGER trig_order_created AFTER 
    INSERT ON custorder_copy FOR EACH ROW 
BEGIN
    IF inserting THEN
        dbms_output.put_line ('Inserted');
        dbms_output.put_line (:new.orderid);
    END IF;
END;
```

Step 4:
```sql
CREATE OR REPLACE TRIGGER trig_order_created AFTER
    INSERT ON custorder_copy FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO order_audit_copy VALUES (
            'insert', systimestamp, :new.orderid
        );
    END IF;
END;
```

Step 5:
```sql
INSERT INTO custorder_copy VALUES (
    '2000000785', 'C-200987', sysdate, sysdate
);

SELECT *
    FROM order_audit_copy;

/*
1 row inserted.


TRANSA timestamp                       ORDERID             
------ ------------------------------- --------------------
insert 27-NOV-22 08.35.47.876113000 PM 2000000785 
*/
```
