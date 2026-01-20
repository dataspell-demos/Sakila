create table if not exists table_name
(
    column_name   integer not null
        constraint table_name_pk
            primary key,
    column_name_2 text    not null
);

