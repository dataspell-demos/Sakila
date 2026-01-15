SELECT * FROM "table" JOIN public.film_actor fa on actor.actor_id = fa.actor_id;

SELECT f.film_id,
       f.title,
       COUNT(fa.actor_id) as cast_size
FROM film f
         JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title
ORDER BY cast_size DESC
LIMIT 1;