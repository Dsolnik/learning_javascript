-- Subquery
USE sakila;
SELECT 	cst.customer_id AS CustomerID,
		CONCAT(cst.first_name, ' ', cst.last_name) AS FullName		
FROM customer cst
WHERE cst.customer_id IN
(
SELECT rnt.customer_id
FROM rental rnt
WHERE inventory_id IN
(
SELECT inv.inventory_id
FROM inventory inv
WHERE inv.film_id IN
(
SELECT fm.film_id
FROM film fm
WHERE fm.film_id IN
(
SELECT fm_cat.film_id
FROM film_category fm_cat 
WHERE fm_cat.category_id IN
(
SELECT cat.category_id 
FROM category cat
WHERE cat.name = "Action"
)))))
ORDER BY cst.customer_id, cst.first_name, cst.last_name;


-- Joins
SELECT DISTiNCT cst.customer_id, cst.first_name, cst.last_name
FROM customer cst
INNER JOIN rental ren ON ren.customer_id = cst.customer_id
INNER JOIN inventory inv ON inv.inventory_id = ren.inventory_id
INNER JOIN film fm ON fm.film_id = inv.film_id 
INNER JOIN film_category fm_cat ON fm_cat.film_id = fm.film_id
INNER JOIN category cat ON cat.category_id = fm_cat.category_id
WHERE cat.name = "Action"
ORDER BY cst.customer_id, cst.first_name, cst.last_name;

Select *
FROM film
LIMIT 1;

Select *
FROM film_category
LIMIT 1;

SELECT t1.* 
FROM Table1 t1
WHERE t1.ID NOT IN (SELECT t2.ID FROM Table2 t2);