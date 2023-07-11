/*Window Functions*/
/*Create trades table with 5 columns */
CREATE TABLE trades(
	region text,
	country text,
	year int,
	imports numeric (50,0),
	exports numeric (50,0)
);

/*Insert values into trades table
by running trades.sql file*/

/*Select data from the trades table*/
SELECT * FROM trades;
/*Count the number of records in the trades table*/
SELECT COUNT(*) FROM trades;
/*Select distinct regions from the 
trades table*/ 
SELECT DISTINCT(region) FROM trades;
ORDER BY region;

/*Select distinct country from the 
trades table*/ 
SELECT DISTINCT(country) FROM trades
ORDER BY country;

/*Select minimum and maximum year from the 
trades table*/ 
SELECT MIN(year), MAX(year) FROM trades;

/*Select minimum, maximum, 
and average of imports from the 
trades table*/ 
SELECT 
	MIN(imports), 
	MAX(imports),
	AVG(imports)
FROM trades;

/*Select minimum, maximum, 
and average of imports by region 
from the trades table*/
SELECT 
	region,
	ROUND(MIN(imports)/100000,0) as min,
	ROUND(MAX(imports)/100000,0) as max,
	ROUND(AVG(imports)/100000,0) as avg
FROM trades
GROUP BY region;

/*Select minimum, maximum, 
and average exports by region 
from the trades table for the years >= 2010. 
Order by decreasing average exports*/
SELECT 
	region,
	ROUND(MIN(exports)/1000000,0) as min,
	ROUND(MAX(exports)/1000000,0) as max,
	ROUND(AVG(exports)/1000000,0) as avg
FROM trades
WHERE year >= 2010
GROUP BY region
ORDER BY 3 DESC;

/*Select distinct countries 
from the trades table in the 
region South America */
SELECT DISTINCT(country) 
FROM trades 
WHERE region = 'SOUTH AMERICA'

/*Select columns country, year,
import, exports, and overall 
average exports*/
SELECT country, year, imports, exports, avg(exports) 
OVER() as avg_exports
FROM trades;

/*Select columns country, year,
import, exports, and average 
exports for year <2000*/
SELECT country, year, imports, exports, avg(exports) 
OVER(PARTITION BY year < 2000) as avg_exports
FROM trades;

/*Update exports and imports data 
into millions format*/
UPDATE trades
SET 
imports = round(imports/1000000,2),
exports = round(exports/1000000,2)

/*Select country, year, exports and 
a minimum of exports data by country for 
USA and France and year >2001. 
Order by year within each country*/
SELECT 
	country,
	year,
	exports,
	min(exports) OVER (PARTITION BY country ORDER BY year)
FROM trades
WHERE 
	year > 2001
	AND country IN ('USA', 'France');

/*Select country, year, exports,
minimum and maximum of exports data 
for USA and year > 2000 by comparing 
the current row and the previous rows. 
Order the results by year*/
SELECT 
	country,
	year,
	exports,
	MIN(exportS) OVER (w),
	MAX(exports) OVER (w)
FROM trades
WHERE 
	country ='USA'
	AND year > 2000
WINDOW w AS (ORDER BY year);

/*Another way of writing this query*/
/*Select country, year, exports,
minimum and maximum of exports data 
for USA and year > 2000 by comparing 
the current row and the previous rows. 
Order the results by year*/
SELECT 
	country,
	year,
	exports,
	MIN(exportS) OVER w,
	MAX(exports) OVER w
FROM trades
WHERE 
	country ='USA'
	AND year > 2000
WINDOW w AS (ORDER BY year ROWS
			 BETWEEN UNBOUNDED PRECEDING 
			 AND CURRENT ROW);
			 
/*Select country, year, exports,
minimum and maximum of exports data 
for USA and year > 2000 by comparing 
the current row with 1 previous and 
2 following rows. 
Order the results by year*/			 
SELECT 
	country,
	year,
	exports,
	MIN(exports) OVER w,
	MAX(exports) OVER w
FROM trades
WHERE 
	country ='USA'
	AND year > 2000
WINDOW w AS (ORDER BY year ROWS
			 BETWEEN 1 PRECEDING AND 2 FOLLOWING);

/*Select year, exports,and rank 
as per increasing exports for USA*/	
SELECT 
	year,
	exports,
	RANK() OVER (ORDER BY exports) as r
FROM trades
WHERE 
	country = 'USA';
	
/*Select year, exports, and rank 
as per decreasing exports for USA. 
Select top 10 results*/	
SELECT 
	year,
	exports,
	RANK() OVER (ORDER BY exports DESC) as r
FROM trades
WHERE 
	country = 'USA'
LIMIT 10;

/*Select year, exports, and rank 
as per decreasing exports for USA. 
Select top 10 results*/	
SELECT 
	year,
	exports,
	RANK() OVER (ORDER BY exports DESC) as r
FROM trades
WHERE 
	country = 'USA'
LIMIT 10;

/*Select year, exports, and rank 
as per decreasing exports for USA. 
Use this query to select results for 
rank 5
*/	
SELECT
*
FROM 
(
	SELECT 
	year,
	exports,
	RANK() OVER (ORDER BY exports DESC) as r
	FROM trades
	WHERE 
		country = 'USA'
	LIMIT 10
) as T
WHERE r = 5;

/*Select year, exports, and rank 
as per decreasing exports for USA. 
Use this query to select results for 
rank 5*/
SELECT
*
FROM 
(
	SELECT 
	year,
	exports,
	RANK() OVER (ORDER BY exports DESC ROWS 
	BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as r
	FROM trades
	WHERE 
		country = 'USA'
	LIMIT 10
) as T
WHERE r = 5;

/*Select year, exports, and Ntile 
for USA from the year 2000 into 
4 buckets*/
SELECT 
	year,
	exports,
	NTILE(4) OVER (ORDER BY exports) 
FROM trades
WHERE 
	country = 'USA' AND 
	year > 2000

/*Select exports, year, and Ntile 
from the year 2000 into 
5 buckets. Partition the results 
by country for USA, Belgium, France.*/
SELECT 
	country,
	year,
	exports,
	NTILE(5) OVER (PARTITION BY country ORDER BY exports) 
FROM trades
WHERE 
	country IN ('USA','France', 'Belgium') AND 
	year > 2000

/*Select exports, year, and Ntile 
from the year 2000 into 
5 buckets. Partition the results 
by year and order by increasing 
exports for USA, Belgium, France.*/
SELECT 
	country,
	year,
	exports,
	NTILE(5) OVER (PARTITION BY year ORDER BY exports) 
FROM trades
WHERE 
	country IN ('USA','France', 'Belgium') AND 
	year > 2000

/*Select exports, year, and Ntile 
from the year 2000 divided into 
5 buckets. Partition the results 
by year and order by increasing 
exports for USA, Belgium, France. 
Select results for rank 2*/
SELECT 
	*
FROM
(
	SELECT 
		country,
		year,
		exports,
		NTILE(5) OVER (PARTITION BY year ORDER BY exports) as r 
	FROM trades
	WHERE 
		country IN ('USA','France', 'Belgium') AND 
		year > 2000
) as T
WHERE r = 2;

/*Select exports, year, and the 
next value in the exports column 
for Belgium. Order by increasing year */
SELECT
	year,
	exports,
	LEAD(exports,1) OVER (ORDER BY year)
FROM trades
WHERE 
	country = 'Belgium'

/*Select exports, year, and the 
leading second value in the exports column 
for Belgium. Order by increasing year */
SELECT
	year,
	exports,
	LEAD(exports,2) OVER (ORDER BY year)
FROM trades
WHERE 
	country = 'Belgium'

/*Select exports, year, and the 
leading second value in the exports column 
for Belgium. Order by decreasing year */
SELECT
	year,
	exports,
	LEAD(exports,2) OVER (ORDER BY year DESC)
FROM trades
WHERE 
	country = 'Belgium'

/*Select exports, year, and the 
previous (lagging) value in the 
exports column for Belgium. 
Order by decreasing year. 
Limit to 10 results */
SELECT
	year,
	exports,
	LAG(exports,1) OVER (ORDER BY year)
FROM trades
WHERE 
	country = 'Belgium'
LIMIT 10

/*Select exports, year, and the 
previous (lagging) value in the 
exports column for USA, Belgium 
and for year > 2010. 
Partition by year. Order by 
increasing year.*/
SELECT
	country,
	year,
	exports,
	LAG(exports,1) OVER (PARTITION BY year ORDER BY year)
FROM trades
WHERE 
	country IN ('USA','Belgium') AND
	year > 2010

/*Select year, imports, and 
repeat the 2nd value in the 
imports column in the Nth 
value column for Belgium 
Order by increasing year.*/
SELECT
	year,
	imports,
	NTH_VALUE(imports,2) OVER (ORDER BY year)
FROM trades
WHERE
	country = 'Belgium'

/*Select year, imports, country, 
and repeat the 1st value in the 
imports column in the First 
value column for USA, Belgium  
and year > 2014. Order by 
increasing year.*/
SELECT
	country,
	year,
	imports,
	FIRST_VALUE(imports) OVER (ORDER BY year)
FROM trades
WHERE
	country IN ('Belgium', 'USA') AND
	year > 2014

/*Select year, imports, country, 
and repeat the 1st value in the 
imports column in the First 
value column for each country for USA, Belgium  
and year > 2014. Order by 
increasing year.*/
SELECT
	country,
	year,
	imports,
	FIRST_VALUE(imports) OVER (PARTITION BY country ORDER BY year)
FROM trades
WHERE
	country IN ('Belgium', 'USA') AND
	year > 2014

/*Select year, imports, country, 
and repeat the 2nd value in the 
imports column in the First 
value column for each country for 
USA, Belgium and year > 2014. Order by 
increasing year.*/
SELECT
	country,
	year,
	imports,
	NTH_VALUE(imports,2) OVER (PARTITION BY country ORDER BY year)
FROM trades
WHERE
	country IN ('Belgium', 'USA') AND
	year > 2014






















