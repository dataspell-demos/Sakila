create function last_updated() returns trigger
    language plpgsql
as
$$
BEGIN
    NEW.last_update = CURRENT_TIMESTAMP;
    RETURN NEW;
END $$;

