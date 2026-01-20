create table if not exists visitor_log
(
    id         integer      not null
        primary key,
    visitor_id integer      not null,
    visit_time timestamp    not null,
    page_url   varchar(255) not null
);

