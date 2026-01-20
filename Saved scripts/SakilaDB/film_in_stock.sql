create function film_in_stock(p_film_id integer, p_store_id integer, OUT p_film_count integer) returns integer
    language plpgsql
as
$$
BEGIN
    SELECT COUNT(*)
    INTO p_film_count
    FROM inventory
    WHERE film_id = p_film_id
      AND store_id = p_store_id
      AND inventory_in_stock(inventory_id);
END;
$$;

