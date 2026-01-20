create table if not exists actor
(
    actor_id    integer   default nextval('actor_actor_id_seq'::regclass) not null
        primary key,
    first_name  varchar(45)                                               not null,
    last_name   varchar(45)                                               not null,
    last_update timestamp default now()                                   not null
);

create index if not exists idx_actor_last_name
    on actor (last_name);

create unique index if not exists actor_id_un
    on actor (actor_id);

create index if not exists idx_actor_actor_id
    on actor (actor_id);

create trigger last_updated
    before update
    on actor
    for each row
execute procedure last_updated();

