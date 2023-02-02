CREATE TABLE IF NOT EXISTS patients (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    date_of_birth date NOT NULL
);

CREATE TABLE IF NOT EXISTS medical_histories (
    id SERIAL PRIMARY KEY NOT NULL,
    admited_at timestamp NOT NULL,
    patient_id INT,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE IF NOT EXISTS invoices (
	id SERIAL PRIMARY KEY NOT NULL,
	total_amount DECIMAL NOT NULL,
	payed_at TIMESTAMP NOT NULL,
	medical_history_id INT NOT NULL,
	FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE IF NOT EXISTS treatments (
    id SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE invoice_items (
	id SERIAL PRIMARY KEY NOT NULL,
	unit_price DECIMAL NOT NULL,
	quantity INT NOT NULL,
	total_price DECIMAL NOT NULL,
	invoice_id INT NOT NULL,
	treatment_id INT NOT NULL,
	FOREIGN KEY (invoice_id) REFERENCES invoices (id),
	FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE medicalal_histories_treatments (
	medical_histories_id INT NOT NULL,
	treatments_id INT NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  	updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
	FOREIGN KEY (treatments_id) REFERENCES treatments(id)
);
