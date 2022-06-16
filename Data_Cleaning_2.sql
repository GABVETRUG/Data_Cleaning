/*
====================================================================================

								DATA CLEANING #2
			
					The most common data cleaning tecniques 
					
					APPENDIX:
					
						-	COALESCE
						-	LENGTH
						-	UPPER
						-	LOWER
						-	TRIM
						-	MIXED FUNCS
				
				DATASET TAKEN FROM EFOREXCEL AT:
				
				https://eforexcel.com/wp/downloads-18-sample-csv-files-data-sets-for-testing-sales/
				
				IMPORTED TABLE NAME IS:		5m-Sales-Records
		
====================================================================================
*/

------------------------------------------------------------------------------------

/*
====================================================================================

							COALESCE
							
		
		The COALESCE function will save you a lot of time by checking for the first
		non-NULL value in a given columns range!
		
====================================================================================
*/	

-- COALESCE
SELECT 
    COALESCE(REGION, COUNTRY, NULL) RESULT
FROM SALES_RECORDS;


-- FIRST 20 ROWS 
/*

RESULT
------------------------------------
Central America and the Caribbean
Europe
Sub-Saharan Africa
Europe
Sub-Saharan Africa
Sub-Saharan Africa
Central America and the Caribbean
Europe
Sub-Saharan Africa
Asia
Asia
Asia
Europe
Europe
Sub-Saharan Africa
Middle East and North Africa
Sub-Saharan Africa
Middle East and North Africa
Australia and Oceania
Asia

*/

------------------------------------------------------------------------------------

/*
====================================================================================

							LENGTH
							
		
		The LENGTH function helps you check your column's value length.
		One column per single condition. 
		You can also use this function in SELECT!
		
====================================================================================
*/	

-- LENGTH
SELECT ORDER_PRIORITY
FROM SALES_RECORDS
WHERE LENGTH(ORDER_PRIORITY) > 1;

-- No results 

------------------------------------------------------------------------------------

/*
====================================================================================

						UPPER
							
		This is a very common function! 
		It simply takes a string and converts every character from letter case to 
		capital case!
		
====================================================================================
*/	

-- UPPER
SELECT 
    DISTINCT(UPPER(REGION)) REGION
FROM SALES_RECORDS;

-- FIRST 7 ROWS 

/*

REGION
------------------------------------
CENTRAL AMERICA AND THE CARIBBEAN
EUROPE
SUB-SAHARAN AFRICA
ASIA
MIDDLE EAST AND NORTH AFRICA
AUSTRALIA AND OCEANIA
NORTH AMERICA

*/

------------------------------------------------------------------------------------

/*
====================================================================================

						LOWER
							
		Another one!
		It performs the opposite: from capital to letter case!
		
====================================================================================
*/	

-- LOWER
SELECT 
    DISTINCT(LOWER(REGION)) REGION
FROM SALES_RECORDS;

-- FIRST 7 ROWS

/*

REGION
------------------------------------
central america and the caribbean
europe
sub-saharan africa
asia
middle east and north africa
australia and oceania
north america

*/

------------------------------------------------------------------------------------

/*
====================================================================================

						LOWER
							
		Wait! What happens if I convert some column's values from lower to
		upper again?
		
		Simply fact: 
			1) It takes the column
			2) It converts its values to lower
			3) It converts again them to Upper
			4) It takes easy distinguishable values
		
====================================================================================
*/	

-- TRAP!
SELECT DISTINCT(UPPER(LOWER(REGION))) REGION
FROM SALES_RECORDS;

-- FIRST 7 ROWS

/*

REGION
------------------------------------
CENTRAL AMERICA AND THE CARIBBEAN
EUROPE
SUB-SAHARAN AFRICA
ASIA
MIDDLE EAST AND NORTH AFRICA
AUSTRALIA AND OCEANIA
NORTH AMERICA

*/

------------------------------------------------------------------------------------

/*
====================================================================================

						TRIM
						
			Another useful function!
			This function removes:
				-	Leading spaces
				-	Trailing spaces
				-	Both spaces
			from a given string or column's values. 
			
		
====================================================================================
*/	

-- TRIM
    --  NO SPACES LEFT!
SELECT 
    TRIM(BOTH ' ' FROM REGION)
FROM SALES_RECORDS;

-- FIRST 20 ROWS 

/*

REGION
------------------------------------
Central America and the Caribbean
Europe
Sub-Saharan Africa
Europe
Sub-Saharan Africa
Sub-Saharan Africa
Central America and the Caribbean
Europe
Sub-Saharan Africa
Asia
Asia
Asia
Europe
Europe
Sub-Saharan Africa
Middle East and North Africa
Sub-Saharan Africa
Middle East and North Africa
Australia and Oceania
Asia

*/

------------------------------------------------------------------------------------

/*
====================================================================================

						MIXED FUNCS
						
			At last but not at least, here is an example of 
			day-by-day email check!
			
		
====================================================================================
*/	

-- MIXED FUNCS
SELECT 
    TRIM(UPPER('edwardforkles@gmail.com  ')) EMAIL,
    TRIM(LOWER('EDward ')) || '.' || LOWER('FORKLES') NAME_SURNAME
FROM DUAL;

-- FIRST ROW

/*

EMAIL						NAME_SURNAME
-------------------------------------------
EDWARDFORKLES@GMAIL.COM		edward.forkles

*/




