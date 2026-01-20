create table if not exists film_actor
(
    actor_id    integer                 not null
        references actor
            on update cascade on delete restrict,
    film_id     integer                 not null
        references film
            on update cascade on delete restrict,
    last_update timestamp default now() not null,
    primary key (actor_id, film_id)
);

create index if not exists idx_fk_film_id
    on film_actor (film_id);

create index if not exists idx_film_actor_actor_id
    on film_actor (actor_id);

create trigger last_updated
    before update
    on film_actor
    for each row
execute procedure last_updated();

