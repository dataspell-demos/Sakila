create view new_view(name, surname) as
SELECT last_name  AS name,
       first_name AS surname
FROM actor
WHERE actor_id >= 17
  AND actor_id <= 90;

