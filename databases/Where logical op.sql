SELECT * 
FROM sakila.film
LIMIT 1000;

-- Retrieve column names using aliases

SELECT rental_date, inventory_id, return_date 
FROM sakila.rental;

SELECT rental_date AS RentalDate,
		inventory_id AS FilmListID,
		return_date AS ReturnDate
FROM sakila.rental;

-- Retrieve values based on arithmetic expressions

SELECT 	replacement_cost - rental_rate,
		film_id AS filmID,
        length/60
FROM sakila.film;

SELECT 	replacement_cost - rental_rate AS CostDiff,
		film_id AS filmID,
        length/60 AS TimeinHour
FROM sakila.film;

SELECT 	replacement_cost AS ReplacementCost,
		replacement_cost / 5 AS DecimalRentalRate,
        replacement_cost DIV 5 AS IntegerRentalRate,
        replacement_cost % 5 AS RemainderRentalRate
FROM sakila.film;

-- Retrieve results based on function

SELECT 	amount,
		ROUND(amount) Amnt, ROUND(amount, 1) Amnt1,
        FLOOR(amount) FloorAmnt, CEILING(amount) CeilingAmnt
FROM sakila.payment;

-- -------------------------------------
-- String Operations
-- -------------------------------------
-- Concat

SELECT CONCAT(first_name, ' ', last_name) AS FullName 
FROM sakila.actor;

-- LEFT, LENGTH function
SELECT 	CONCAT(first_name, ' ', last_name) AS FullName,
		LENGTH(CONCAT(first_name, ' ', last_name)) AS Length,
		CONCAT(LEFT(first_name, 1), ' ', LEFT(last_name, 1)) AS FirstInitial
FROM sakila.actor;

-- VARIOUS FUNCTIONS
SELECT 	CONCAT(first_name, ' ', last_name) AS FullName,
		REVERSE(CONCAT(first_name, ' ', last_name)) AS ReverseFullName,
		REPLACE(CONCAT(first_name, ' ', last_name), 'S', '$') AS ReplaceExample 
FROM sakila.actor;

-- -------------------------------------
-- Date Operations
-- -------------------------------------
-- DATE_FORMAT function
SELECT 	CONCAT(first_name, ' ', last_name) AS FullName,
		DATE_FORMAT(last_update, '%m/%d/%y') AS LastUpdated1,
        DATE_FORMAT(last_update, '%d-%m-%y') AS LastUpdated2,
        DATE_FORMAT(last_update, '%d %b %Y %T:%f') AS LastUpdated3
FROM sakila.actor;

-- DATE_FORMAT with GET_FORMAT function
SELECT	CONCAT(first_name, ' ', last_name) AS FullName,
		DATE_FORMAT(last_update, GET_FORMAT(DATETIME, 'EUR')) AS LastUpdated1,
		DATE_FORMAT(last_update, GET_FORMAT(DATETIME, 'ISO')) AS LastUpdated2,
		DATE_FORMAT(last_update, GET_FORMAT(DATETIME, 'USA')) AS LastUpdated3
FROM sakila.actor;	

SELECT 	rental_date,
		DAYOFWEEK(rental_date) AS DayOfWeek,
        QUARTER(rental_date) AS Quarter,
        WEEK(rental_date) AS Week,
        MONTHNAME(rental_date) AS MonthName
FROM sakila.rental;

SELECT first_name 
FROM sakila.actor;

SELECT DISTINCT first_name 
FROM sakila.actor;

SELECT last_name 
FROM sakila.actor;

SELECT DISTINCT last_name
FROM sakila.actor;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE NOT (actor_id = 5 OR actor_id = 6);


