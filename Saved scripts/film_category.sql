create table if not exists film_category
(
    film_id     integer                 not null
        references film
            on update cascade on delete restrict,
    category_id integer                 not null
        references category
            on update cascade on delete restrict,
    last_update timestamp default now() not null,
    primary key (film_id, category_id)
);

create trigger last_updated
    before update
    on film_category
    for each row
execute procedure last_updated();

