select *
from actor;

select *
from actor join public.film_actor fa on actor.actor_id = fa.actor_id;