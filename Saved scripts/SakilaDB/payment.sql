create table if not exists payment
(
    payment_id   integer default nextval('payment_payment_id_seq'::regclass) not null
        primary key,
    customer_id  integer                                                     not null
        references customer
            on update cascade on delete restrict,
    staff_id     integer                                                     not null
        references staff
            on update cascade on delete restrict,
    rental_id    integer                                                     not null
        references rental
            on update cascade on delete set null,
    amount       numeric(5, 2)                                               not null,
    payment_date timestamp                                                   not null
);

create index if not exists idx_fk_customer_id
    on payment (customer_id);

create index if not exists idx_fk_staff_id
    on payment (staff_id);

