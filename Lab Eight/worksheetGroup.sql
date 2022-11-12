/*
CNIT372 Lab Section #4
Estimated Time Spent: 1hr
Late hours used: 0

Group #5
Partner #1: Soomin Kim
Partner #2: Ethan Zeronik
*/

-- defaults to on
SET verify off;
/**/

-- NOTE: Question #b1
CREATE VIEW supervisor AS
    SELECT supervisor AS supervisorid, COUNT (employeeid) AS numemployees
    FROM employee
    WHERE supervisor IS NOT NULL
    GROUP BY supervisor;
/
/* Question #b1 Query Results
View SUPERVISOR created.
*/

-- NOTE: Question #b2
GRANT READ ON supervisor TO ezeronik;
/
/* Question #b2 Query Results
Grant succeeded.
*/

-- NOTE: Question #b3
SELECT *
FROM kim2379.supervisor;
/
/* Question #b3 Query Results
SUPERVISORID	NUMEMPLOYEES
100200	2
100559	5
100104	3
100944	5
100365	3
100127	2
100125	3
100206	1
100650	2
100330	2
100209	4
100001	2
100103	2
100880	3
*/

-- NOTE: Question #b4
INSERT INTO employee (
    employeeid, lastname, firstname, supervisor
) VALUES (
    '100000', 'Bond', 'James', '100000'
)
/
/* Question #b4 Query Results
1 row inserted.
*/

-- NOTE: Question #b5
SELECT *
FROM supervisor;
/
/* Question #b5 Query Results
SUPERVISORID	NUMEMPLOYEES
100000	1
100200	2
100559	5
100104	3
100944	5
100365	3
100127	2
100125	3
100206	1
100650	2
100330	2
100209	4
100001	2
100103	2
100880	3
*/

-- NOTE: Question #b6
SELECT *
FROM kim2379.supervisor;
/
/* Question #b6 Query Results
I do not see the change because the update has not been commited

SUPERVISORID	NUMEMPLOYEES
100200	2
100559	5
100104	3
100944	5
100365	3
100127	2
100125	3
100206	1
100650	2
100330	2
100209	4
100001	2
100103	2
100880	3
*/

-- NOTE: Question #b7
COMMIT;
/
/* Question #b7 Query Results
I see the new employee because I put new employee in my view and I have a privilege on my view


Commit complete.
*/

-- NOTE: Question #b8
SELECT *
FROM kim2379.supervisor;
/
/* Question #b8 Query Results
It works because now the change has been committed

SUPERVISORID	NUMEMPLOYEES
100000	1
100200	2
100559	5
100104	3
100944	5
100365	3
100127	2
100125	3
100206	1
100650	2
100330	2
100209	4
100001	2
100103	2
100880	3
*/

-- NOTE: Question #b9
DELETE FROM employee
WHERE
    supervisor = '100000';
/
/* Question #b9 Query Results
1 row deleted.
*/

-- NOTE: Question #b10
SELECT *
FROM supervisor;
/* Question #b10 Query Results
SUPERVISORID	NUMEMPLOYEES
100200	2
100559	5
100104	3
100944	5
100365	3
100127	2
100125	3
100206	1
100650	2
100330	2
100209	4
100001	2
100103	2
100880	3
*/

-- NOTE: Question #b11
SELECT *
FROM kim2379.supervisor;
/
/* Question #b11 Query Results
Yes I still see it because my partner has not commited the change yet

SUPERVISORID	NUMEMPLOYEES
100000	1
100200	2
100559	5
100104	3
100944	5
100365	3
100127	2
100125	3
100206	1
100650	2
100330	2
100209	4
100001	2
100103	2
100880	3
*/

-- NOTE: Question #b12
REVOKE READ ON supervisor FROM ezeronik;
/
/* Question #b12 Query Results
Revoke succeeded.
*/

-- NOTE: Question #b13
SELECT *
FROM kim2379.supervisor;
/
/* Question #b13 Query Results
I get the error because I have had my permission removed, but it is misleading as it implies the view was deleted

FROM kim2379.supervisor
              *
ERROR at line 157:
ORA-00942: table or view does not exist
*/

-- NOTE: Question #b14
DROP VIEW supervisor;
/
/* Question #b14 Query Results
View SUPERVISOR dropped.
*/

-- NOTE: Question #b15
/*
The permission required is CREATE MATERIALIZED VIEW
We are lacking the permission for materialized views because they can potentially cause performance issues
*/

-- NOTE: Question #b16
/*
The permission required is CREATE ROLE
We are lacking this because students are not admins and this is a security issue
*/