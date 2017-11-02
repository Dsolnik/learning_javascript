-- WHERE clause Comparison Operators

-- IN
SELECT *
FROM sakila.actor
WHERE first_name IN ('NICK', 'JOHNNY', 'JOE', 'VIVEN')
ORDER BY first_name DESC;

SELECT * 
FROM sakila.actor
WHERE actor_id in (1,2,3,4,5,6,7);

-- NOT IN
SELECT * 
FROM sakila.actor
WHERE actor_id not in (1,2,3,4,5,6,7);

-- In Subquery
SELECT *
FROM sakila.actor
WHERE first_name IN ('NICK', 'JOHNNY', 'JOE', 'VIVEN')
-- 		OR actor_id IN (41,107,166)
		OR actor_id IN
					(SELECT actor_id
					FROM sakila.actor
                    WHERE last_name = 'DEGENERES');
                    
SELECT *
FROM sakila.actor
WHERE actor_id > 10 AND actor_id < 20;

SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 10 and 20;

SELECT *
FROM sakila.actor
WHERE actor_id BETWEEN 11 AND 19;

SELECT *
FROM sakila.actor
WHERE actor_id NOT BETWEEN 11 AND 19;

SELECT * 
FROM sakila.actor 
WHERE first_name LIKE 'A%';

SELECT * 
FROM sakila.actor 
WHERE first_name LIKE 'AL%';

SELECT * 
FROM sakila.actor 
WHERE first_name LIKE 'A__E';

SELECT * 
FROM sakila.actor
WHERE first_name LIKE 'A__E%';

SELECT *
FROM sakila.actor 
WHERE first_name LIKE 'A%E%';

-- -------------------------------------
-- NULL
-- -------------------------------------
SELECT * 
FROM sakila.address;

SELECT *
FROM sakila.address
WHERE address2 IS NULL;

SELECT *
FROM sakila.address
WHERE address2 IS NOT NULL;