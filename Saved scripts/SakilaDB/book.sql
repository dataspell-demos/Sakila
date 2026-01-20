create table if not exists book
(
    book_id serial
        primary key,
    title   varchar(255),
    authors varchar(100),
    isbn    varchar(138)
);

