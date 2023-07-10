/* Create a database db_test and then delete it */
CREATE DATABASE db_test

DROP DATABASE db_test

/* Create a database movies */
CREATE DATABASE movies
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
/*Create a table actors with 8 columns */ 
CREATE TABLE actors (
	actor_ID SERIAL PRIMARY KEY, 
	first_name VARCHAR(150),
	last_name VARCHAR(150)NOT NULL,
	gender CHAR(1),
	date_of_birth DATE,
	add_date DATE,
	update_date DATE, 
	add_by VARCHAR(100)
);

/*Create a table directors with 7 columns */
CREATE TABLE directors (
	Director_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
    	last_name VARCHAR(150), 	
	date_of_birth DATE,
	nationality VARCHAR(20),
	add_date DATE,
	update_date DATE
);

/*Create table movies with 7 columns with movie_id as the primary key and director_id as the foreign key*/
CREATE TABLE movies (
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR (100)NOT NULL,
	movie_length INT,
	movie_lang VARCHAR(20),
	age_certificate VARCHAR(10),
	release_date DATE,
	director_id INT REFERENCES directors (director_id)
);

/*Create table movies_revenues with 4 columns with revenue_id as the primary key and movie_id as the foreign key*/
CREATE TABLE movies_revenues(
	revenue_id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES movies (movie_id),
	revenues_domestic NUMERIC(10,2),
	revenues_international NUMERIC (10,2)
);

/*Create a table customers with 5 columns */
CREATE TABLE customers (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(150),
	age INT
);
	
/*Create a movies_actors junction table */
CREATE TABLE movies_actors (
	movie_id INT REFERENCES movies (movie_id),
actor_id INT REFERENCES actors (actor_id),
PRIMARY KEY (movie_id, actor_id)
);	

/*Insert data into the customers table with values 
in the three columns : first_name, last_name, email, age*/
INSERT INTO customers (first_name, last_name, email, age)
VALUES('Ranj','Dob', 'a@b.com',40)
	
/* Delete tables from a database*/
DROP TABLE actors;	

/*Insert data in two columns in the table customers*/
INSERT INTO customers (first_name, last_name)
VALUES 
('RAN', 'DOB'),
('ABC', 'DEF'),
('RED', 'YEL');

/*Insert data with quotes in the column customers */
INSERT INTO customers (first_name)
VALUES
('Bill''O Sullivan');

/*Insert value into the column ‘first_name’ of the customer table */
INSERT INTO customers(first_name)
VALUES ('ADAM');

/*Return all the columns after the insert query*/
INSERT INTO customers(first_name)
VALUES('JOSEPH') RETURNING *;

/*Return a single column customer_id after the insert query*/
INSERT INTO customers (first_name)
VALUES ('JOSEPH') RETURNING customer_id;

/*Update the table customers with the email id values where column customer_id is 1*/
UPDATE customers
SET email = 'a2@b.com'
WHERE customer_id =1

/* Update the columns email and age 
in the table customers*/
UPDATE customers
SET 
email = ‘a2@b.com’
age = 30

/*Update the columns email and age in
the table customers where customer_id is 1
*/
UPDATE customers
SET 
email = ‘a5@b.com’ 
age = 30
WHERE customer_id = 1;

/*Update the customer table with email id 
value where customer_id is 3 */
UPDATE customers
SET 
email = 'a@b.com'
WHERE customer_id =3

/*Select the customers table*/ 
SELECT * FROM customers;

/*Return all the columns affected 
by the update of email where customer_id is 3*/
UPDATE customers
SET 
email = 'a@b.com'
WHERE customer_id =3
RETURNING *;

/*Update all records with with column
 is_enable = ‘Y' where customer_id = 1*/
UPDATE customers
SET is_enable = 'Y'
WHERE customer_id = 1

/*Update all records in the table customers*/
UPDATE customers
SET is_enable = 'Y'

/*Delete data from customers table 
for customer_id 9*/
DELETE FROM customers
WHERE customer_id = '9';

/*Delete all records from customers table*/
DELETE FROM customers; 

/*Create a table t_tags with 3 columns and 
update_date column showing the current time by default*/
CREATE TABLE t_tags(
	id serial PRIMARY KEY,
	tag text UNIQUE,
	update_date TIMESTAMP DEFAULT NOW()
);

/*Insert data into the table t_tags*/
INSERT INTO t_tags(tag) values 
('Pen'),
('Pencil');




	
	