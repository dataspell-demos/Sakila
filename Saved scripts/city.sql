create table if not exists city
(
    city_id     integer   default nextval('city_city_id_seq'::regclass) not null
        primary key,
    city        varchar(50)                                             not null,
    country_id  integer                                                 not null
        references country
            on update cascade on delete restrict,
    last_update timestamp default now()                                 not null
);

create index if not exists idx_fk_country_id
    on city (country_id);

create trigger last_updated
    before update
    on city
    for each row
execute procedure last_updated();

