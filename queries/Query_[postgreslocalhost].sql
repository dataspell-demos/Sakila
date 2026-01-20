-- Retrieve films released after 2000 with their categories
-- Joins film, film_category, and category tables to display film details along with category names
-- Results are ordered alphabetically by film title
SELECT f.film_id,
       f.title,
       f.release_year,
       c.name AS category_name
FROM film f
         INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE f.release_year > 2000
ORDER BY f.title;


SELECT
    c.name AS category_name,
    COUNT(r.rental_id) AS total_rentals,
    SUM(p.amount) AS total_revenue
FROM category c
         JOIN film_category fc ON c.category_id = fc.category_id
         JOIN film f ON fc.film_id = f.film_id
         JOIN inventory i ON f.film_id = i.film_id
         JOIN rental r ON i.inventory_id = r.inventory_id
         JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY total_revenue DESC;