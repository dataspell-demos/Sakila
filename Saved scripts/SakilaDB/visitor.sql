create table if not exists visitor
(
    id        integer not null
        primary key,
    full_name varchar(100),
    email     varchar(100)
);

