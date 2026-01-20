create table if not exists customer
(
    customer_id integer   default nextval('customer_customer_id_seq'::regclass) not null
        primary key,
    store_id    integer                                                         not null
        references store
            on update cascade on delete restrict,
    first_name  varchar(45)                                                     not null,
    last_name   varchar(45)                                                     not null,
    email       varchar(50),
    address_id  integer                                                         not null
        references address
            on update cascade on delete restrict,
    activebool  boolean   default true                                          not null,
    create_date date      default ('now'::text)::date                           not null,
    last_update timestamp default now(),
    active      integer
);

create index if not exists idx_fk_address_id
    on customer (address_id);

create index if not exists idx_fk_store_id
    on customer (store_id);

create index if not exists idx_last_name
    on customer (last_name);

create trigger last_updated
    before update
    on customer
    for each row
execute procedure last_updated();

