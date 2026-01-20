create table if not exists store
(
    store_id         integer   default nextval('store_store_id_seq'::regclass) not null
        primary key,
    manager_staff_id integer                                                   not null
        references staff
            on update cascade on delete restrict,
    address_id       integer                                                   not null
        references address
            on update cascade on delete restrict,
    last_update      timestamp default now()                                   not null
);

create unique index if not exists idx_unq_manager_staff_id
    on store (manager_staff_id);

create trigger last_updated
    before update
    on store
    for each row
execute procedure last_updated();

