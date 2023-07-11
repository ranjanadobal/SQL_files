/*Grouping Data*/
/*Select movie_lang and 
count of movie_lang for all 
movies. Group the data by movie_lang*/
SELECT 
      movie_lang,
      COUNT(movie_lang)
FROM movies
GROUP BY movie_lang;

/*Select average movie_length 
and group by movie language*/
SELECT 
	movie_lang,
	ROUND(AVG(movie_length),2)
FROM movies
GROUP BY movie_lang;

/*Select the sum total movie 
length per age certificate*/
SELECT 
	age_certificate,
	ROUND(SUM(movie_length),2)
FROM movies
GROUP BY age_certificate;

/*Select Minimum and Maximum movie
length and group by movie language*/
SELECT 
	movie_lang,
	MAX(movie_length),
	MIN(movie_length)
FROM movies
GROUP BY movie_lang;

/*Select Minimum and Maximum movie
length and group by movie language. 
Order by the max(movie_length)*/
SELECT 
	movie_lang,
	MAX(movie_length),
	MIN(movie_length)
FROM movies
GROUP BY movie_lang
ORDER BY MAX(movie_length) DESC;

/*Select average movie length grouped
by movie language and age certification*/ 
SELECT 
	movie_lang,
	age_certificate,
	AVG(movie_length)
FROM movies
GROUP BY movie_lang, age_certificate;

/*Select average movie length grouped
by movie language and age certification. 
Order by movie_lang and average movie_length*/ 
SELECT 
	movie_lang,
	age_certificate,
	ROUND(AVG(movie_length),2) as "Avg movie length"
FROM movies
GROUP BY movie_lang, age_certificate
ORDER BY movie_lang, 3 DESC;

/*Select average movie length and 
group by movie language and age certificate
where movie length greater than 100. 
Order by movie_lang and Avg movie length*/
SELECT 
	movie_lang,
	age_certificate,
	ROUND(AVG(movie_length),2) as "Avg movie length"
FROM movies
WHERE 
	movie_length > 100
GROUP BY movie_lang, age_certificate
ORDER BY movie_lang, 3 DESC

/*Select movie_lang, age_certificate,
and avg movie_length from movies with 
movie length greater than 100. 
Group by movie language and age 
certificate. Order by movie length*/
SELECT 
	movie_lang,
	age_certificate,
	ROUND(AVG(movie_length),2) as "Avg movie length"
FROM movies
WHERE 
	movie_length > 100
GROUP BY movie_lang, age_certificate, movie_length
ORDER BY movie_length

/*Select average movie length and 
age_certificate.Group by age certificate for 
movies with age certificate = 15*/
SELECT 
	age_certificate,
	ROUND(AVG(movie_length),2) as "Avg movie length"
FROM movies
WHERE 
	age_certificate = '15'
GROUP BY age_certificate

/*Select the number of directors 
by each nationality*/
SELECT
	nationality,
	COUNT(*) AS "TOTAL DIRECTORS"
FROM directors
GROUP BY nationality
ORDER BY 2 DESC;

/*Select total sum of movie 
length for each age certificate 
and movie language combination. 
Order by total movie_length */
SELECT
	movie_lang,
	age_certificate,
	SUM(movie_length) AS "Total movie length"
FROM movies
GROUP BY age_certificate, movie_lang
ORDER BY 3 DESC;

/*Select movie lang and sum of 
movie_length for movies, group by 
movie_lang. Show the results for 
movies where sum total length of 
the movies is greater than 200.
Order by decreasing sum total 
of movie_length */
SELECT
	movie_lang,
	SUM(movie_length) AS "Total movie length"
FROM movies
GROUP BY movie_lang
HAVING SUM(movie_length) > 200 
ORDER BY SUM(movie_length) DESC

/*Select sum of movie_length, director_id, 
director first_name and last_name for movies,
group by director_id where 
sum of movie_length > 200. 
Order by decreasing sum of movie_length*/
SELECT
	SUM(m.movie_length) AS "Total movie length",
	
	d.director_id,
	d.first_name,
	d.last_name
FROM movies m
INNER JOIN directors d ON d.director_id = m.director_id
GROUP BY d.director_id
HAVING SUM(movie_length) > 200 
ORDER BY 1 DESC;

/*Select the movie language and 
sum of movie length for movies and 
group by movie_lang. Show results with 
sum total movie length greater 
than 200*/
SELECT
	movie_lang,
	sum(movie_length) as "Total movie length"
FROM movies
GROUP BY movie_lang
HAVING sum(movie_length) > 200
ORDER BY 2 DESC

/*Select movie language and 
sum of movie length for movies and 
group by movie_lang for movies with
movie length greater than 100. 
Order by sum of movie length*/
SELECT
	movie_lang,
	sum(movie_length) as "Total movie length"
FROM movies
WHERE movie_length > 100
GROUP BY movie_lang
ORDER BY 2 DESC;


























