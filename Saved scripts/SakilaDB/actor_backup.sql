create table if not exists actor_backup
(
    actor_id    double precision not null
        constraint actor_backup_pk
            primary key,
    first_name  varchar(45),
    last_name   varchar(45),
    last_update timestamp
);

