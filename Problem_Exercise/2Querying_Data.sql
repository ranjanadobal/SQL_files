/*Querying Data*/

/*Select all the data from actors table*/
SELECT * FROM actors;

/*Select only the first_column from the 
actors table*/
SELECT first_name FROM actors;

/*Select the columns first_name and last_name
from the actors table*/
SELECT first_name, last_name FROM actors;

/*Select the columns movie_name, 
movie_lang from the movies table*/
SELECT movie_name, movie_lang FROM movies;	

/*Create an alias for the column 
first_name from actors table*/
SELECT first_name AS "firstName" FROM actors;

/*Concatenate the first name and last name 
from the actors table*/
SELECT first_name || last_name 
FROM actors

/*Insert space between the first name and 
second name in the alias column Full Name */
SELECT 
first_name || ' ' || last_name AS "Full Name" 
FROM actors;

/*Select all the English language movies*/
SELECT *
FROM movies
WHERE 
	movie_lang = ‘English’;
	

	





