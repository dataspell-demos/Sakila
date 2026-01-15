select *
from actor;

select *
from actor join public.film_actor fa on actor.actor_id = fa.actor_id;

SELECT f.title
FROM film f
         JOIN film_actor fa ON f.film_id = fa.film_id
         JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.first_name = 'PENELOPE'
  AND a.last_name = 'GUINESS';
