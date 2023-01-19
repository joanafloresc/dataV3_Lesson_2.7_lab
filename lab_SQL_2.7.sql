USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT count(film_id), tl.category_id, name
FROM category tl
	LEFT JOIN film_category tr
	ON tl.category_id = tr.category_id
GROUP BY tl.category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT sum(amount) FROM payment
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY staff_id;

-- 3. Which actor has appeared in the most films?
SELECT count(tl.actor_id) AS number_films, tl.actor_id, first_name, last_name 
	FROM film_actor tl
	LEFT JOIN actor tr
	ON tl.actor_id = tr.actor_id
GROUP BY tl.actor_id
ORDER BY number_films DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT count(tl.rental_id) AS number_rentals, first_name, last_name 
	FROM rental tl
	LEFT JOIN customer tr
	ON tl.customer_id = tr.customer_id
GROUP BY tl.customer_id
ORDER BY number_rentals DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT tl.first_name, tl.last_name, tr.address, tr.address2
FROM staff tl
LEFT JOIN address tr
ON tl.address_id = tr.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT tr.film_id, tr.title, count(tl.actor_id) AS number_actors
	FROM film_actor tl
	LEFT JOIN film tr
	ON tl.film_id = tr.film_id
    GROUP BY tr.film_id;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT sum(tl.amount) AS total_paid, tr.first_name, tr.last_name 
FROM payment tl
LEFT JOIN customer tr
ON tl.customer_id = tr.customer_id
GROUP BY tr.customer_id
ORDER BY last_name;

-- 8. List number of films per category.
SELECT count(film_id) AS number_films, category_id FROM film_category
GROUP BY category_id;