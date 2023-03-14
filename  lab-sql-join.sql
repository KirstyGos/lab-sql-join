USE sakila; #specify which database to use

# 1. List the number of films per category.
SELECT C.name, COUNT(F.film_id) AS num_per_category #count the film ids 
FROM category AS C # using tabel 'category' and call it 'C' 
INNER JOIN film_category AS F # using table 'film_category' and call it 'F'
ON C.category_id = F.category_id #specify which columns the tables have in common and will be joined by
GROUP BY C.name # group by the name column
ORDER BY num_per_category DESC; # order the list by the most to least films per category as it's noce to read

# 2. Display the first and the last names, as well as the address, of each staff member.
SELECT S.first_name, S.last_name, A.address #we would like to see first name, last name and address
FROM staff AS S
JOIN address AS A
ON S.address_id = A.address_id; # join the tables on the columns they have in common


# 3. Display the total amount rung up by each staff member in August 2005.
SELECT *
FROM payment;

SELECT S.first_name, S.last_name, ROUND(SUM(P.amount), 0) AS total_amount # gte the names of the staff members, SUM their payments and round off to a whole number 
FROM payment AS P # specify which tables we are using 
INNER JOIN staff AS S
ON P.staff_id = S.staff_id # join the tables on the columns they have in common
WHERE P.payment_date >= '2005-08-01' AND P.payment_date < '2005-09-01' # we are only looking payments in August 2005
GROUP BY S.staff_id # group by staff id as it is unique for the employees
ORDER BY total_amount DESC; # order by descending as it's cleaner to read

# 4. List all films and the number of actors who are listed for each film.
SELECT F.title, COUNT(DISTINCT(A.actor_id)) AS num_actors_per_film # we want to see the title of the film and need to count unique actor ids
FROM film AS F # specify which tables we are using
JOIN film_actor AS A
ON F.film_id = A.film_id # join the tables on the columns they have in common
GROUP BY F.title; # group by the title so we can see how many actors there were per title


# 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT C.last_name, C.first_name, ROUND(SUM(P.amount), 0) AS amount_paid # we want to see the last name, first name and the sum of the amount paid per customer, rounded off
FROM customer AS C # specify which tables we are using
JOIN payment AS P
ON C.customer_id = P.customer_id # join the tables on the columns they have in common
GROUP BY C.customer_id # group by the customer id as it is unique
ORDER BY C.last_name; #order by the last names in alphabetical order