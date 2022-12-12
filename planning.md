# Design a mock hospital database system

## Entities 

- Doctors
- Patients
- Departments
- Rooms
- Beds

### Relationships:

- Doctors can have many Patients

- Patients can have many Doctors

- **therefore doctors and patients are many to many**

- Doctors can belong to one or more departments

- Departments have many doctors

-**therefore doctors and departments are many to many**

- Patients have one room

- One room has many patients

- **therefore rooms are one to many with patients**

- Patients have one bed

- Each bed has one patient

- **therefore beds and patients are one to one**

- Each room has many beds

- Each bed belongs to one room

- **therefore room is one to many with beds**
