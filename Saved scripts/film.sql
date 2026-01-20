create table if not exists film
(
    film_id              integer       default nextval('film_film_id_seq'::regclass) not null
        primary key,
    title                varchar(255)                                                not null,
    description          text,
    release_year         year,
    language_id          integer                                                     not null
        references language
            on update cascade on delete restrict,
    original_language_id integer
        references language
            on update cascade on delete restrict,
    rental_duration      smallint      default 3                                     not null,
    rental_rate          numeric(4, 2) default 4.99                                  not null,
    length               smallint,
    replacement_cost     numeric(5, 2) default 19.99                                 not null,
    rating               mpaa_rating   default 'G'::mpaa_rating,
    last_update          timestamp     default now()                                 not null,
    special_features     text[],
    fulltext             tsvector                                                    not null
);

create index if not exists film_fulltext_idx
    on film using gist (fulltext);

create index if not exists idx_fk_language_id
    on film (language_id);

create index if not exists idx_fk_original_language_id
    on film (original_language_id);

create index if not exists idx_title
    on film (title);

create trigger film_fulltext_trigger
    before insert or update
    on film
    for each row
execute procedure ???('fulltext', 'pg_catalog.english', 'title', 'description');

create trigger last_updated
    before update
    on film
    for each row
execute procedure last_updated();

