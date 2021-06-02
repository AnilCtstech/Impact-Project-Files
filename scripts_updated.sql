CREATE TABLE patient(
	patient_id bigint NOT NULL,
	title VARCHAR(20) NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
	email_id VARCHAR(100) UNIQUE NOT NULL,
	DOB DATE NOT NULL,
	age NUMERIC CHECK(Age>0) NOT NULL,
	contact_no NUMERIC UNIQUE NOT NULL,
	gender VARCHAR(10) NOT NULL,
	race VARCHAR(50) NOT NULL,
	ethnicity VARCHAR(100) NOT NULL,
	languages_known VARCHAR(100),
	home_address VARCHAR(200),
	emerg_first_name VARCHAR(100),
	emerg_last_name VARCHAR(100),
	emerg_relationship VARCHAR(100),
	emerg_contact VARCHAR(100),
	emerg_address VARCHAR(200),
	emerg_isAccess VARCHAR(50),
	CONSTRAINT patient_id PRIMARY KEY(patient_id)
);

CREATE TABLE role(
	role_id SMALLINT NOT NULL,
	role_type VARCHAR(20) NOT NULL,
	CONSTRAINT role_id PRIMARY KEY(role_id)
);

CREATE TABLE employee(
	employee_id bigint NOT NULL,
	title VARCHAR(20) NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
	email_id VARCHAR(100) NOT NULL,
	DOB DATE NOT NULL,
	role_id SMALLINT NOT NULL,
	CONSTRAINT employee_id PRIMARY KEY(employee_id),
	CONSTRAINT role_id FOREIGN KEY(role_id) REFERENCES role(role_id)
);

CREATE TABLE medication(
	drug_id bigint NOT NULL,
	drug_name VARCHAR(100) NOT NULL,
	drug_generic_name VARCHAR(100) NOT NULL,
	drug_brand_name VARCHAR(100) NOT NULL,
	drug_form VARCHAR(100) NOT NULL,
	drug_strength VARCHAR(150) NOT NULL,
	patient_id bigint NOT NULL,
	CONSTRAINT drug_id PRIMARY KEY(drug_id),
	CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE diagnosis(
	diagnosis_code VARCHAR(100) NOT NULL,
	diagnosis_description VARCHAR(100) NOT NULL,
	diagnosis_is_deprecated BOOLEAN NOT NULL,
	patient_id bigint NOT NULL,
	CONSTRAINT diagnosis_code PRIMARY KEY(diagnosis_code),
	CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE appointment(
	appointment_id bigint NOT NULL,
	description VARCHAR(100) NOT NULL,
	appointment_date DATE NOT NULL,
	appointment_time TIME NOT NULL,
	employee_id bigint NOT NULL,
	patient_id bigint NOT NULL,
	CONSTRAINT appointment_id PRIMARY KEY(appointment_id),	
	CONSTRAINT employee_id FOREIGN KEY(employee_id) REFERENCES employee(employee_id),	
	CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);


CREATE TABLE allergy(
	allergy_id bigint NOT NULL,
	allergy_type VARCHAR(50) NOT NULL,
	allergy_name VARCHAR(100) NOT NULL,
	allergy_source VARCHAR(100) NOT NULL,
	is_of_forms VARCHAR(100) NOT NULL,
	allerginicity VARCHAR(100) NOT NULL,	
	allergy_clinical_information VARCHAR(100),
	allergy_description VARCHAR(100),
	is_fatal BOOLEAN,
	patient_id bigint NOT NULL,
	CONSTRAINT allergy_id PRIMARY KEY(allergy_id),
	CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE notes(
	note_id bigint NOT NULL,
	from_id bigint NOT NULL,
	to_id bigint NOT NULL,
	message VARCHAR(20) NOT NULL,
	note_date timestamp NOT NULL,
	status BOOLEAN NOT NULL,
	CONSTRAINT note_id PRIMARY KEY(note_id),
	patient_id bigint NOT NULL,
	CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCES patient(patient_id),
	FOREIGN KEY(from_id) REFERENCES employee(employee_id),
	FOREIGN KEY(to_id) REFERENCES employee(employee_id)
);


CREATE TABLE patien_vital_signs(
	visit_date DATE NOT NULL,
	height INT NOT NULL,
	weight INT NOT NULL,
	blood_pressure VARCHAR(100) NOT NULL,
	body_temperature VARCHAR(100) NOT NULL,
	respiration_rate VARCHAR(100) NOT NULL,
	patient_id bigint NOT NULL,
	CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE procedure(
	procedure_code VARCHAR(100) NOT NULL,
	procedure_description VARCHAR(100) NOT NULL,
	procedure_is_deprecated BOOLEAN NOT NULL,
	patient_id bigint NOT NULL,
	CONSTRAINT procedure_code PRIMARY KEY(procedure_code),
	CONSTRAINT patient_id FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

