create table if not exists language
(
    language_id integer   default nextval('language_language_id_seq'::regclass) not null
        primary key,
    name        char(20)                                                        not null,
    last_update timestamp default now()                                         not null
);

create trigger last_updated
    before update
    on language
    for each row
execute procedure last_updated();

