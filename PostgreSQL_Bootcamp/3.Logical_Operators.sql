/*Logical Operators*/

/*Select all the movies with movie 
language English and with age certificate 18
*/
SELECT *
FROM movies
WHERE 
	movie_lang = 'English' 
	AND age_certificate = ’18’
	
/*Select all the movies with movie_language
English or Chinese */
SELECT *
FROM movies
WHERE 
	movie_lang = 'English'
	OR movie_lang = 'Chinese';
	
/*Select movies with movie language English 
or Chinese and order the results by movie language */
SELECT *
FROM movies
WHERE 
	movie_lang = 'English'
	OR movie_lang = 'Chinese'
ORDER BY movie_lang;

/* Select all the movies in English language 
AND the director_id is equal to 8 */
SELECT *
FROM movies
WHERE 
	movie_lang = 'English'
	AND director_id = '8';

/*Select movies where movie language is 
either English or Chinese and age_certificate
is 12 */
SELECT *
FROM movies
WHERE 
	(movie_lang = 'English'
	OR movie_lang = 'Chinese')
	AND age_certificate = '12';

/*Select all the movies where movie length 
is greater than 100*/
SELECT 
*
FROM movies
WHERE 
	movie_length > 100;
	
/*Select all the movies where movie
length is greater than 100 and order
the results by movie_length*/
SELECT 
*
FROM movies
WHERE 
	movie_length > 100
ORDER BY movie_length;

/*Select all the movies where movie length 
is greater than and equal to 100*/
SELECT 
*
FROM movies
WHERE 
	movie_length >= 107
ORDER BY movie_length;

/*Select all the movies where movie 
length is less 100*/
SELECT 
*
FROM movies
WHERE 
	movie_length < 107
ORDER BY movie_length;	










	
	

