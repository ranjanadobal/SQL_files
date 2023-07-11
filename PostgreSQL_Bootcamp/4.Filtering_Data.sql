/* Filtering Data*/
/*Select the top 5 biggest movies by 
movie length */
SELECT 
movie_name
FROM movies
ORDER BY movie_length DESC
LIMIT 5;

/*Select the top 5 oldest American 
directors*/
SELECT 
first_name, last_name
FROM directors
WHERE nationality = 'American'
ORDER BY date_of_birth ASC
LIMIT 5;

/* Select the top 10 youngest 
male actors*/
SELECT 
*
FROM actors
WHERE 
	gender = 'M'
ORDER BY date_of_birth DESC
LIMIT 5;

/*Select the top 10 most profitable
domestic movies*/
SELECT 
*
FROM movies_revenues
ORDER BY revenues_domestic DESC NULLS LAST
LIMIT 10;

/* Select 5 films starting from the fifth 
movie ordered by movie_id*/
SELECT 
*
FROM movies
ORDER BY movie_id DESC NULLS LAST
LIMIT 5 OFFSET 4;

/*Select the top 5 movies starting 
from the movie with the 6th highest
domestic profits*/
SELECT 
*
FROM movies_revenues
ORDER BY revenues_domestic DESC NULLS LAST
LIMIT 5 OFFSET 5;

/*Select the first 5 movies ordered
by movie_id */
SELECT 
*
FROM movies
FETCH FIRST 5 ROW ONLY

/*Select the top 5 longest movies 
by movie length*/
SELECT 
*
FROM movies
ORDER BY movie_length DESC
FETCH FIRST 5 ROW ONLY;

/*Select the top 5 oldest directors*/
SELECT 
*
FROM directors
ORDER BY date_of_birth ASC
FETCH FIRST 5 ROW ONLY;

/*Select the top 10 youngest 
male actors*/
SELECT 
*
FROM actors
WHERE 
	gender = 'M'
ORDER BY date_of_birth DESC
FETCH FIRST 10 ROW ONLY; 

/*Select the first 5 movies after 
the 5th movie and order the results 
by movie_length*/
SELECT 
*
FROM movies
ORDER BY movie_length DESC
FETCH FIRST 5 ROW ONLY
OFFSET 5;

/*Select all the movies with 
English, Chinese, and Japanese languages
and order the results by movie_language*/
SELECT 
*
FROM movies
WHERE 
	movie_lang IN( 'American', 'Chinese', 'Japanese')
ORDER BY movie_lang DESC;

/*Select all the movies where age 
certificate is 13 and PG type*/
SELECT 
*
FROM movies
WHERE 
	age_certificate IN( '13', 'PG');

/*Select all the movies where age 
certificate is 13 and PG type and order the
 results by age_certificate*/
SELECT 
*
FROM movies
WHERE 
	age_certificate IN( '13', 'PG')
ORDER BY age_certificate ASC;

/*Select all the movies where 
director_id is not 13 or 10*/
SELECT 
*
FROM movies
WHERE 
	director_id NOT IN( 13, 10)
ORDER BY director_id;

/*Select all the actors where 
actor_id is not 1,2,3,4*/
SELECT 
*
FROM actors
WHERE 
	actor_id NOT IN(1,2,3,4)
ORDER BY actor_id;

/*Select all the actors whose
birth_date is between 1991 and 1995*/
SELECT 
*
FROM actors
WHERE
	date_of_birth BETWEEN '1991-01-01' AND '1995-12-31'
ORDER BY date_of_birth;  

/*Select all the movies released 
between 1998 and 2002*/
SELECT 
*
FROM movies
WHERE
	release_date BETWEEN '1998-01-01' AND '2002-12-31'
ORDER BY release_date; 

/*Select all the movies for which 
domestic revenues are between 100 and 300*/
SELECT 
*
FROM movies_revenues
WHERE
	revenues_domestic BETWEEN 100 AND 300
ORDER BY revenues_domestic;  

/*Select all the movies for which 
movie length is between 100 and 200*/
SELECT 
*
FROM movies
WHERE
	movie_length BETWEEN 100 AND 200
ORDER BY movie_length; 

/*Select all the actors whose 
first name starts with ‘A’*/
SELECT 
*
FROM actors
WHERE
	first_name LIKE 'A%'
ORDER BY first_name;

/*Select all the actors 
whose last name ends with ‘a’*/
SELECT 
*
FROM actors
WHERE
	last_name LIKE '%a'
ORDER BY last_name;

/*Select all the actors whose 
first name has only 5 characters*/
SELECT 
*
FROM actors
WHERE
	first_name LIKE '_____'
ORDER BY first_name;

/*Select all the actors whose first name
contains ‘l’ in the second place*/
SELECT 
*
FROM actors
WHERE
	first_name LIKE '_l%'
ORDER BY first_name;

/*Select all the actors whose first name
has ‘tim’*/
SELECT 
*
FROM actors
WHERE
	first_name LIKE '%tim%';
	
/*Select all the actors whose first name
has ‘Tim’ or ‘tim’*/
SELECT 
*
FROM actors
WHERE
	first_name ILIKE '%tim%';
	
/*Select all the actors with 
missing date of birth values*/
SELECT 
*
FROM actors
WHERE
	date_of_birth IS NULL
ORDER BY date_of_birth; 

/* Select all the actors with missing
date of birth or missing first name*/
SELECT 
*
FROM actors
WHERE
	date_of_birth  IS NULL
	OR first_name IS NULL
ORDER BY first_name; 

/* Select all the movies where 
domestic revenues is NULL*/
SELECT 
*
FROM movies_revenues
WHERE 
	revenues_domestic IS NULL
ORDER BY revenues_domestic;
	
/* Select all the movies for which 
either domestic or international revenues 
is NULL*/
SELECT 
*
FROM movies_revenues
WHERE 
	revenues_domestic IS NULL 
	OR revenues_international IS NULL;	
	
/* Select all the movies for which 
domestic revenues are NOT NULL*/
SELECT 
*
FROM movies_revenues
WHERE 
	revenues_domestic IS NOT NULL; 

/* Concatenation Techniques*/
/* Concatenate ‘Hello’ and ‘World’*/
SELECT 'Hello' || 'World' AS new_string;
SELECT 'Hello' || ' ' || 'World' AS new_string;

/* Concatenate actor first name and
last name as ‘Actor Name’*/
SELECT CONCAT(first_name, ' ', last_name) 
AS "Actor Name"
FROM actors
ORDER BY first_name;

/* Concatenate first_name, last_name, 
and date_of_birth of all actors separated 
by comma*/
SELECT 
	CONCAT_WS(',',first_name, 
			  last_name, date_of_birth)
FROM actors
ORDER BY first_name;











