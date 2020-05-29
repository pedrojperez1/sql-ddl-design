-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  country_id INT REFERENCES countries,
  city_name TEXT NOT NULL
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  airline_id INT REFERENCES airlines,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city INT REFERENCES cities,
  to_city INT REFERENCES cities
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers,
  flight_id INT REFERENCES flights,
  seat TEXT NOT NULL
);

INSERT INTO customers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'), 
  ('Cory', 'Squibbes')
;

INSERT INTO airlines (airline_name)
VALUES 
  ('TUI Fly Belgium'), 
  ('Delta'), 
  ('United'), 
  ('American Airlines'), 
  ('Air China'), 
  ('British Airways'),
  ('Avianca Brasil')
;

INSERT INTO countries (country_name)
VALUES
  ('United States'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('UAE'),
  ('France'),
  ('Japan'),
  ('Brasil'),
  ('Chile')
;

INSERT INTO cities (country_id, city_name)
VALUES
  (1, 'Seattle'),
  (2, 'London'),
  (1, 'Las Vegas'),
  (3, 'Mexico City'),
  (4, 'Casablanca'),
  (5, 'Beijing'),
  (1, 'Charlotte'),
  (1, 'Cedar Rapids'),
  (9, 'Sao Paolo'),
  (8, 'Tokyo'),
  (7, 'Paris'),
  (1, 'Los Angeles'),
  (1, 'Washington DC'),
  (6, 'Dubai'),
  (10, 'Santiago'),
  (1, 'New York'),
  (1, 'Chicago'),
  (1, 'New Orleans')
;

INSERT INTO flights
  (airline_id, departure, arrival, from_city, to_city)
VALUES
  (3, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 13, 1),
  (6, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 10, 2),
  (2, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 12, 3),
  (2, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 1, 4),
  (1, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 11, 5),
  (5, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 14, 6),
  (3, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 16, 7),
  (4, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 8, 17),
  (4, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 7, 18),
  (7, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 9, 15)
;

INSERT INTO tickets
  (customer_id, flight_id, seat)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (1, 4, '20A'),
  (4, 5, '23D'),
  (2, 6, '18C'),
  (5, 7, '9E'),
  (6, 8, '1A'),
  (5, 9, '32B'),
  (7, 10, '10D')
;
