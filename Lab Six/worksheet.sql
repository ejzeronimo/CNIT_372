/*
Ethan Zeronik
CNIT372 Lab Section #4
Estimated Time Spent: 1.5hrs
Late hours used: 0
*/

-- defaults to on
SET verify off;
/**/

-- NOTE: Question #1
CREATE TABLE person_of_interest (
    name VARCHAR2 (30) , company_name VARCHAR2 (30) , telephone VARCHAR2 (15) , email_address VARCHAR2 (50)
);
/* Question #1 Query Results
TABLE created.
*/

-- NOTE: Question #2
SELECT (custfirstname || ' ' || custlastname) , phone, emailaddr, nvl (companyname, 'None on record')
FROM customer;
/* Question #2 Query Results
(CUSTFIRSTNAME||''||CUSTLASTNAME)	PHONE	EMAILADDR	NVL(COMPANYNAME,'NONEONRECORD')
Lynne Lagunes	208-502-9976	hello@zeronet.net	None on record
Andrew Yelnick	517-803-5818	family@free.com	None on record
Stephanie Pearl	660-447-8319	mommyl@fast.com	None on record
Dorlan Bresnaham	603-497-7374	dorlan@usol.com	None on record
Jon Clute	480-181-8940		None on record
Elizabeth Henderson	449-486-8018		None on record
Tonya Owens	843-773-2751		None on record
Matthew Quant	910-577-1319	walker@onlineservice.com	None on record
Kenneth Mintier	323-673-0690	builder@usol.com	None on record
Lucille Appleton	914-497-2160	muscle@zeronet.net	None on record
Brenda Jones	720-800-2638	show@free.com	None on record
John McGinnis	208-741-1963	john@zeronet.net	None on record
Dennis Eberle	515-708-1802	deber@free.com	None on record
Jo Jacko	856-752-7471		None on record
Karen Randolph	603-744-9002	cookin@zeronet.net	None on record
Ruth Ball	651-479-7538		None on record
Travis Camargo	816-746-4913		None on record
Jerry Muench	464-669-8537	redhot@onlineservice.com	None on record
Verna McGrew	334-547-9329	verngrew@free.com	None on record
Elizabeth Derhammer	785-970-9916	lizzy@onlineservice.com	None on record
Ted Zissa	405-151-7445		None on record
Matt Shade	623-422-6616	shadtree@free.com	None on record
Dean Eagon	970-581-8611		None on record
Andrew Ray	609-345-9680	andyray@usol.com	None on record
Robert Cortez	603-442-3740		None on record
Tim Carlton	203-608-3465		None on record
Jennifer Hundley	304-713-3298	jenhund@fast.com	None on record
Andrea Griswold	970-746-0995	andygwold@usol.com	None on record
Christina Wilson	316-210-8989		None on record
Juicheng Nugent	802-352-8923	nugent@fast.com	None on record
Bryan Price	804-674-9666		None on record
Helene Ziekart	203-244-9192		None on record
Marty Fay	501-631-3727	sparky@free.com	None on record
Lisa Pettry	702-799-7272	lpett@zeronet.net	None on record
Zach McGrew	520-730-8494		None on record
Jamie Thompson	706-471-1222	jthompson@onlineservice.com	None on record
Charles Jones	919-774-5552	charlie@usol.com	None on record
Thomas Zelenka	603-374-3706	zelenka@free.com	None on record
James Laake	613-785-7063		None on record
Daniel Stabnik	636-746-4124		None on record
Trudi Antonio	718-747-3259	toni@onlineservice.com	None on record
John Garcia	207-311-0174	jgar@onlineservice.com	None on record
Jay Hanau	773-490-8254		None on record
Joseph Schuman	330-209-1273		None on record
Joshua Cole	865-269-7782	fido@zeronet.net	None on record
David Schilling	502-421-1516		None on record
Mary Ann Rausch	307-944-3324	spiritual@free.com	None on record
Allison Roland	929-498-4174	alley@onlineservice.com	None on record
Roy Beer	206-745-2584	wizzy@usol.com	None on record
Chris Dunlap	307-473-2281		None on record
Ansel Farrell	712-440-3934	prickly@onlineservice.com	None on record
Jason Laxton	978-860-2824	coondog@usol.com	None on record
Larry Gardiner	225-313-6268	square@onlineserveice.com	None on record
Lawrence Pullen	644-591-3243	laurie@free.com	None on record
Matt Nakanishi	435-710-5324	nakan@free.com	None on record
Nancy Basham	207-422-7135		None on record
Rachel Davis	702-907-4818	rachdav@zeronet.net	None on record
Sarah McCammon	520-438-7944	squirrel@zeronet.net	None on record
David Tietz	651-912-1583	tietz@free.com	None on record
Jim Manaugh	919-747-5603	jmanaugh@eagle.com	None on record
Richard Stetler	256-412-8112	screwball@free.com	None on record
Jonathon Blanco	902-226-1858	hammer@free.com	None on record
Randolph Darling	860-684-1620	randolph@fast.com	None on record
Melody Fazal	760-877-4849	melfazal@zeronet.net	None on record
Michael Tendam	406-424-7496	flute@usol.com	None on record
Sean Akropolis	907-262-4254	pickle@free.com	None on record
Anne Hatzell	302-651-6440	hazel@zeronet.net	None on record
Meredith Rushing	606-608-2105	merry@free.com	None on record
John Skadberg	513-282-3919	skad@zeronet.net	None on record
Zack Hill	503-794-2322	boogie@free.com	None on record
Dan Lageveen	307-344-8928	veenie@zeronet.net	None on record
Marla Reeder	728-442-3031	reedmar@zeronet.net	None on record
Linda Bowen	605-234-4114		None on record
Michael Emore	352-472-1224	mikemore@usol.com	None on record
Mary Jo Wales	852-441-4984	jomary@onlineservice.com	None on record
Tom Moore	270-692-2845	seedle@fast.com	None on record
Susan Watson	801-746-7701	mswatson@fast.com	None on record
Tom Irelan	240-634-5581	tucker@free.com	None on record
Rosemary Vanderhoff	770-293-8783		None on record
Mike Dunbar	208-297-5374	duh@onlineservice.com	None on record
Ryan Stahley	919-774-5340	rstahley@eagle.com	None on record
Patricia Leong	520-247-4141	patrice@usol.com	None on record
Roy McGrew	208-324-0783	grow@zeronet.net	None on record
Tom Baker	414-778-5640	bologna@free.com	None on record
Bill Umbarger	207-155-1577	cheezy@onlineservice.com	None on record
Bob Weldy	571-490-6449	sucker42@usol.com	None on record
Kris Shinn	469-740-2748	shinnk@zeronet.net	None on record
James King	207-708-3317	jamesk@usol.com	None on record
Frank Malady	574-493-0510	frankmala@zeronet.net	None on record
Jim Webb	978-204-3019		None on record
Daniel Rodkey	719-748-3205	dannie@free.com	None on record
Marc Williams	435-774-4595	peanut@fast.com	None on record
Kristy Moore	919-486-6765	fluffy@onlineservice.com	None on record
Russ Mann	775-549-1798	scooter@onlineservice.com	None on record
Carrie Buchko	817-739-1335	goobert@free.com	None on record
Michelle Oakley	978-514-5425	littleone@usol.com	None on record
Steven Yaun	317-780-9804	yawn@fast.com	None on record
Jack Illingworth	914-748-9829	illing@free.com	None on record
Thomas Wolfe	610-365-9766	wolf@onlineservice.com	None on record
Irene Poczekay	401-461-9567		None on record
Andy Huegel	302-620-1366		None on record
Karen Marko	580-555-1871	marko@usol.com	None on record
Trevor Snuffer	336-185-0630	snuffer@zeronet.net	None on record
Phil Reece	919-486-0649	sly@zeronet.net	None on record
Linda Hari	270-411-2316		None on record
Andrew Smith	709-307-2568	smokey@zeronet.net	None on record
Linda Li	203-744-4677	ll@free.com	None on record
Gregory Abbott	812-447-3621	greggie@usol.com	Baker and Company
Tommy McFerren	503-767-7054	mcferren@cole.com	Cole Sales and Associates
Cecil Scheetz	207-679-9822	cecil@free.com	Tippe Inn
Frank Aamodt	898-762-8741	fa@fast.com	Franklin Trinkets
Kathleen Plyman	507-543-2052	needles@onlineservice.com	Needle Center
George Purcell	432-320-6905	design@zeronet.net	BMA Advertising Design
Eugene Gasper	705-580-6124	medcare@fast.com	Regency Hospital
Jared Meers	701-371-1701	rehabsouth@zeronet.net	South Street Rehabilitation
Tracy Cicholski	601-959-1315	dixpharm@free.com	Dixon Pharmacy
Bruce Fogarty	598-791-1420	photoniche@usol.com	Photography Niche
Susan Strong	912-760-7840	fammed@onlineservice.com	Family Medical Center
Ginger Xiao	605-846-0451	acctsbryant@zeronet.net	Bryant Accounting
Karen Burns	707-598-2670	burnskaren@fast.com	Recreation Supply
Cathy Bending	765-617-2811	rrair@zeronet.net	R and R Air
Evelyn Cassens	302-762-9526	dr.animal@onlineservice.com	Vets Inc.
Angie Hoover	307-459-4165	ahoover@free.com	Goodwork Corporation
Jim Sokeland	723-366-1117	employment@zeronet.net	Powerful Employment
Hugo Gillespie	785-981-0669	critters@free.com	Wadake Critters
Wade Jacobs	803-477-5347	connernat@usol.com	Conner National
Brittany Cottingham	419-464-5273	plastic@onlineservice.com	Cottingham Plastics
David Tarter	518-500-0570	estate@fast.com	Realty Specialties
Heather Wallpe	816-433-9799	flex@onlineservice.com	Reflexions Manufacturing
Robert Dalury	906-278-6446	tas@zeronet.net	TAS
Jim Lichty	618-847-1904	bankrupt@usol.com	Bankruptcy Help
Dusty Jones	674-727-0511	rr@usol.com	Railroad Express
Larry Osmanova	541-905-4819	citybus@fast.com	City Bus Transport
Richard Strehle	206-434-7305	vacation@fast.com	Vacation Car Rentals
Brenda Kitchel	804-214-8732	cheesman@zeronet.net	Cheesman Corporation
Don Torres	706-649-6375	drill@usol.com	Down Deep Drilling Inc.
Richard Kluth	302-296-8012	rickkluth@free.com	Main St. Bar and Grill
Allen Robles	644-730-8090	copy@onlineservice.com	Copy Center
Archie Doremski	307-944-8959	sheetz@free.com	Greenpart Steet Metal
Daniel Ezra	207-744-1997	swim@zeronet.net	Pools For You
Dean Katpally	808-799-3727	phonecorp@usol.com	Phone Corporation
Randall Neely	802-319-9805	storage@fast.com	Store It Here
Mike Condie	336-211-1238	kidrec@zeronet.net	Kids Recreation Inc.
Tim Leffert	315-486-4777	trailrent@zeronet.net	Trailor Rentals
Carl Dallas	864-541-5114	analyzeh20@fast.com	Water Analysts
Dennis Sammons	616-544-1969	repairit@free.com	Gards Auto Repair
Mildred Jones	610-437-6687	compconsul@usol.com	Computer Consultants
Paul Kaakeh	719-750-4539	graphit@usol.com	Laser Graphics Associates
Kevin Zubarev	208-364-3785	sign3@fast.com	Signs Signs Signs
Mary Uhl	803-974-2809	mouse@fast.com	Flowers by Mickey
Jennifer Kmec	443-542-1386	dancingk@free.com	Kelly Dance Studio
Marjorie Vandermay	308-489-1137	nam@fast com	National Art Museum
Stephanie Yeinick	573-455-4278	jewels@usol.com	Tuckers Jewels
Cathy Harvey	336-477-0249	findwork@onlineservice.com	The Employment Agency
Geo Schofield	228-480-9751	cleanit@usol.com	Cleaning Supply
Kara Orze	414-773-1017	appinc@zeronet.net	Appliances Inc.
Jeff Kowaiski	212-492-5644	equipit@usol.com	Quality Equipment Corp.
Sharon Rouls	205-246-3224	irish@free.com	Sharons Shamrock
Sherry Garling	353-822-7623	homely@fast.com	Manufactured Homes Corp.
Mary Deets	808-562-4081	camphere@fast.com	Camping Supplies
Dennis Drazer	253-315-4247	dollarplan@usol.com	Financial Planning Consul
Robert Lister	801-404-1240	fines@free.com	Fire Alarm Systems
Heather Waters	869-741-7817	dates@free.com	Happytime Escort Service
Anita Pastron	901-796-4654	contracts@fast.com	Industrail Contracting Co
Amy Heide	802-894-1024	letout@usol.com	Outlets
Charlene Franks	307-892-2938	learn@rydell.edu	Rydell High School
Doug Blizzard	228-646-5114	collectit@onlineservice.com	Collectibles Inc.
Richard Scott	304-774-2226	kick@onlineservice.com	Karate Made Easy
Scott Gray	484-453-7105	keepsafe@zeronet.net	Security Installation
Randy Talauage	347-671-2022	paintit@fast.com	Ceramic Supply
Daniel Hundnall	918-830-9731	fixit@usol.com	Bobs Repair Service
Sally Valle	972-234-2044	roi@usol.com	Investment Specialties
Noemi Elston	307-359-9514	closetoheaven@zeronet.net	North Street Church
Kelly Jordan	727-951-7737	supplycrafts@fast.com	Supplying Crafts
Steve Fulkerson	602-129-1885	cellcall@usol.com	Cellular Services
Orville Gilliland	490-263-2957	eia@zeronet.net	Easy Internet Access
Bridgette Kyger	301-467-6480	homeloans@fast.com	Sampson Home Mortgages
Norman Fields	501-346-4841	catv@onlineservice.com	The Cable Company
Jessica Nakamura	605-324-2193	carsell@usol.com	Automart
Jack Barrick	786-494-4782	1natbank@free.com	First National Bank
Aricka Bross	419-676-9758	placetolive@free.com	Apartment Referrals
Anna Mayton	888-451-1233	doctor@free.com	None on record
Lou Caldwell	606-901-1238	lucky@fast.com	None on record
Carl Hague	419-890-3531		None on record
Jeffery Jordan	509-989-9996	seeya@usol.com	None on record
Kimber Spaller	878-119-5448	mcgimmie@zero.net	None on record
Eric Fannon	209-980-0812	ef@free.com	None on record
Jessica Cain	517-901-2610		None on record
Richard Zito	603-787-0787	rzito@zeronet.net	None on record
Angela Wainscott	208-788-4112	awainscott@free.com	None on record
James Gross	908-879-8672	jgross@fast.com	None on record
Jack Akers	301-454-6061	pizazz@usol.com	None on record
Kevin Jackson	225-624-2341		None on record
Shirley Osborne	706-333-7174		None on record
Eric Becker	910-717-7613	daddyo@usol.com	None on record
Karen Mangus	863-623-0459	missright@onlineservice.com	None on record
Peter Austin	803-343-6063		None on record
Brad Arquette	775-914-4294	arq@usol.com	None on record
Daniel Barton	915-894-8034	dannie@zeronet.net	None on record
Jerry Mennen	520-306-8426	mennenj@free.com	None on record
Kenneth Wilcox	515-872-8848	kenny@onlineservice.com	None on record
Matt Smith	719-822-8828	matsm@fast.com	None on record
Paul Sullivan	785-322-5896	sullie@zeronet.net	None on record
Gerald Campbell	431-087-1044	gcampbell@free.com	None on record
Joan Hedden	501-710-0658		None on record
Ronald Miller	734-820-2076	picky@zeronet.net	None on record
Terry Xu	417-546-2570	muffin@fast.com	None on record
Danita Sharp	360-650-5604	girlfriend@fast.com	None on record
Don Kaleta	724-695-2157	stud@zeronet.net	None on record
Tammi Baldocchio	401-989-4975		None on record
Eric Quintero	812-805-1588	diamond@onlineservice.com	None on record
Phillip Hession	231-711-6837	howdy@usol.com	None on record
Ruth Albeering	784-444-0131	rabeering@free.com	None on record
Jacob Richer	425-942-3763	laugh@free.com	None on record
James Jones	971-522-5851	puffy@fast.com	None on record
Tim Parker	315-985-4102	jeckle@onlineservice.com	None on record
Andrea Montgomery	349-397-7772		None on record
Chas Funk	860-498-3900	duck@usol.com	None on record
David Smith	309-980-4350	emerald@onlineservice.com	None on record
David Chang	740-750-1272	lion@free.com	None on record
Kathy Gunderson	941-330-3314		None on record
Dennis Mundy	603-306-0774	rino@usol.com	None on record
George Trenkle	856-267-7913	cold@fast.com	None on record
Carey Dailey	728-896-2767	shelty@usol.com	None on record
Louise Cool	208-956-0698		None on record
Gary Kempf	937-724-7313	kempfg@free.com	None on record
Jane Mumford	270-428-5866		None on record
Scott Yarian	252-310-2224	syarian@fast.com	None on record
Patrick Bollock	307-635-1692	pat@fast.com	None on record
Paul Rice	719-541-1837	paulier@onlineservice.com	None on record
James Schilling	319-429-9772		None on record
*/

-- NOTE: Question #3
INSERT INTO person_of_interest (
    name, telephone, email_address, company_name
)
    SELECT (custfirstname || ' ' || custlastname) , phone, emailaddr, nvl (companyname, 'None on record')
    FROM customer;
/* Question #3 Query Results
231 rows created.
*/

-- NOTE: Question #4
UPDATE person_of_interest
SET
    email_address = 'None on record'
WHERE
    email_address IS NULL;
/* Question #4 Query Results
39 rows updated.
*/

-- NOTE: Question #5
DELETE FROM person_of_interest
WHERE
    company_name = 'None on record';
--
SELECT *
FROM person_of_interest;
/* Question #5 Query Results
157 rows deleted.

NAME	COMPANY_NAME	TELEPHONE	EMAIL_ADDRESS
Gregory Abbott	Baker and Company	812-447-3621	greggie@usol.com
Tommy McFerren	Cole Sales and Associates	503-767-7054	mcferren@cole.com
Cecil Scheetz	Tippe Inn	207-679-9822	cecil@free.com
Frank Aamodt	Franklin Trinkets	898-762-8741	fa@fast.com
Kathleen Plyman	Needle Center	507-543-2052	needles@onlineservice.com
George Purcell	BMA Advertising Design	432-320-6905	design@zeronet.net
Eugene Gasper	Regency Hospital	705-580-6124	medcare@fast.com
Jared Meers	South Street Rehabilitation	701-371-1701	rehabsouth@zeronet.net
Tracy Cicholski	Dixon Pharmacy	601-959-1315	dixpharm@free.com
Bruce Fogarty	Photography Niche	598-791-1420	photoniche@usol.com
Susan Strong	Family Medical Center	912-760-7840	fammed@onlineservice.com
Ginger Xiao	Bryant Accounting	605-846-0451	acctsbryant@zeronet.net
Karen Burns	Recreation Supply	707-598-2670	burnskaren@fast.com
Cathy Bending	R and R Air	765-617-2811	rrair@zeronet.net
Evelyn Cassens	Vets Inc.	302-762-9526	dr.animal@onlineservice.com
Angie Hoover	Goodwork Corporation	307-459-4165	ahoover@free.com
Jim Sokeland	Powerful Employment	723-366-1117	employment@zeronet.net
Hugo Gillespie	Wadake Critters	785-981-0669	critters@free.com
Wade Jacobs	Conner National	803-477-5347	connernat@usol.com
Brittany Cottingham	Cottingham Plastics	419-464-5273	plastic@onlineservice.com
David Tarter	Realty Specialties	518-500-0570	estate@fast.com
Heather Wallpe	Reflexions Manufacturing	816-433-9799	flex@onlineservice.com
Robert Dalury	TAS	906-278-6446	tas@zeronet.net
Jim Lichty	Bankruptcy Help	618-847-1904	bankrupt@usol.com
Dusty Jones	Railroad Express	674-727-0511	rr@usol.com
Larry Osmanova	City Bus Transport	541-905-4819	citybus@fast.com
Richard Strehle	Vacation Car Rentals	206-434-7305	vacation@fast.com
Brenda Kitchel	Cheesman Corporation	804-214-8732	cheesman@zeronet.net
Don Torres	Down Deep Drilling Inc.	706-649-6375	drill@usol.com
Richard Kluth	Main St. Bar and Grill	302-296-8012	rickkluth@free.com
Allen Robles	Copy Center	644-730-8090	copy@onlineservice.com
Archie Doremski	Greenpart Steet Metal	307-944-8959	sheetz@free.com
Daniel Ezra	Pools For You	207-744-1997	swim@zeronet.net
Dean Katpally	Phone Corporation	808-799-3727	phonecorp@usol.com
Randall Neely	Store It Here	802-319-9805	storage@fast.com
Mike Condie	Kids Recreation Inc.	336-211-1238	kidrec@zeronet.net
Tim Leffert	Trailor Rentals	315-486-4777	trailrent@zeronet.net
Carl Dallas	Water Analysts	864-541-5114	analyzeh20@fast.com
Dennis Sammons	Gards Auto Repair	616-544-1969	repairit@free.com
Mildred Jones	Computer Consultants	610-437-6687	compconsul@usol.com
Paul Kaakeh	Laser Graphics Associates	719-750-4539	graphit@usol.com
Kevin Zubarev	Signs Signs Signs	208-364-3785	sign3@fast.com
Mary Uhl	Flowers by Mickey	803-974-2809	mouse@fast.com
Jennifer Kmec	Kelly Dance Studio	443-542-1386	dancingk@free.com
Marjorie Vandermay	National Art Museum	308-489-1137	nam@fast com
Stephanie Yeinick	Tuckers Jewels	573-455-4278	jewels@usol.com
Cathy Harvey	The Employment Agency	336-477-0249	findwork@onlineservice.com
Geo Schofield	Cleaning Supply	228-480-9751	cleanit@usol.com
Kara Orze	Appliances Inc.	414-773-1017	appinc@zeronet.net
Jeff Kowaiski	Quality Equipment Corp.	212-492-5644	equipit@usol.com
Sharon Rouls	Sharons Shamrock	205-246-3224	irish@free.com
Sherry Garling	Manufactured Homes Corp.	353-822-7623	homely@fast.com
Mary Deets	Camping Supplies	808-562-4081	camphere@fast.com
Dennis Drazer	Financial Planning Consul	253-315-4247	dollarplan@usol.com
Robert Lister	Fire Alarm Systems	801-404-1240	fines@free.com
Heather Waters	Happytime Escort Service	869-741-7817	dates@free.com
Anita Pastron	Industrail Contracting Co	901-796-4654	contracts@fast.com
Amy Heide	Outlets	802-894-1024	letout@usol.com
Charlene Franks	Rydell High School	307-892-2938	learn@rydell.edu
Doug Blizzard	Collectibles Inc.	228-646-5114	collectit@onlineservice.com
Richard Scott	Karate Made Easy	304-774-2226	kick@onlineservice.com
Scott Gray	Security Installation	484-453-7105	keepsafe@zeronet.net
Randy Talauage	Ceramic Supply	347-671-2022	paintit@fast.com
Daniel Hundnall	Bobs Repair Service	918-830-9731	fixit@usol.com
Sally Valle	Investment Specialties	972-234-2044	roi@usol.com
Noemi Elston	North Street Church	307-359-9514	closetoheaven@zeronet.net
Kelly Jordan	Supplying Crafts	727-951-7737	supplycrafts@fast.com
Steve Fulkerson	Cellular Services	602-129-1885	cellcall@usol.com
Orville Gilliland	Easy Internet Access	490-263-2957	eia@zeronet.net
Bridgette Kyger	Sampson Home Mortgages	301-467-6480	homeloans@fast.com
Norman Fields	The Cable Company	501-346-4841	catv@onlineservice.com
Jessica Nakamura	Automart	605-324-2193	carsell@usol.com
Jack Barrick	First National Bank	786-494-4782	1natbank@free.com
Aricka Bross	Apartment Referrals	419-676-9758	placetolive@free.com
*/

-- NOTE: Question #6
TRUNCATE TABLE person_of_interest;
--
SELECT *
FROM person_of_interest;
/* Question #6 Query Results
TABLE truncated.

no rows selected
*/

-- NOTE: Question #7
CREATE TABLE copy_customer AS
    SELECT *
    FROM customer;
/* Question #7 Query Results
TABLE created.
*/

-- NOTE: Question #8
INSERT INTO copy_customer (
    customerid, companyname, custfirstname, custlastname, custtitle, city, state
) VALUES (
    'Z-12345', 'Quick Stop', 'Randal', 'Graves', 'Mr.', 'Leonardo', 'NJ'
);
--
SELECT *
FROM copy_customer
WHERE customerid = 'Z-12345';
/* Question #8 Query Results
1 row created.

CUSTOMERID	COMPANYNAME	CUSTFIRSTNAME	CUSTLASTNAME	CUSTTITLE	ADDRESS	CITY	STATE	POSTALCODE	PHONE	FAX	EMAILADDR
Z-12345	Quick Stop	Randal	Graves	Mr.		Leonardo	NJ				
*/

-- NOTE: Question #9
UPDATE copy_customer
SET
    postalcode = '07737'
WHERE
    customerid = 'Z-12345';
--
SELECT *
FROM copy_customer
WHERE customerid = 'Z-12345';
/* Question #9 Query Results
CUSTOMERID	COMPANYNAME	CUSTFIRSTNAME	CUSTLASTNAME	CUSTTITLE	ADDRESS	CITY	STATE	POSTALCODE	PHONE	FAX	EMAILADDR
Z-12345	Quick Stop	Randal	Graves	Mr.		Leonardo	NJ	07737			
*/

-- NOTE: Question #10
DELETE FROM copy_customer
WHERE
    state = 'OH';
--
SELECT *
FROM copy_customer
WHERE state = 'OH';
/* Question #10 Query Results
7 rows deleted.

no rows selected
*/

-- NOTE: Question #11
DELETE FROM copy_customer
WHERE
    customerid = 'Z-12345';
--
SELECT *
FROM copy_customer
WHERE customerid = 'Z-12345';
/* Question #11 Query Results
1 row deleted.

no rows selected
*/

-- NOTE: Question #12
UPDATE copy_customer
SET
    city = 'Leonardo', state = 'NJ';
--
SELECT *
FROM copy_customer
WHERE city != 'Leonardo' OR state != 'NJ';
/* Question #12 Query Results
224 rows updated.

no rows selected
*/

-- NOTE: Question #13
CREATE TABLE employee_bottom_25 (
    employee_id VARCHAR (10) , employee_name VARCHAR (36) , job_title VARCHAR2 (35) , salary NUMBER (9, 2)
);
--
CREATE TABLE employee_top_10 (
    employee_id VARCHAR (10) , employee_name VARCHAR (36) , job_title VARCHAR2 (35) , salary NUMBER (9, 2)
);
--
CREATE TABLE employee_others (
    employee_id VARCHAR (10) , employee_name VARCHAR (36) , job_title VARCHAR2 (35) , salary NUMBER (9, 2)
);
/* Question #13 Query Results
TABLE created.

TABLE created.

TABLE created.
*/

-- NOTE: Question #14
INSERT ALL
    WHEN salarywage < (
        SELECT (.25 * AVG (salarywage) ) FROM employee
    ) THEN INTO employee_bottom_25
    WHEN salarywage >= (
        SELECT (.9 * (MAX (salarywage) - MIN (salarywage) ) ) + MIN (salarywage) FROM employee
    ) THEN INTO employee_top_10 ELSE INTO employee_others
        SELECT employeeid, (firstname || ' ' || lastname) , jobtitle, salarywage
        FROM employee;
--
SELECT *
FROM employee_bottom_25;
--
SELECT *
FROM employee_top_10;
--
SELECT *
FROM employee_others;
/* Question #14 Query Results
EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100101	Joanne Rosner	Assembly	16.3
100120	Michelle Nairn	Assembly	16.75
100204	David Keck	Assembly	17.8
100220	Todd Vigus	Accountant	15
100399	Ronald Day	Assembly	16.25
100475	Steve Hess	Assembly	17.6
100550	Allison Roland	Assembly	16.85
100600	Calie Zollman	Sales	17.35
100892	Joseph Platt	Assembly	17.95
100967	Nicholas Albregts	Assembly	15.5
100989	Kathryn Deagen	Assembly	16.95
101007	Jason Krasner	Sales	12.75
101030	Kristey Moore	Assembly	13.6
101045	Austin Ortman	Assembly	10.5
101066	Laura Rodgers	Sales	12.6
101088	Patricha Underwood	Assembly	18.45
101089	Melissa Alvarez	Assembly	13.25
101097	Jack Brose	Assembly	12.05
101115	Steve Cochran	Assembly	10.5
101135	David Deppe	Assembly	11.65
101154	Gregory Hettinger	Assembly	11.25
101166	Phil Reece	Assembly	10.5

EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100365	Sherman Cheswick	President	99900
100650	Edna Lilley	VP Information	93900

EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100001	Jim Manaugh	Chief Financial Officer	75500
100103	Rita Bush	VP Operations	85800
100104	Michael Abbott	Engineer	74400
100106	Paul Eckelman	Accountant	53600
100112	Steven Hickman	Programmer Analyst	57600
100125	Gabrielle Stevenson	Chief Information Officer	75300
100127	Jason Wendling	Operations Officer	65600
100200	Beth Zobitz	Engineer	55200
100206	Kathleen Xolo	VP Finance	80700
100209	Tina Yates	Engineer	52000
100330	Kristen Gustavel	Operations Officer	68800
100488	Jamie Osman	Programmer Analyst	46300
100559	Meghan Tyrie	Engineer	50100
100700	Charles Jones	DBA	65600
100880	Gary German	Chief Sales Officer	48900
100944	Ryan Stahley	Engineer	48600
*/

-- NOTE: Question #15
DELETE FROM employee_bottom_25;
DELETE FROM employee_top_10;
DELETE FROM employee_others;
--
SELECT *
FROM employee_bottom_25;
--
SELECT *
FROM employee_top_10;
--
SELECT *
FROM employee_others;
/* Question #15 Query Results
22 rows deleted.

4 rows deleted.

14 rows deleted.

no rows selected

no rows selected

no rows selected
*/

-- NOTE: Question #16
CREATE TABLE employee_top_2 (
    employee_id VARCHAR (10) , employee_name VARCHAR (36) , job_title VARCHAR2 (35) , salary NUMBER (9, 2)
);
/* Question #16 Query Results
TABLE created.
*/

-- NOTE: Question #17
INSERT ALL
    WHEN salarywage < (
        SELECT (.25 * AVG (salarywage) ) FROM employee
    ) THEN INTO employee_bottom_25
    WHEN salarywage >= (
        SELECT (.9 * (MAX (salarywage) - MIN (salarywage) ) ) + MIN (salarywage) FROM employee
    ) THEN INTO employee_top_10
    WHEN salarywage >= (
        SELECT (.98 * (MAX (salarywage) - MIN (salarywage) ) ) + MIN (salarywage) FROM employee
    ) THEN INTO employee_top_2 ELSE INTO employee_others
        SELECT employeeid, (firstname || ' ' || lastname) , jobtitle, salarywage
        FROM employee;
--
SELECT *
FROM employee_bottom_25;
--
SELECT *
FROM employee_top_10;
--
SELECT *
FROM employee_others;
--
SELECT *
FROM employee_top_2;
/* Question #17 Query Results
Insert first only inserts the result for the first matching row while all evaluates all rows.

EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100101	Joanne Rosner	Assembly	16.3
100120	Michelle Nairn	Assembly	16.75
100204	David Keck	Assembly	17.8
100220	Todd Vigus	Accountant	15
100399	Ronald Day	Assembly	16.25
100475	Steve Hess	Assembly	17.6
100550	Allison Roland	Assembly	16.85
100600	Calie Zollman	Sales	17.35
100892	Joseph Platt	Assembly	17.95
100967	Nicholas Albregts	Assembly	15.5
100989	Kathryn Deagen	Assembly	16.95
101007	Jason Krasner	Sales	12.75
101030	Kristey Moore	Assembly	13.6
101045	Austin Ortman	Assembly	10.5
101066	Laura Rodgers	Sales	12.6
101088	Patricha Underwood	Assembly	18.45
101089	Melissa Alvarez	Assembly	13.25
101097	Jack Brose	Assembly	12.05
101115	Steve Cochran	Assembly	10.5
101135	David Deppe	Assembly	11.65
101154	Gregory Hettinger	Assembly	11.25
101166	Phil Reece	Assembly	10.5

EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100365	Sherman Cheswick	President	99900
100650	Edna Lilley	VP Information	93900

EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100001	Jim Manaugh	Chief Financial Officer	75500
100103	Rita Bush	VP Operations	85800
100104	Michael Abbott	Engineer	74400
100106	Paul Eckelman	Accountant	53600
100112	Steven Hickman	Programmer Analyst	57600
100125	Gabrielle Stevenson	Chief Information Officer	75300
100127	Jason Wendling	Operations Officer	65600
100200	Beth Zobitz	Engineer	55200
100206	Kathleen Xolo	VP Finance	80700
100209	Tina Yates	Engineer	52000
100330	Kristen Gustavel	Operations Officer	68800
100488	Jamie Osman	Programmer Analyst	46300
100559	Meghan Tyrie	Engineer	50100
100700	Charles Jones	DBA	65600
100880	Gary German	Chief Sales Officer	48900
100944	Ryan Stahley	Engineer	48600

EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100365	Sherman Cheswick	President	99900
*/

-- NOTE: Question #18
UPDATE employee_top_2
SET
    salary = (
        1.2 * salary
    );
--
SELECT *
FROM employee_top_2;
/* Question #18 Query Results
1 row updated.

EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100365	Sherman Cheswick	President	119880
*/

-- NOTE: Question #19
INSERT INTO employee_top_2 (
    employee_id, employee_name, job_title, salary
) VALUES (
    '101', 'Happy Owner', 'Big Boss', 1000000
);
/* Question #19 Query Results
1 row created.
*/

-- NOTE: Question #20
MERGE INTO employee_top_10 t USING (
    SELECT *
    FROM employee_top_2
) tt ON (t.employee_id = tt.employee_id) WHEN MATCHED THEN UPDATE SET t.salary = tt.salary;
--
SELECT *
FROM employee_top_10;
/* Question #20 Query Results
2 rows merged.

EMPLOYEE_ID	EMPLOYEE_NAME	JOB_TITLE	SALARY
100365	Sherman Cheswick	President	119880
100650	Edna Lilley	VP Information	93900
*/

-- NOTE: Question #21
DROP TABLE copy_customer CASCADE CONSTRAINTS;
DROP TABLE person_of_interest CASCADE CONSTRAINTS;
DROP TABLE employee_top_10 CASCADE CONSTRAINTS;
DROP TABLE employee_top_2 CASCADE CONSTRAINTS;
DROP TABLE employee_bottom_25 CASCADE CONSTRAINTS;
DROP TABLE employee_others CASCADE CONSTRAINTS;
/* Question #21 Query Results
TABLE dropped.

TABLE dropped.

TABLE dropped.

TABLE dropped.

TABLE dropped.

TABLE dropped.
*/