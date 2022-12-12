/*DATABASE SETUP*/
CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name_first VARCHAR(32) NOT NULL,
    name_last VARCHAR(32) NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name_first VARCHAR(32) NOT NULL,
    name_last VARCHAR(32) NOT NULL
);

CREATE TABLE beds (
    id SERIAL PRIMARY KEY,
    room_id INTEGER,
    patient_id INTEGER
);

CREATE TABLE rooms (id SERIAL PRIMARY KEY);

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL
);

CREATE TABLE doctors_patients (
    doctor_id INTEGER REFERENCES doctors(id) NOT NULL,
    patient_id INTEGER REFERENCES patients(id) NOT NULL,
    PRIMARY KEY (doctor_id, patient_id)
);

CREATE TABLE doctors_departments (
    doctor_id INTEGER REFERENCES doctors(id) NOT NULL,
    department_id INTEGER REFERENCES departments(id) NOT NULL,
    PRIMARY KEY (doctor_id, department_id)
);

/*INSERT SAMPLE DATA*/
INSERT INTO
    doctors (name_first, name_last)
VALUES
    ('Susan', 'Kemp'),
    ('Rajesh', 'Joshi'),
    ('Elliot', 'Arnold'),
    ('Farah', 'Jhomal'),
    ('Darius', 'Rockwell');

INSERT INTO
    patients
VALUES
    ('John', 'Doe'),
    ('Jane', 'Doe'),
    ('Farhad', 'Ahmed'),
    ('Julia', 'Sittingbear'),
    ('Roger', 'Gould'),
    ('Elbert', 'Francis'),
    ('Emma', 'Kegz');

INSERT INTO
    rooms (id)
VALUES
    (1),
    (2),
    (3);

INSERT INTO
    beds (room_id, patient_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 6),
    (1, NULL),
    (2, 3),
    (2, 4),
    (2, 7),
    (2, NULL),
    (3, NULL),
    (3, 5),
    (3, NULL),
    (3, NULL);

INSERT INTO
    departments (name)
VALUES
    ('Emergency'),
    ('Surgery'),
    ('Labor & Devlivery'),
    ('Intensive Care'),
    ('Pediatrics'),
    ('Pathology'),
    ('Radiology');

INSERT INTO
    doctors_patients (doctor_id, patient_id)
VALUES
    (1, 1),
    (3, 1),
    (2, 2),
    (2, 3),
    (1, 4),
    (3, 4),
    (4, 4),
    (5, 5),
    (4, 6),
    (5, 6),
    (4, 7);

INSERT INTO doctors_departments (doctor_id, department_id)
VALUES 
(1, 1),
(1, 3),
(2, 3),
(2, 5),
(3, 1),
(3, 2),
(4,6),
(4, 7),
(5, 4);

/*TESTING*/

--Which doctorss are assigned to which patients
SELECT * from doctors
JOIN doctors_patients
ON doctors.id = doctors_patients.doctor_id
JOIN patients
ON patients.id = doctors_patients.patient_id
ORDER BY doctors.id;