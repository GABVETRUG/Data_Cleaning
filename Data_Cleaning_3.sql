/*
====================================================================================

								DATA CLEANING #3
			
					The most common data cleaning tecniques 
					
					APPENDIX:
					
						-	GROUP BY
						-	ORDER BY
						-	FETCH
						-	NULL
						-	IS NOT NULL
						-	LIKE
				
				DATASET TAKEN FROM EFOREXCEL AT:
				
				https://eforexcel.com/wp/downloads-18-sample-csv-files-data-sets-for-testing-sales/
				
				IMPORTED TABLE NAME IS:		5m-Sales-Records
		
====================================================================================
*/

------------------------------------------------------------------------------------

/*
====================================================================================

							GROUP BY
							
		
		Still too much data and don't know wher to kick your head?
		Do you know you can GROUP data in order to display some basic infos, like
		how may item types have been sold per single country?
		
====================================================================================
*/	


SELECT 
    COUNTRY, COUNT(ITEM_TYPE) 
FROM SALES_RECORDS
GROUP BY COUNTRY;

-- FIRST 20 ROWS
/*

COUNTRY				ITEM_TYPE
-----------------------------------
Saint Lucia			26970
United Kingdom		27024
Malawi				27043
Monaco				27082
Djibouti			27021
Zimbabwe			26927
Grenada				26927
Andorra				27115
Nigeria				26948
Kyrgyzstan			27033
Tajikistan			26978
Malaysia			26875
Hungary				27042
Germany				27054
Guinea				26968
Pakistan			27110
Equatorial Guinea	27007
Morocco				27085
Nauru				27092
Uzbekistan			26942

*/

------------------------------------------------------------------------------------

/*
====================================================================================

							ORDER BY
							
		
		What if you'd like to alphabetically sort your data?
		One of the commonest predicate: ORDER BY
		
====================================================================================
*/	


SELECT 
    DISTINCT(COUNTRY)
FROM SALES_RECORDS
ORDER BY COUNTRY;

-- FIRST 20 ROWS
/*

COUNTRY
--------------------------
Afghanistan
Albania
Algeria
Andorra
Angola
Antigua and Barbuda 
Armenia
Australia
Austria
Azerbaijan
Bahrain
Bangladesh
Barbados
Belarus
Belgium
Belize
Benin
Bhutan
Bosnia and Herzegovina
Botswana

*/

------------------------------------------------------------------------------------

/*
====================================================================================

							FETCH
							
		
		Do you really want to fetch your 1 million table rows?
		What if you can extract just the first 10 rows only?
		
====================================================================================
*/	

-- FETCH
SELECT ORDER_ID
FROM SALES_RECORDS
FETCH FIRST 10 ROWS ONLY;
-- FIRST 10 ROWS ONLY

/*

ORDER_ID
--------------------------
731556689
335026204
109841239
995113122
400265681
755035245
959470641
433933198
469096744
175947606

*/

------------------------------------------------------------------------------------

/*
====================================================================================

							IS NULL
							
		
		IS NULL acts as a powerful predicate in your WHERE condition:
		it helps you extract your desidered SELECT elements by fetching just
		NULLABLE values!
		
====================================================================================
*/	

-- NULL
SELECT ORDER_PRIORITY
FROM SALES_RECORDS
WHERE ORDER_PRIORITY IS NULL;

-- NO RESULTS

------------------------------------------------------------------------------------

/*
====================================================================================

							NOT NULL
							
		On the opposite, expect to fetch data values from a NOT NULL predicate!
		
====================================================================================
*/	

-- NOT NULL
SELECT ORDER_PRIORITY
FROM SALES_RECORDS
WHERE ORDER_ID IS NOT NULL;

-- FIRST 20 ROWS ONLY
/*

ORDER_PRIORITY
---------------
	M
	H
	L
	L
	C
	H
	M
	L
	L
	L
	M
	H
	L
	L
	L
	M
	C
	M
	M
	H

*/

------------------------------------------------------------------------------------

/*
====================================================================================

							NOT NULL
							
		At least, here's one of the most useful commands you'll use when dealing
		with messy data: LIKE!
		
		This predicate leverages your SQL code by finding everything SIMILAR to your
		desired results.
		
		As an example, I'd like to find every region and country suddendly by searching for 
		a specific ITEM_TYPE: FRUIT, even if I don't well remember whole word!
		
====================================================================================
*/	

-- LIKE
SELECT 
    REGION, 
    COUNTRY
FROM SALES_RECORDS
WHERE ITEM_TYPE LIKE 'Fru%';

-- FIRST 20 ROWS ONLY
/*
REGION								COUNTRY
---------------------------------------------------------
Sub-Saharan Africa					Zimbabwe
Middle East and North Africa		Pakistan
Sub-Saharan Africa					Guinea-Bissau
Asia								Kazakhstan
Australia and Oceania				Samoa 
Sub-Saharan Africa					Cote d'Ivoire
Australia and Oceania				Marshall Islands
Europe								Belgium
Australia and Oceania				Kiribati
Australia and Oceania				New Zealand
Australia and Oceania				Nauru
Middle East and North Africa		Saudi Arabia
Europe								Lithuania
Europe								Portugal
Sub-Saharan Africa					Central African Republic
Europe								Greece
Central America and the Caribbean	Grenada
Sub-Saharan Africa					Sao Tome and Principe
Europe								Portugal
Middle East and North Africa		Egypt

*/



