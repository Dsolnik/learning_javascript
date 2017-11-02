SELECT *
FROM sakila.actor;

SELECT * 
FROM sakila.city;

USE sakila;
SELECT * 
FROM city;

SELECT * 
FROM sakila.actor;

SELECT *
FROM sakila.actor
ORDER BY first_name;

SELECT *
FROM sakila.actor
ORDER BY last_name;

SELECT *
FROM sakila.actor
ORDER BY first_name DESC;

SELECT *
FROM sakila.actor
ORDER BY last_name DESC;

SELECT * 
FROM sakila.actor;

SELECT first_name, last_name
FROM sakila.actor;

SELECT first_name, last_name
FROM sakila.actor ORDER BY first_name DESC;

-- Retrieve data with filter condition

SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.actor
WHERE actor_id > 100;

SELECT *
FROM sakila.actor
WHERE actor_id < 100;

SELECT actor_id, first_name, last_name 
FROM sakila.actor
WHERE first_name = 'Nick';

-- Retrieve data with filter condition an ordered by columns
SELECT *
FROM sakila.actor
WHERE first_name = 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor 
WHERE first_name = 'Nick'
ORDER BY actor_id DESC;

SELECT actor_id, first_name, last_name
FROM sakila.actor 
WHERE actor_id > 100
ORDER BY first_name, last_name DESC;

SELECT *
FROM sakila.actor
WHERE 1 = 2;

