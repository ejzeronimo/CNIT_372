CREATE TABLE cust_audit (
    transaction VARCHAR2 (6),
    numrows INTEGER,
    "timestamp" timestamp,
    userid VARCHAR2 (16),
    description VARCHAR2 (100),
    CONSTRAINT foreign_key_userid FOREIGN KEY (userid) REFERENCES user (userid)
    CONSTRAINT check_transaction CHECK (transaction IN ('select', 'update', 'delete', 'insert'))
);
--

DROP TABLE custorder_copy;
CREATE TABLE custorder_copy AS
    SELECT *
    FROM custorder;
--

DROP TABLE order_audit_copy;
CREATE TABLE order_audit_copy (
    transaction VARCHAR2 (6) CHECK (transaction IN ('select', 'update', 'delete', 'insert') ),
    "timestamp" timestamp,
    orderid VARCHAR2 (20)
);
--

CREATE OR REPLACE TRIGGER trig_order_created AFTER
    INSERT ON custorder_copy FOR EACH ROW
BEGIN
    dbms_output.put_line ('we did it!');
END;
--

CREATE OR REPLACE TRIGGER trig_order_created AFTER 
    INSERT ON custorder_copy FOR EACH ROW 
BEGIN
    IF inserting THEN
        dbms_output.put_line ('Inserted');
    END IF;
END;
--

CREATE OR REPLACE TRIGGER trig_order_created AFTER 
    INSERT ON custorder_copy FOR EACH ROW 
BEGIN
    IF inserting THEN
        dbms_output.put_line ('Inserted');
        dbms_output.put_line (:new.orderid);
    END IF;
END;
--

CREATE OR REPLACE TRIGGER trig_order_created AFTER
    INSERT ON custorder_copy FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO order_audit_copy VALUES (
            'insert', systimestamp, :new.orderid
        );
    END IF;
END;
--

INSERT INTO custorder_copy VALUES (
    '2000000785', 'C-200987', sysdate, sysdate
)

SELECT *
    FROM order_audit_copy;