/*JOINS*/
/*Select columns movie_id, movie_name,
director_id, and director first name from
the tables movies and directors in the
database movies*/
SELECT 
	mv.movie_id,
	mv.movie_name,
	mv.director_id,
	
	d.first_name
FROM movies mv
INNER JOIN directors d
ON mv.director_id = d.director_id

/*Select the columns movie_id, movie_name, 
director_id,movie_lang,and director first_name 
from the tables movies and directors 
for English language movies*/
SELECT 
	mv.movie_id,
	mv.movie_name,
	mv.director_id,
	mv.movie_lang,
	
	d.first_name
FROM movies mv
INNER JOIN directors d
ON mv.director_id = d.director_id
WHERE mv.movie_lang = 'English'

/*Select the columns movie_id, movie_name, 
director_id,and director first_name from
the tables movies and directors 
for English language movies and 
for director_id 3*/
SELECT 
	mv.movie_id,
	mv.movie_name,
	mv.director_id,
	
	d.first_name
FROM movies mv
INNER JOIN directors d
ON mv.director_id = d.director_id
WHERE mv.movie_lang = 'English'
AND d.director_id = 3

/*Select all the columns from
the tables movies and directors 
*/
SELECT 
	mv.*,
	
	d.*
FROM movies mv
INNER JOIN directors d
ON mv.director_id = d.director_id

/*Select all the columns from
the tables movies and directors 
*/
SELECT 
* 
FROM movies
INNER JOIN directors USING(director_id);

/*Select all the columns from
the tables movies, directors, 
movies_revenues for Japanese movies 
*/
SELECT *
FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id 
INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id 
WHERE 
	mv.movie_lang = 'Japanese'

/*Select movie_name, director first_name, 
last_name, and domestic revenues from
the tables movies, directors, and 
movies_revenues for Japanese movies 
*/
SELECT 
	mv.movie_name, 
	
	d.first_name,
	d.last_name,
	
	r.revenues_domestic
FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id 
INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id 
WHERE 
	mv.movie_lang = 'Japanese'


/*Select all the columns from
the tables movies, directors, and 
movies_revenues for Japanese, English,
and Chinese movies 
*/
SELECT 
*
FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id
INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id
WHERE 
	mv.movie_lang IN ('English', 'Chinese', 'Japanese')

/*Select all the columns from
the tables movies, directors, and 
movies_revenues for Japanese, English,
and Chinese movies for which domestic revenues > 100
*/
SELECT 
*
FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id
INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id
WHERE 
	mv.movie_lang IN ('English', 'Chinese', 'Japanese')
	AND r.revenues_domestic > 100

/*Select movie_name, director first_name, 
last_name, and domestic revenues from
the tables movies, directors, and 
movies_revenues for Japanese, English,
and Chinese movies for which domestic 
revenues > 100. 
Order the results by the 4th column in
decreasing order
*/
SELECT 
	mv.movie_name,
	
	d.first_name,
	d.last_name,
	
	r.revenues_domestic
FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id
INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id
WHERE 
	mv.movie_lang IN ('English', 'Chinese', 'Japanese')
	AND r.revenues_domestic > 100
ORDER BY 4 DESC

/*Select movie_name, director first_name, 
last_name, domestic revenues, international 
revenues, and an alias for the sum of 
domestic and international revenues 
from the tables movies, directors, and 
movies_revenues*/
SELECT
	mv.movie_name,
	
	d.first_name,
	d.last_name,
	
	r.revenues_domestic,
	r.revenues_international,
	
	(r.revenues_domestic + r.revenues_international) as "Total Revenues"
	
FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id
INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id

/*Select movie_name, director first_name, 
last_name, domestic revenues, international 
revenues, and an alias for the sum of 
domestic and international revenues 
from the tables movies, directors, and 
movies_revenues.
Order the results by the 6th column in 
decreasing order with NULLS last.
Select only top 5 results */
SELECT
	mv.movie_name,
	
	d.first_name,
	d.last_name,
	
	r.revenues_domestic,
	r.revenues_international,
	
	(r.revenues_domestic + r.revenues_international) as "Total Revenues"
	
FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id
INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id
ORDER BY 6 DESC NULLS LAST
LIMIT 5

/*Select movie_name, movie_lang, release date, 
director first_name, last_name, domestic revenues, 
international revenues, and an alias for the sum of 
domestic and international revenues 
from the tables movies, directors, and 
movies_revenues for the 10 highest revenue 
movies released between 2005 and 2008 
arranged in the decreasing order*/
SELECT 
	mv.movie_name,
	mv.movie_lang,
	mv.release_date,
	
	d.first_name,
	d.last_name,
	
	r.revenues_domestic,
	r.revenues_international,
	
	(r.revenues_domestic + r.revenues_international) as "Total Revenues"

FROM movies mv
INNER JOIN directors d ON mv.director_id = d.director_id
INNER JOIN movies_revenues r ON mv.movie_id = r.movie_id
WHERE 
	mv.release_date BETWEEN '2005-01-01' AND '2008-12-31'
ORDER BY 7 DESC NULLS LAST
LIMIT 10

/*Join table t1 with table t2
t1 is INT and t2 is VARCHAR
Use CAST to change datatype of t2.test 
to INT*/
CREATE TABLE T1 (TEST INT);

CREATE TABLE T2 (TEST VARCHAR(10))

SELECT 
*
FROM t1 
INNER JOIN t2 on t1.test = CAST(t2.test AS INT);


/*Select director first_name, last_name and 
movie_name for all the directors */
SELECT 
	d.first_name,
	d.last_name,
	
	mv.movie_name
FROM directors d
LEFT JOIN movies mv ON d.director_id = mv.director_id

/*Select director first_name, last_name,
movie_name, and movie_lang for English and
Chinese movies*/
SELECT 
	d.first_name,
	d.last_name,
	
	mv.movie_name,
	mv.movie_lang
FROM movies mv
LEFT JOIN directors d ON d.director_id = mv.director_id
WHERE 
	mv.movie_lang in ('English','Chinese')

/* Count the number of movies for 
each of the directors 
and arrange the results in 
descending order of the number 
of movies*/
SELECT 
	d.first_name,
	d.last_name,
	
	COUNT(*) AS "total_movies"
FROM directors d
LEFT JOIN movies mv ON d.director_id = mv.director_id
GROUP BY d.first_name,d.last_name 
ORDER BY COUNT(*) DESC;

/* Select movie name, age certificate, 
and director first name, last name, and 
nationality for each of the directors whose 
nationality are ‘American’, ‘Chinese’, and
‘Japanese’*/
SELECT 
	mv.movie_name,
	mv.age_certificate,
	
	d.first_name,
	d.last_name,
	d.nationality
FROM directors d
LEFT JOIN movies mv ON d.director_id = mv.director_id
WHERE nationality in ('American','Chinese','Japanese');

/*Select director first_name, last_name, 
and an alias for the sum of 
domestic and international revenues for 
each of the directors and arrange the 
results in the decreasing order of total revenues*/
SELECT 
	d.first_name,
	d.last_name,
	
	SUM(r.revenues_domestic + r.revenues_international) as "total_revenues"
FROM directors d
LEFT JOIN movies mv ON mv.director_id = d.director_id
LEFT JOIN movies_revenues r ON r.movie_id = mv.movie_id
GROUP BY d.director_id
HAVING SUM(r.revenues_domestic + r.revenues_international) > 0
ORDER BY 3 DESC NULLS LAST

/*Select movie name, director first 
and last name for all the movies*/
SELECT 
	d.first_name,
	d.last_name,
	
	mv.movie_name
FROM directors d
RIGHT JOIN movies mv ON mv.director_id = d.director_id;

/* Select movie name, movie_lang, director 
first name, and last name for all the 
English and Chinese movies. Order results
by director first name */
SELECT 
	d.first_name,
	d.last_name,
	
	mv.movie_name,
	mv.movie_lang
FROM directors d
RIGHT JOIN movies mv ON mv.director_id = d.director_id
WHERE 
	mv.movie_lang IN ('ENglish', 'Chinese')
ORDER BY d.first_name

/* Count the number of movies for all 
movies and group them by director*/
SELECT 
	d.first_name,
	d.last_name,
	
	COUNT(*) AS "total_movies"
	
FROM directors d
RIGHT JOIN movies mv ON mv.director_id = d.director_id
GROUP BY d.first_name, d.last_name
ORDER BY COUNT(*) DESC, d.first_name

/*Select director first_name, last_name, 
and an alias for the sum of 
domestic and international revenues for 
each of the movies and group the results 
by director_id.Arrange the results in the 
decreasing order of total revenues*/
SELECT 
	d.first_name,
	d.last_name,
	
	SUM(r.revenues_domestic + r.revenues_international) as "total_revenues"
FROM directors d
RIGHT JOIN movies mv ON mv.director_id = d.director_id
LEFT JOIN movies_revenues r ON r.movie_id = mv.movie_id
GROUP BY d.director_id
HAVING SUM(r.revenues_domestic + r.revenues_international) > 0
ORDER BY 3 DESC NULLS LAST

/* Select movie name, director 
first name, and last name for all the 
directors and movies. Order results
by director first name */
SELECT 
	d.first_name,
	d.last_name,
	
	mv.movie_name
FROM directors d 
FULL JOIN movies mv ON mv.director_id = d.director_id
ORDER BY d.first_name

/* Select movie name, movie_lang, director 
first name, and last name for all the 
directors and English and Chinese movies. */
SELECT 
	d.first_name,
	d.last_name,
	
	mv.movie_name,
	mv.movie_lang
FROM movies mv
FULL JOIN directors d ON d.director_id = mv.director_id
WHERE 
	mv.movie_lang in ('English','Chinese')
	
/* Select all columns from the inner join of 
actors, movies_actors, movies, directors, 
and movies_revenues tables*/
SELECT 
*
FROM actors ac
JOIN movies_actors ma ON ma.actor_id = ac.actor_id
JOIN movies mv ON mv.movie_id = ma.movie_id
JOIN directors d ON d.director_id = mv.director_id
JOIN movies_revenues r ON r.movie_id = mv.movie_id	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	












