create view view_name_2(actor_id, first_name, last_name, last_update) as
SELECT actor_id,
       first_name,
       last_name,
       last_update
FROM actor;

