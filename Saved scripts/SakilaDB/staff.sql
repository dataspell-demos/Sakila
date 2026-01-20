create table if not exists staff
(
    staff_id    integer   default nextval('staff_staff_id_seq'::regclass) not null
        primary key,
    first_name  varchar(45)                                               not null,
    last_name   varchar(45)                                               not null,
    address_id  integer                                                   not null
        references address
            on update cascade on delete restrict,
    email       varchar(50),
    store_id    integer                                                   not null
        references store,
    active      boolean   default true                                    not null,
    username    varchar(16)                                               not null,
    password    varchar(40),
    last_update timestamp default now()                                   not null,
    picture     bytea
);

create trigger last_updated
    before update
    on staff
    for each row
execute procedure last_updated();

