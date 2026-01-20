create materialized view if not exists materialized_view_name as
SELECT actor_id,
       first_name,
       last_name,
       last_update
FROM actor;

