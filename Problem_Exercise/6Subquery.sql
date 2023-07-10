/*Subquery*/
/*Select movie_name, movie_length for
movies for which movie_length is greater 
than average movie_length.
Order by decreasing movie_length*/
SELECT 
	movie_name,
	movie_length
FROM movies
WHERE movie_length > 
(
	SELECT 
	AVG(movie_length)
	FROM movies
)
ORDER BY movie_length DESC

/*Select movie_name, movie_length for
movies for which movie_length is greater 
than average movie_length for English movies.
Order by decreasing movie_length*/
SELECT 
	movie_name,
	movie_length
FROM movies
WHERE movie_length > 
(
	SELECT 
	AVG(movie_length)
	FROM movies
	WHERE movie_lang = 'English'
)
ORDER BY movie_length DESC

/*Select movie_name, movie_length for 
Chinese movies for which movie_length 
is greater than average movie_length 
for English movies.
Order by decreasing movie_length*/
SELECT 
	movie_name,
	movie_length
FROM movies
WHERE movie_length > 
(
	SELECT 
	AVG(movie_length)
	FROM movies
	WHERE movie_lang = 'English'
)
AND movie_lang = 'Chinese'
ORDER BY movie_length DESC

/*Select first and last names, and 
date of birth for all actors who are 
younger than Douglas Silva.
Order the results by decreasing 
date of birth*/	
SELECT 
	first_name,
	last_name,
	date_of_birth
FROM actors
WHERE 
	date_of_birth > 
(
	SELECT 
		date_of_birth
	FROM actors
	WHERE first_name = 'Douglas'
)
ORDER BY date_of_birth DESC

/*Select movie_name, and movie_lang 
for all movies for which domestic 
revenues are greater than 200. */	
SELECT 
	movie_name,
	movie_lang
	
FROM movies
WHERE 
	movie_id IN
( 
	SELECT 
			movie_id
	FROM movies_revenues
	WHERE 
		revenues_domestic > 200
 );

/*Select movie_name, and movie_id 
for all movies for which domestic 
revenues are higher than the international 
revenues */
SELECT 
	movie_name,
	movie_id
	
FROM movies
WHERE 
	movie_id IN
	( 
		SELECT 
				movie_id
		FROM movies_revenues
		WHERE 
			revenues_domestic > revenues_international
	 );
	 
/*Select director first_name, last_name, 
director_id, movie_name, movie_lang, and 
sum of  domestic and international revenues 
for the English movies which made more 
than the average total revenues of all movies.
Order by decreasing total revenues
*/
SELECT 
	d.first_name,
	d.last_name,
	d.director_id,
	
	mv.movie_name, 
	mv.movie_lang,
	sum(r.revenues_domestic + r.revenues_international) as "total_revenues"
FROM  directors d
INNER JOIN movies mv ON mv.director_id = d.director_id
INNER JOIN movies_revenues r ON r.movie_id = mv.movie_id
WHERE 
	movie_lang = 'English' AND
	(r.revenues_domestic + r.revenues_international) > 
(
	SELECT 
		AVG(revenues_domestic + revenues_international) as "avg_total_revenues" 
	FROM movies_revenues
)
GROUP BY d.director_id,mv.movie_name,mv.movie_lang
ORDER BY 6 DESC;

/*Select director_id, and 
sum of  domestic and international revenues 
for the movies which made more 
than the average total revenues of all movies.
Order by decreasing total revenues
and increasing director_id
*/
SELECT 
	d.director_id,
	
	sum(r.revenues_domestic + r.revenues_international) as "total_revenues"
FROM  directors d
INNER JOIN movies mv ON mv.director_id = d.director_id
INNER JOIN movies_revenues r ON r.movie_id = mv.movie_id
WHERE 
	(r.revenues_domestic + r.revenues_international) > 
(
	SELECT 
		AVG(revenues_domestic + revenues_international) as "avg_total_revenues" 
	FROM movies_revenues
)
GROUP BY d.director_id
ORDER BY 2 DESC, 1 ASC; 

/*Select first_name from actors and 
directors and group them by actors and 
directors column */
SELECT *
FROM 
(
	SELECT first_name, 0 myorder, 'actors' as "tablename" FROM actors
	UNION 
	SELECT first_name, 1, 'directors' as "tablename" FROM directors
) t
ORDER BY myorder;

/*Select min, max and avg domestic revenues*/
SELECT 
(
	SELECT MAX(revenues_domestic) as "Max Domestic Revenues" FROM movies_revenues
),
(
	SELECT MIN(revenues_domestic) as "Min Domestic Revenues" FROM movies_revenues
),
(
	SELECT AVG(revenues_domestic) as "Avg Domestic Revenues" FROM movies_revenues
)

/*Select movie_name, movie_language, 
movie_length, movie age certificate 
for all movies with an above minimum 
length for each age certificate.
Order by increasing movie_length */
SELECT
	mv1.movie_name,
	mv1.movie_lang,
	mv1.movie_length,
	mv1.age_certificate
FROM movies mv1
WHERE mv1.movie_length > 
(
	SELECT 
		MIN(movie_length)
	FROM movies mv2
	WHERE mv1.age_certificate = mv2.age_certificate
)
ORDER BY mv1.movie_length ASC

/*Select first name, last name, and 
date of birth for the actors older 
than the youngest actor for each gender
Order by gender and date of birth*/
SELECT
	ac1.first_name,
	ac1.last_name,
	ac1.gender,
	ac1.date_of_birth
FROM actors ac1
WHERE 
	ac1.date_of_birth >
(
	SELECT 
		MIN(date_of_birth)
	FROM actors ac2
	WHERE ac1.gender = ac2.gender
)
ORDER BY ac1.gender, ac1.date_of_birth 

/*Select all suppliers which have same 
country as customers in the northwind database*/
SELECT 
	*
FROM suppliers
WHERE 
	country IN (SELECT country FROM customers);
	
/*Select customers details where they ordered 
more than 20 items in a single order 
in the northwind database*/
SELECT
*
FROM customers
WHERE customer_id = ANY
	(
	SELECT 
		customer_id
	FROM orders o
	INNER JOIN order_details od ON o.order_id = od.order_id
	where quantity > 20 
	)
	
/*Select products where their order amount 
was lower than the average amount of all 
the products in the northwind database*/
SELECT
*
FROM products p
INNER JOIN order_details od ON p.product_id = od.product_id
WHERE 
	((od.unit_price*od.quantity) - od.discount) < ALL
	(
	SELECT
		AVG((od.unit_price*od.quantity) - od.discount)
	FROM order_details od
	GROUP BY product_id	
	)

/*Select suppliers with products 
that cost less than $100 
in the northwind database*/
SELECT
*
FROM suppliers
WHERE EXISTS(
	SELECT
	*
	FROM products
	WHERE 
		unit_price < 100 
		AND products.supplier_id = suppliers.supplier_id
	ORDER BY unit_price DESC
)





