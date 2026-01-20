create table if not exists payment_p2007_02
(
    foreign key (customer_id) references customer,
    foreign key (rental_id) references rental,
    foreign key (staff_id) references staff,
    constraint payment_p2007_02_payment_date_check
        check ((payment_date >= '2007-02-01 00:00:00'::timestamp without time zone) AND
               (payment_date < '2007-03-01 00:00:00'::timestamp without time zone))
)
    inherits (payment);

create index if not exists idx_fk_payment_p2007_02_customer_id
    on payment_p2007_02 (customer_id);

create index if not exists idx_fk_payment_p2007_02_staff_id
    on payment_p2007_02 (staff_id);

