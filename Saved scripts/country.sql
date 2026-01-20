create table if not exists country
(
    country_id  integer   default nextval('country_country_id_seq'::regclass) not null
        primary key,
    country     varchar(50)                                                   not null,
    last_update timestamp default now()                                       not null
);

create trigger last_updated
    before update
    on country
    for each row
execute procedure last_updated();

