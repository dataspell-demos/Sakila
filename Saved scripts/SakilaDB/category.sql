create table if not exists category
(
    category_id integer   default nextval('category_category_id_seq'::regclass) not null
        primary key,
    name        varchar(25)                                                     not null,
    last_update timestamp default now()                                         not null
);

create trigger last_updated
    before update
    on category
    for each row
execute procedure last_updated();

