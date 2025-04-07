CREATE TABLE date_dimension (
    date_key INTEGER PRIMARY KEY,
    date DATE,
    day VARCHAR(10),
    week INTEGER,
    quarter INTEGER,
    year INTEGER,
    weekend BOOLEAN
);

CREATE TABLE station (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION
);

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    user_type VARCHAR(50),
    gender INTEGER,
    birth_year INTEGER
);

CREATE TABLE rides (
    bike_id INTEGER PRIMARY KEY,
    trip_duration INTEGER,
    start_time DATE,
    stop_time DATE,
    valid_trip_duration BOOLEAN,
    start_station_id INTEGER REFERENCES station(id),
    end_station_id INTEGER REFERENCES station(id),
    user_id INTEGER REFERENCES users(id),
    date_key INTEGER REFERENCES date_dimension(date_key)
);

CREATE TABLE weather (
    id INTEGER PRIMARY KEY,
    date DATE,
    avg_wind_speed REAL,
    prcp REAL,
    snow_amt REAL,
    snow_depth REAL,
    tavg INTEGER,
    tmax INTEGER,
    tmin INTEGER,
    snow BOOLEAN,
    rain BOOLEAN,
    date_key INTEGER REFERENCES date_dimension(date_key)
);