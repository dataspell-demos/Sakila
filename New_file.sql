CREATE TABLE Name (

                      id         SERIAL PRIMARY KEY,
                      first_name VARCHAR(100),
                      last_name  VARCHAR(100)
);

CREATE TABLE Name2
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name  VARCHAR(100),
    email      VARCHAR(200),
    phone      VARCHAR(20),
    address    VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Table3
(
    record_id    SERIAL PRIMARY KEY,
    id_name      INTEGER,
    id_name2     INTEGER,
    description  TEXT,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_name) REFERENCES Name (id),
    FOREIGN KEY (id_name2) REFERENCES Name2 (id)
);