/*
====================================================================================

								DATA CLEANING #1
			
					The most common data cleaning tecniques 
					
					APPENDIX:
					
						-	TOTAL
						-	DISTINCT
						-	NULL
						-	DUPLICATES
						-	TO_DATE CONVERSION
						-	NVL
				
				DATASET TAKEN FROM KAGGLE.COM AT:
				
				https://www.kaggle.com/crailtap/taxi-trajectory
				
				IMPORTED TABLE NAME IS:		TAXI_DATASET
		
====================================================================================
*/

------------------------------------------------------------------------------------

/*
====================================================================================

							SELECT
		
		Congrats! 
		You've received your first dataset! Can't wait to explore all its secrets!
		But wait! How can you hanlde all different scenarios?
		
		Before you run away your business, there are some tips to rely on before 
		getting serious headaches!
		
		Let's take a look at first!
		
====================================================================================
*/	

SELECT *
FROM TAXI_DATASET;

-- FIRST 20 ROWS 
/*


TRIP_ID				CALL_TYPE	ORIGIN_CALL		ORIGIN_STAND	TAXI_ID		TIMESTAMP		DAY_TYPE	MISSING_DATA		POLYLINE
------------------------------------------------------------------------------------------------------------------------------------------------
1372637303620000596		B		(null)				7			20000596	1372637303			A			False		[[-8.639847,41.159826]..
1372636858620000589		C		(null)				(null)		20000589	1372636858			A			False		[[-8.618643,41.141412]..
1372636951620000320		C		(null)				(null)		20000320	1372636951			A			False		[[-8.612964,41.140359]..
1372636854620000520		C		(null)				(null)		20000520	1372636854			A			False		[[-8.574678,41.151951]..
1372638481620000403		B		(null)				28			20000403	1372638481			A			False		[[-8.584263,41.163156]..
1372639135620000570		A		33180				(null)		20000570	1372639135			A			False		[[-8.666757,41.174055]..
1372637482620000005		C		(null)				(null)		20000005	1372637482			A			False		[[-8.599239,41.149188]..
1372639181620000089		C		(null)				(null)		20000089	1372639181			A			False		[[-8.643807,41.168979]..
1372638161620000423		C		(null)				(null)		20000423	1372638161			A			False		[[-8.609706,41.151303]..
1372637091620000337		C		(null)				(null)		20000337	1372637091			A			False		[[-8.645994,41.18049]...
1372636965620000231		C		(null)				(null)		20000231	1372636965			A			False		[[-8.615502,41.140674]..
1372637210620000456		C		(null)				(null)		20000456	1372637210			A			False		[[-8.57952,41.145948]...
1372637299620000011		C		(null)				(null)		20000011	1372637299			A			False		[[-8.617563,41.146182]..
1372637274620000403		C		(null)				(null)		20000403	1372637274			A			False		[[-8.611794,41.140557]..
1372637905620000320		C		(null)				(null)		20000320	1372637905			A			False		[[-8.615907,41.140557]..
1372636875620000233		C		(null)				(null)		20000233	1372636875			A			False		[[-8.619894,41.148009]..
1372637984620000520		C		(null)				(null)		20000520	1372637984			A			False		[[-8.56242,41.168403]...
1372637343620000571		A		31508				(null)		20000571	1372637343			A			False		[[-8.618868,41.155101]..
1372638595620000233		C		(null)				(null)		20000233	1372638595			A			False		[[-8.608716,41.153499]..
1372638151620000231		C		(null)				(null)		20000231	1372638151			A			False		[[-8.612208,41.14053]...


*/


------------------------------------------------------------------------------------

/*
====================================================================================

							COUNT

		Now you have a basically idea on what's going on here.
		Next step: COUNT them all!

====================================================================================
*/	

SELECT COUNT(*)
FROM TAXI_DATASET;

-- 1.710.670 ROWS

------------------------------------------------------------------------------------

/*
====================================================================================

							DISTINCT
							
		Whoa! A lot of stuff has been loaded here! But, again the same, what kind 
		of values do I have?
		Let's answer one more time!

====================================================================================
*/	

SELECT DISTINCT (ORIGIN_CALL)
FROM TAXI_DATASET;

-- FIRST 20 ROWS
/*

ORIGIN_CALL
-------------
57270
14434
13970
5994
12773
21378
12880
36624
6086
18843
28771
43951
52963
15242
50242
17486
9859
14857
16865
5926

*/

SELECT DISTINCT (ORIGIN_STAND)
FROM TAXI_DATASET;

-- FIRST 20 ROWS
/*

ORIGIN_STAND
---------------
(null)
7
28
13
22
57
38
52
23
18
34
15
30
51
47
9
58
60
12
14


*/

SELECT DISTINCT (DAY_TYPE)
FROM TAXI_DATASET;

-- FIRST 20 ROWS
/*

DAY_TYPE
-----------------
A

*/

------------------------------------------------------------------------------------

/*
====================================================================================

							NULL
							
		Did you see it? Am I wondering on unnaturaly or ethereal things?
		No, of course. You know what you saw. There are missing values,
		often referred as NULL values!
		
		Let's discovery them!

====================================================================================
*/	

SELECT ORIGIN_CALL
FROM TAXI_DATASET
WHERE ORIGIN_CALL IS NULL;

-- FIRST 20 ROWS
/*

ORIGIN_CALL
---------------
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)


*/

SELECT ORIGIN_STAND
FROM TAXI_DATASET
WHERE ORIGIN_STAND IS NULL;

-- FIRST 20 ROWS
/*

ORIGIN_STAND
---------------
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)
(null)


*/


------------------------------------------------------------------------------------

/*
====================================================================================

							DUPLICATES
							
		This is time I have to go to eye doctor! Definitely! 
		Am I seeing double nor triple then normal eye sight?
		
		Let's check if there are some DUPLICATES mocking us!
							
							
====================================================================================
*/	

SELECT TRIP_ID, COUNT(TRIP_ID) OCCURRENCES
FROM TAXI_DATASET
GROUP BY TRIP_ID
HAVING COUNT(TRIP_ID) > 1;

-- FIRST 20 ROWS
/*

TRIP_ID					OCCURRENCES
------------------------------------
1373025987620000601			2
1382450880620000432			2
1391416612620000196			2
1392816672620000663			2
1395682280620000089			2
1404093316620000307			2
1374014097620000337			2
1385631430620000080			2
1391586783620000484			2
1392317061620000066			2
1393472034620000620			2
1394207135620000588			2
1402132342620000571			2
1381645412620000328			2
1386947218620000080			2
1393315427620000513			2
1401346641620000319			2
1373551710620000014			2
1374262188620000554			2
1381859675620000465			2


*/

SELECT ORIGIN_CALL, COUNT(ORIGIN_CALL) OCCURRENCES
FROM TAXI_DATASET
GROUP BY ORIGIN_CALL
HAVING COUNT(ORIGIN_CALL) > 1;

-- FIRST 20 ROWS
/*

ORIGIN_CALL		OCCURRENCIES
----------------------------
14434				7
13970				52
5994				4
12773				138
12880				10
36624				69
6086				3
18843				13
28771				3
52963				28
15242				247
50242				11
17486				9
9859				74
14857				24
16865				277
5926				187
9741				26
13718				50
14056				10

------------------------------------------------------------------------------------

/*
====================================================================================

							DATES
							
			How about those strange 10-digit-numbers from TIMESTAMP column?
			
			Let's try to convert it into a human readable way!
			
====================================================================================
*/

SELECT  SYSDATE + TIMESTAMP CONVERTED_DATE
FROM TAXI_DATASET;

-- FIRST 20 ROWS
/*

CONVERTED_DATE
-----------------
08-MAR-99
27-MAG-98
09-GIU-99
04-MAR-99
17-AGO-95
02-GIU-93
22-NOV-98
18-LUG-93
01-OTT-96
27-OTT-99
23-GIU-99
23-FEB-98
23-MAG-98
28-APR-98
19-GEN-96
25-MAR-99
07-APR-96
06-LUG-98
09-DIC-95
21-SET-96

*/


------------------------------------------------------------------------------------

/*
====================================================================================

									NVL

							Enough complaining! 
					
					Let's clear this messy data once forever!
					
					Let me introduce you the NVL() function just below:
					
			You can select between two different values as:
				-	A column's value or another column's one
				-	A column's value or a default one
				
			In this case, we will replace NULL values with a default 0


====================================================================================
*/


SELECT 
    NVL(ORIGIN_CALL, 0) ORIGIN_CALL
FROM TAXI_DATASET;
-- FIRST 20 ROWS
/*

ORIGIN_CALL
-------------
0
0
0
0
0
33180
0
0
0
0
0
0
0
0
0
0
0
31508
0
0



*/

------------------------------------------------------------------------------------

