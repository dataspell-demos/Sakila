create view test(first_name, last_name, title) as
SELECT first_name,
       last_name,
       title
FROM (SELECT DISTINCT a.first_name,
                      a.last_name,
                      f.title
      FROM actor a
               JOIN film_actor fa ON a.actor_id = fa.actor_id
               JOIN film f ON f.film_id = fa.film_id) subquery;

