create table if not exists address
(
    address_id  integer   default nextval('address_address_id_seq'::regclass) not null
        primary key,
    address     varchar(50)                                                   not null,
    address2    varchar(50),
    district    varchar(20)                                                   not null,
    city_id     integer                                                       not null
        references city
            on update cascade on delete restrict,
    postal_code varchar(10),
    phone       varchar(20)                                                   not null,
    last_update timestamp default now()                                       not null
);

create index if not exists idx_fk_city_id
    on address (city_id);

create trigger last_updated
    before update
    on address
    for each row
execute procedure last_updated();

