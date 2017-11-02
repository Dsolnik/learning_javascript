-- ORDER BY clause

SELECT *
FROM sakila.address
ORDER BY district;

SELECT *
FROM sakila.address
ORDER BY district DESC;

SELECT *
FROM sakila.address
ORDER BY district, postal_code DESC;

SELECT actor_id, CONCAT(first_name, ' ', last_name) AS FullName
FROM sakila.actor 
ORDER BY CONCAT(first_name, ' ', last_name);

SELECT actor_id, CONCAT(first_name, ' ', last_name) AS FullName
FROM sakila.actor 
ORDER BY FullName;

-- BAD I DONT LIKE
SELECT actor_id, CONCAT(first_name, ' ', last_name) AS FullName
FROM sakila.actor 
ORDER BY 1;

-- LIMIT keyword
SELECT * 
FROM sakila.actor
ORDER BY actor_id;

SELECT * 
FROM sakila.actor
ORDER BY actor_id
Limit 10;

-- LIMIT OFFSET NUM
SELECT * 
FROM sakila.actor
ORDER BY actor_id
Limit 25, 5;


