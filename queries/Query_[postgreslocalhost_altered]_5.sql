CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE locations
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    description TEXT,
    coordinates GEOGRAPHY(POINT, 4326),
    boundary    GEOGRAPHY(POLYGON, 4326),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a spatial index for better performance
CREATE INDEX idx_locations_coordinates ON locations USING GIST (coordinates);
CREATE INDEX idx_locations_boundary ON locations USING GIST (boundary);

-- Example insert with geo data
-- INSERT INTO locations (name, description, coordinates, boundary) VALUES
-- ('Eiffel Tower', 'Famous landmark in Paris', 
--  ST_GeogFromText('POINT(2.2945 48.8584)'),
--  ST_GeogFromText('POLYGON((2.2935 48.8574, 2.2955 48.8574, 2.2955 48.8594, 2.2935 48.8594, 2.2935 48.8574))')
-- );


-- Insert fake location data
INSERT INTO locations (name, description, coordinates, boundary)
VALUES ('Eiffel Tower', 'Famous landmark in Paris',
        ST_GeogFromText('POINT(2.2945 48.8584)'),
        ST_GeogFromText('POLYGON((2.2935 48.8574, 2.2955 48.8574, 2.2955 48.8594, 2.2935 48.8594, 2.2935 48.8574))')),
       ('Statue of Liberty', 'Iconic monument in New York',
        ST_GeogFromText('POINT(-74.0445 40.6892)'),
        ST_GeogFromText('POLYGON((-74.0455 40.6882, -74.0435 40.6882, -74.0435 40.6902, -74.0455 40.6902, -74.0455 40.6882))')),
       ('Big Ben', 'Historic clock tower in London',
        ST_GeogFromText('POINT(-0.1246 51.5007)'),
        ST_GeogFromText('POLYGON((-0.1256 51.4997, -0.1236 51.4997, -0.1236 51.5017, -0.1256 51.5017, -0.1256 51.4997))')),
       ('Sydney Opera House', 'Performing arts center in Sydney',
        ST_GeogFromText('POINT(151.2153 -33.8568)'),
        ST_GeogFromText('POLYGON((151.2143 -33.8578, 151.2163 -33.8578, 151.2163 -33.8558, 151.2143 -33.8558, 151.2143 -33.8578))')),
       ('Colosseum', 'Ancient amphitheater in Rome',
        ST_GeogFromText('POINT(12.4922 41.8902)'),
        ST_GeogFromText('POLYGON((12.4912 41.8892, 12.4932 41.8892, 12.4932 41.8912, 12.4912 41.8912, 12.4912 41.8892))')),
       ('Taj Mahal', 'Mausoleum in Agra, India',
        ST_GeogFromText('POINT(78.0421 27.1751)'),
        ST_GeogFromText('POLYGON((78.0411 27.1741, 78.0431 27.1741, 78.0431 27.1761, 78.0411 27.1761, 78.0411 27.1741))')),
       ('Golden Gate Bridge', 'Suspension bridge in San Francisco',
        ST_GeogFromText('POINT(-122.4783 37.8199)'),
        ST_GeogFromText('POLYGON((-122.4793 37.8189, -122.4773 37.8189, -122.4773 37.8209, -122.4793 37.8209, -122.4793 37.8189))')),
       ('Christ the Redeemer', 'Statue in Rio de Janeiro',
        ST_GeogFromText('POINT(-43.2105 -22.9519)'),
        ST_GeogFromText('POLYGON((-43.2115 -22.9529, -43.2095 -22.9529, -43.2095 -22.9509, -43.2115 -22.9509, -43.2115 -22.9529))')),
       ('Burj Khalifa', 'Skyscraper in Dubai',
        ST_GeogFromText('POINT(55.2744 25.1972)'),
        ST_GeogFromText('POLYGON((55.2734 25.1962, 55.2754 25.1962, 55.2754 25.1982, 55.2734 25.1982, 55.2734 25.1962))')),
       ('Machu Picchu', 'Ancient Incan city in Peru',
        ST_GeogFromText('POINT(-72.5450 -13.1631)'),
        ST_GeogFromText('POLYGON((-72.5460 -13.1641, -72.5440 -13.1641, -72.5440 -13.1621, -72.5460 -13.1621, -72.5460 -13.1641))'));