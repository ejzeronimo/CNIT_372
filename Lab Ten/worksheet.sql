/*
Ethan Zeronik
CNIT372 Lab Section #4
Estimated Time Spent: ?hr
Late hours used: 0
*/

-- defaults to on
SET verify off;
/**/

-- NOTE: Question #1
CREATE TABLE airdb_all_info AS
    SELECT *
    FROM cnit372ta.airdb_all_info;
/* Question #1 Query Results
TABLE created.
*/

-- NOTE: Question #2
ALTER TABLE airdb_all_info MODIFY (origin_city_name CONSTRAINT no_null_cn NOT NULL, dest_city_name CONSTRAINT no_null_cn2 NOT NULL);
ALTER TABLE airdb_all_info MODIFY (origin_state_nm CONSTRAINT no_null_st NOT NULL, dest_state_nm CONSTRAINT no_null_st2 NOT NULL);
ALTER TABLE airdb_all_info ADD CONSTRAINT unique_combo UNIQUE (origin_airport_id, dest_airport_id, fl_num, carrier, fl_date);
/* Question #2 Query Results
TABLE altered.

TABLE altered.

TABLE altered.
*/

-- NOTE: Question #3
SELECT *
FROM user_constraints
WHERE table_name = 'AIRDB_ALL_INFO';
/* Question #3 Query Results
OWNER	CONSTRAINT_NAME	CONSTRAINT_TYPE	TABLE_NAME	SEARCH_CONDITION	SEARCH_CONDITION_VC	R_OWNER	R_CONSTRAINT_NAME	DELETE_RULE	STATUS	DEFERRABLE	DEFERRED	VALIDATED	GENERATED	BAD	RELY	LAST_CHANGE	INDEX_OWNER	INDEX_NAME	INVALID	VIEW_RELATED	ORIGIN_CON_ID
EZERONIK	NO_NULL	C	AIRDB_ALL_INFO	"ORIGIN_CITY_NAME" IS NOT NULL	"ORIGIN_CITY_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			03-DEC-22					0
EZERONIK	NO_NULL_ST	C	AIRDB_ALL_INFO	"ORIGIN_STATE_NM" IS NOT NULL	"ORIGIN_STATE_NM" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			03-DEC-22					0
EZERONIK	NO_NULL_ST2	C	AIRDB_ALL_INFO	"DEST_STATE_NM" IS NOT NULL	"DEST_STATE_NM" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			03-DEC-22					0
EZERONIK	UNIQUE_COMBO	U	AIRDB_ALL_INFO						ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	USER NAME			03-DEC-22	EZERONIK	UNIQUE_COMBO			0
*/

-- NOTE: Question #4
CREATE TABLE airdb_clone AS
    SELECT *
    FROM airdb_all_info;
/* Question #4 Query Results
TABLE created.
*/

-- NOTE: Question #5
SELECT *
FROM user_constraints
WHERE table_name = 'AIRDB_CLONE';
/* Question #5 Query Results
The unique constraint is missing

OWNER	CONSTRAINT_NAME	CONSTRAINT_TYPE	TABLE_NAME	SEARCH_CONDITION	SEARCH_CONDITION_VC	R_OWNER	R_CONSTRAINT_NAME	DELETE_RULE	STATUS	DEFERRABLE	DEFERRED	VALIDATED	GENERATED	BAD	RELY	LAST_CHANGE	INDEX_OWNER	INDEX_NAME	INVALID	VIEW_RELATED	ORIGIN_CON_ID
EZERONIK	SYS_C00488718	C	AIRDB_CLONE	"ORIGIN_CITY_NAME" IS NOT NULL	"ORIGIN_CITY_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			03-DEC-22					0
EZERONIK	SYS_C00488719	C	AIRDB_CLONE	"ORIGIN_STATE_NM" IS NOT NULL	"ORIGIN_STATE_NM" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			03-DEC-22					0
EZERONIK	SYS_C00488720	C	AIRDB_CLONE	"DEST_STATE_NM" IS NOT NULL	"DEST_STATE_NM" IS NOT NULL				ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			03-DEC-22					0
*/

-- NOTE: Question #6
ALTER TABLE airdb_clone ADD CONSTRAINT unique_combo_clone UNIQUE (origin_airport_id, dest_airport_id, fl_num, carrier, fl_date);
/* Question #6 Query Results
TABLE altered.
*/

-- NOTE: Question #7
CREATE TABLE airdb_airports (
    airport_id number, city_market_id number, airport_code VARCHAR2 (3) PRIMARY KEY, city_name VARCHAR2 (30) , state_abr VARCHAR (2) , state_fips number, state_name VARCHAR2 (30)
);
/* Question #7 Query Results
TABLE created.
*/

-- NOTE: Question #8
INSERT INTO airdb_airports
    SELECT origin_airport_id, origin_city_market_id, origin, origin_city_name, origin_state_abr, origin_state_fips, origin_state_nm
    FROM airdb_all_info UNION ALL
        SELECT dest_airport_id, dest_city_market_id, dest, dest_city_name, dest_state_abr, dest_state_fips, dest_state_nm
        FROM airdb_all_info;
INSERT INTO airdb_airports
    SELECT origin_airport_id, origin_city_market_id, origin, origin_city_name, origin_state_abr, origin_state_fips, origin_state_nm
    FROM airdb_all_info UNION
        SELECT dest_airport_id, dest_city_market_id, dest, dest_city_name, dest_state_abr, dest_state_fips, dest_state_nm
        FROM airdb_all_info;
/* Question #8 Query Results
ERROR at line 86:
ORA-00001: unique constraint (EZERONIK.SYS_C00488722) violated

294 rows created.
*/

-- NOTE: Question #9
ALTER TABLE airdb_clone ADD CONSTRAINT con_fk FOREIGN KEY (origin) REFERENCES airdb_airports (airport_code);
ALTER TABLE airdb_clone ADD CONSTRAINT con_fk2 FOREIGN KEY (dest) REFERENCES airdb_airports (airport_code);
/* Question #9 Query Results
TABLE altered.

TABLE altered.
*/

-- NOTE: Question #10
ALTER TABLE airdb_clone DROP (origin_city_market_id, origin_state_fips, dest_city_market_id, dest_state_fips);
/* Question #10 Query Results
TABLE altered.
*/

-- NOTE: Question #11
ALTER TABLE airdb_airports ADD CONSTRAINT con_check CHECK (state_abr IN ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY') );
/* Question #11 Query Results
There is data that must not comply with the check

ERROR at line 119:
ORA-02293: cannot validate (EZERONIK.CON_CHECK) - check constraint violated
*/

-- NOTE: Question #12
ALTER TABLE airdb_airports DISABLE CONSTRAINT con_check;
SELECT *
FROM user_constraints
WHERE table_name = 'AIRDB_AIRPORTS';
/* Question #12 Query Results
TABLE altered.

OWNER	CONSTRAINT_NAME	CONSTRAINT_TYPE	TABLE_NAME	SEARCH_CONDITION	SEARCH_CONDITION_VC	R_OWNER	R_CONSTRAINT_NAME	DELETE_RULE	STATUS	DEFERRABLE	DEFERRED	VALIDATED	GENERATED	BAD	RELY	LAST_CHANGE	INDEX_OWNER	INDEX_NAME	INVALID	VIEW_RELATED	ORIGIN_CON_ID
EZERONIK	CON_CHECK	C	AIRDB_AIRPORTS	state_abr in ( 'AL', 'AK', 'AS', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FM', 'FL', 'GA', 'GU', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MH', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'MP', 'OH', 'OK', 'OR', 'PW', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VI', 'VA', 'WA', 'WV', 'WI', 'WY' )	state_abr in ( 'AL', 'AK', 'AS', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FM', 'FL', 'GA', 'GU', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MH', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'MP', 'OH', 'OK', 'OR', 'PW', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VI', 'VA', 'WA', 'WV', 'WI', 'WY' )				DISABLED	NOT DEFERRABLE	IMMEDIATE	NOT VALIDATED	USER NAME			03-DEC-22					0
EZERONIK	SYS_C00488722	P	AIRDB_AIRPORTS						ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			03-DEC-22	EZERONIK	SYS_C00488722			0
*/

-- NOTE: Question #13
DELETE FROM airdb_airports
WHERE
    state_abr NOT IN ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY');
/* Question #13 Query Results
There is an error because a constraint on another table is being broken

ERROR at line 142:
ORA-02292: integrity constraint (EZERONIK.CON_FK2) violated - child record found
*/

-- NOTE: Question #14
ALTER TABLE airdb_clone DROP CONSTRAINT con_fk2;
ALTER TABLE airdb_clone ADD CONSTRAINT con_fk2 FOREIGN KEY (dest) REFERENCES airdb_airports (airport_code) ON DELETE SET NULL;
/* Question #14 Query Results
TABLE altered.

TABLE altered.
*/

-- NOTE: Question #15
ALTER TABLE airdb_clone DROP CONSTRAINT con_fk;
ALTER TABLE airdb_clone ADD CONSTRAINT con_fk FOREIGN KEY (origin) REFERENCES airdb_airports (airport_code) ON DELETE CASCADE;
/* Question #15 Query Results
TABLE altered.

TABLE altered.
*/

-- NOTE: Question #16
DELETE FROM airdb_airports
WHERE
    state_abr NOT IN ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY');
/* Question #16 Query Results
It works now because the constraints know what to do when a constraint fails

5 rows deleted.
*/

-- NOTE: Question #17
ALTER TABLE airdb_airports ENABLE CONSTRAINT con_check;
/* Question #17 Query Results
It works because the conflicts have been removed
*/

-- NOTE: Question #18
SELECT COUNT ( * )
FROM airdb_clone
WHERE dest_airport_id IS NULL;
SELECT COUNT ( * )
FROM airdb_clone
WHERE origin_airport_id IS NULL;
SELECT COUNT ( * )
FROM airdb_all_info
WHERE dest_airport_id IS NULL;
SELECT COUNT ( * )
FROM airdb_all_info
WHERE origin_airport_id IS NULL;
/* Question #18 Query Results
Cascade constraints makes more sense for this database

COUNT(*)
0
COUNT(*)
0

COUNT(*)
0
COUNT(*)
0
*/

-- NOTE: Question #19
ALTER TABLE airdb_airports MODIFY (airport_code CONSTRAINT no_null_ac UNIQUE NOT NULL);
/* Question #19 Query Results
Table Altered.
*/

-- NOTE: Question #20
ALTER TABLE airdb_airports MODIFY (city_name CONSTRAINT no_null_cn UNIQUE);
/* Question #20 Query Results
It failed because there are duplicates

ERROR at line 221:
ORA-02299: cannot validate (EZERONIK.NO_NULL_CN) - duplicate keys found
*/

-- NOTE: Question #21
DROP TABLE airdb_all_info CASCADE CONSTRAINTS;
DROP TABLE airdb_clone CASCADE CONSTRAINTS;
DROP TABLE airdb_airports CASCADE CONSTRAINTS;
/* Question #21 Query Results
TABLE dropped.

TABLE dropped.

TABLE dropped.
*/