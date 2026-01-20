create table if not exists inventory
(
    inventory_id integer   default nextval('inventory_inventory_id_seq'::regclass) not null
        primary key,
    film_id      integer                                                           not null
        references film
            on update cascade on delete restrict,
    store_id     integer                                                           not null
        references store
            on update cascade on delete restrict,
    last_update  timestamp default now()                                           not null
);

create index if not exists idx_store_id_film_id
    on inventory (store_id, film_id);

create trigger last_updated
    before update
    on inventory
    for each row
execute procedure last_updated();

