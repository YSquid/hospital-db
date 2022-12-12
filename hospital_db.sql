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
    doctor_id REFERENCES doctors(id) NOT NULL,
    patient_id REFERENCES patients(id) NOT NULL,
    PRIMARY KEY (doctor_id, patient_id)
);

CREATE TABLE doctors_departments (
    doctor_id REFERENCES doctors(id) NOT NULL,
    department_id REFERENCES departments(id) NOT NULL,
    PRIMARY KEY (doctor_id, department_id)
);