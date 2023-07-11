/*Common Table Expressions(CTEs)*/
/*Select all the movies with director_id 1*/
WITH cte_director_1 AS 
(
	SELECT * 
	FROM movies mv
	INNER JOIN directors d ON d.director_id = mv.director_id
	WHERE d.director_id =1
)
SELECT * FROM cte_director_1;

/*Select all the movies that are longer 
than or equal to 120 hours*/
WITH cte_long_movies AS 
(
	SELECT * 
	FROM movies mv
	WHERE mv.movie_length >= 120
)
SELECT * FROM cte_movies;

/*Calculate total_revenues for each 
of the directors with their first_name, 
last_name and director_id */
WITH cte_movie_count AS
(
	SELECT
		d.director_id,
		SUM(r.revenues_domestic + r.revenues_domestic) AS total_revenues
	FROM directors d
	INNER JOIN movies mv ON mv.director_id = d.director_id
	INNER JOIN movies_revenues r ON r.movie_id = mv.movie_id
	GROUP BY d.director_id
)
SELECT 
	d.director_id,
	d.first_name,
	d.last_name,
	cte.total_revenues
FROM cte_movie_count cte
INNER JOIN directors d ON d.director_id = cte.director_id



























