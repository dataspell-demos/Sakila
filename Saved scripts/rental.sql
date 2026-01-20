create table if not exists rental
(
    rental_id    integer   default nextval('rental_rental_id_seq'::regclass) not null
        primary key,
    rental_date  timestamp                                                   not null,
    inventory_id integer                                                     not null
        references inventory
            on update cascade on delete restrict,
    customer_id  integer                                                     not null
        references customer
            on update cascade on delete restrict,
    return_date  timestamp,
    staff_id     integer                                                     not null
        references staff
            on update cascade on delete restrict,
    last_update  timestamp default now()                                     not null
);

create index if not exists idx_fk_inventory_id
    on rental (inventory_id);

create unique index if not exists idx_unq_rental_rental_date_inventory_id_customer_id
    on rental (rental_date, inventory_id, customer_id);

create trigger last_updated
    before update
    on rental
    for each row
execute procedure last_updated();

