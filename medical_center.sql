DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;

\c medical_center_db

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL,
    date_of_visit TEXT
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    visit_id INTEGER REFERENCES visits ON DELETE SET NULL
);

INSERT INTO doctors 
    (fname, lname)
VALUES
    ('Leslie', 'Knope'),
    ('Leslie', 'Chow'),
    ('Sherlock', 'Holmes'),
    ('Mr', 'T')
;

INSERT INTO patients 
    (fname, lname)
VALUES 
    ('Sam', 'Snead'),
    ('Larry', 'Bird'),
    ('Babe', 'Ruth'),
    ('Diego', 'Maradona')
;

INSERT INTO visits 
    (doctor_id, patient_id, date_of_visit)
VALUES
    (2, 1, '1998-09-02'),
    (1, 3, '1999-10-13'),
    (3, 1, '2001-07-05'),
    (2, 4, '2007-12-15'),
    (4, 2, '2010-04-25')
;

INSERT INTO diagnosis (description, visit_id)
VALUES
('Amazing golf swing', 1),
('Bad back', 1),
('Great sense of humor', 1),
('Fear of doctors', 2),
('Boredom', 3)
;