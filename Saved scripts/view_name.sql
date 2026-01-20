create view view_name (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) as
SELECT rental_id,
       rental_date,
       inventory_id,
       customer_id,
       return_date,
       staff_id,
       last_update
FROM rental;

