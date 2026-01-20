create table if not exists outdoor_movie_venues
(
    venue_id            serial
        primary key,
    venue_name          varchar(100) not null,
    address_id          integer
        references address,
    latitude            numeric(10, 6),
    longitude           numeric(10, 6),
    capacity            integer,
    screen_size_sqm     numeric(5, 2),
    weather_dependent   boolean default true,
    last_screening_date date,
    store_id            integer
        references store,
    notes               text
);

create index if not exists idx_outdoor_venues_location
    on outdoor_movie_venues (latitude, longitude);

