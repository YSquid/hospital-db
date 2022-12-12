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

--Which doctors are assigned to which patients
SELECT
    doctors.name_first AS doctor_first_name,
    doctors.name_last AS doctor_last_name,
    doctors_patients.doctor_id,
    doctors_patients.patient_id,
    patients.name_first AS patient_first_name,
    patients.name_last AS patient_last_name
FROM doctors
JOIN doctors_patients
ON doctors.id = doctors_patients.doctor_id
JOIN patients
ON patients.id = doctors_patients.patient_id
ORDER BY 2;

--Which patients are in which bed and room

SELECT
    patients.id,
    patients.name_first AS patient_first_name,
    patients.name_last AS patient_last_name,
    beds.id AS bed_number,
    beds.room_id AS room_number
FROM patients
JOIN beds 
ON patients.id = beds.patient_id
ORDER BY 1;

--Which doctors belong to which departments

SELECT
    doctors.id,
    doctors.name_first AS doctor_first_name,
    doctors.name_last AS doctor_last_name,
    departments.id,
    departments.name
FROM doctors
JOIN doctors_departments
ON doctors.id = doctors_departments.doctor_id
JOIN departments
ON departments.id = doctors_departments.department_id
ORDER BY 1;

--ALTER rooms table to have an alias column
ALTER TABLE rooms 
ADD COLUMN alias VARCHAR(32)

--UPDATE the room aliases
UPDATE rooms
SET alias = 'Emergency and Surgery Patients'
WHERE id = 1;

UPDATE rooms
SET alias = 'L&D and Pediatrics Patients'
WHERE id = 2;

UPDATE rooms
SET alias = 'ICU patients'
WHERE id = 3;

