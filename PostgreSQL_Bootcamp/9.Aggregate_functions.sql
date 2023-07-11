/*Aggregate Functions*/
/*Count total number of movies*/
SELECT COUNT(*) FROM movies;

/*Count number of rows in movie_length
column in movies*/
SELECT COUNT(movie_length) FROM movies;

/*Count number of rows in movie_lang
column in movies*/
SELECT 
	COUNT(movie_lang) 
FROM movies;

/*Count district number of rows
in movie_lang column in movies*/
SELECT 
	COUNT(DISTINCT(movie_lang)) 
FROM movies;

/*Count district number of rows
in director_id column in movies*/
SELECT 
	COUNT(DISTINCT(director_id)) 
FROM movies;

/*Count all English movies*/
SELECT 
	COUNT(*) 
FROM movies
WHERE 
	movie_lang = 'English';

/*Count all Japanese movies. 
Order by movie_lang*/
SELECT * FROM movies
WHERE 
	movie_lang = 'Japanese'
ORDER BY movie_lang ASC;

/*Select total domestic revenues 
of all movies*/
SELECT 
	SUM(revenues_domestic)
FROM movies_revenues;

/*Select total domestic revenues
for all movies where domestic revenues 
is greater than 200*/
SELECT 
	SUM(revenues_domestic)
FROM movies_revenues
WHERE 
	revenues_domestic > 200;

/*Select total movie_length
for all English movies*/
SELECT 
	SUM(movie_length)
FROM movies
WHERE 
	movie_lang = 'English';

/*Select total domestic revenues
for all movies where domestic revenues 
are not duplicate values*/
SELECT 
	SUM(DISTINCT revenues_domestic)
FROM movies_revenues

/*Select the longest movie_length 
for English movies*/
SELECT 
	MAX(movie_length)
FROM movies
WHERE 
	movie_lang = 'English';

/*Select the maximum release 
date for English movies*/
SELECT 
	MAX(release_date)
FROM movies
WHERE 
	movie_lang = 'English';

/*Select the minimum release 
date for Chinese movies*/
SELECT 
	MIN(release_date)
FROM movies
WHERE 
	movie_lang = 'Chinese';

/*Select the greatest of the
three numbers*/
SELECT GREATEST(200,20,30);

/*Select the least of the
three numbers*/
SELECT LEAST(-10,10,45);

/* Select the greatest and 
least revenues for each movie*/
SELECT 
	movie_id,

	revenues_domestic,
	revenues_international,
	GREATEST(revenues_domestic,revenues_international) as "Greatest",
	LEAST(revenues_domestic,revenues_international) as "Least"
FROM movies_revenues;

/* Select average movie length 
for all English movies*/
SELECT 
	AVG(movie_length)		
FROM movies
WHERE 
	movie_lang = 'English';

/* Select movie_id, revenues_domestic, 
revenues_international, and total revenues 
for all movies and order by decreasing 
total revenues*/
SELECT 
	movie_id,
	revenues_domestic,
	revenues_international,
	(revenues_domestic + revenues_international) AS "total revenue"
FROM movies_revenues
WHERE (revenues_domestic + revenues_international) IS NOT NULL
ORDER BY 4 DESC NULLS LAST





