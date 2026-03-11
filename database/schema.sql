CREATE TABLE roles (id BIGINT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100) UNIQUE NOT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE TABLE permissions (id BIGINT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(150) UNIQUE NOT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE TABLE role_permission (role_id BIGINT NOT NULL, permission_id BIGINT NOT NULL, PRIMARY KEY(role_id, permission_id));

CREATE TABLE users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(190) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role_id BIGINT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  INDEX idx_users_role(role_id)
);

CREATE TABLE owners (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(150) NOT NULL,
  phone VARCHAR(40) NOT NULL,
  email VARCHAR(190) NULL,
  address TEXT NULL,
  emergency_contact_name VARCHAR(150) NULL,
  emergency_contact_phone VARCHAR(40) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  deleted_at TIMESTAMP NULL,
  INDEX idx_owners_phone(phone),
  INDEX idx_owners_created_by(created_by)
);

CREATE TABLE species (id BIGINT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(120) UNIQUE NOT NULL);
CREATE TABLE breeds (id BIGINT PRIMARY KEY AUTO_INCREMENT, species_id BIGINT NOT NULL, name VARCHAR(120) NOT NULL, UNIQUE(species_id, name));

CREATE TABLE pets (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  owner_id BIGINT NOT NULL,
  name VARCHAR(120) NOT NULL,
  species_id BIGINT NOT NULL,
  breed_id BIGINT NULL,
  gender ENUM('male','female','unknown') DEFAULT 'unknown',
  date_of_birth DATE NULL,
  color VARCHAR(80) NULL,
  weight_kg DECIMAL(8,2) NULL,
  allergies TEXT NULL,
  notes TEXT NULL,
  image_path VARCHAR(255) NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  deleted_at TIMESTAMP NULL,
  INDEX idx_pets_owner(owner_id),
  INDEX idx_pets_species(species_id)
);

CREATE TABLE appointments (id BIGINT PRIMARY KEY AUTO_INCREMENT, owner_id BIGINT NOT NULL, pet_id BIGINT NOT NULL, doctor_id BIGINT NULL, scheduled_at DATETIME NOT NULL, type ENUM('appointment','walk_in') NOT NULL, status ENUM('booked','checked_in','completed','cancelled') DEFAULT 'booked', reason TEXT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, INDEX idx_appt_date(scheduled_at), INDEX idx_appt_pet(pet_id));
CREATE TABLE visits (id BIGINT PRIMARY KEY AUTO_INCREMENT, appointment_id BIGINT NULL, pet_id BIGINT NOT NULL, doctor_id BIGINT NULL, check_in_at DATETIME NOT NULL, status ENUM('in_queue','in_consultation','completed') DEFAULT 'in_queue', INDEX idx_visits_pet(pet_id));
CREATE TABLE consultations (id BIGINT PRIMARY KEY AUTO_INCREMENT, visit_id BIGINT NOT NULL, symptoms TEXT NULL, diagnosis TEXT NULL, treatment_notes TEXT NULL, followup_instructions TEXT NULL, status ENUM('draft','finalized') DEFAULT 'draft', created_by BIGINT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, INDEX idx_consult_visit(visit_id));

CREATE TABLE medicines (id BIGINT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(150) NOT NULL, sku VARCHAR(80) UNIQUE NULL, unit VARCHAR(40) NOT NULL, reorder_level INT DEFAULT 0, is_active TINYINT(1) DEFAULT 1, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE TABLE medicine_batches (id BIGINT PRIMARY KEY AUTO_INCREMENT, medicine_id BIGINT NOT NULL, batch_no VARCHAR(80) NOT NULL, expiry_date DATE NULL, quantity INT NOT NULL, cost_price DECIMAL(12,2) NOT NULL, selling_price DECIMAL(12,2) NOT NULL, UNIQUE(medicine_id,batch_no), INDEX idx_batch_expiry(expiry_date));
CREATE TABLE prescriptions (id BIGINT PRIMARY KEY AUTO_INCREMENT, consultation_id BIGINT NOT NULL, notes TEXT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE TABLE prescription_items (id BIGINT PRIMARY KEY AUTO_INCREMENT, prescription_id BIGINT NOT NULL, medicine_id BIGINT NOT NULL, dosage VARCHAR(120) NOT NULL, frequency VARCHAR(120) NOT NULL, days INT NOT NULL, quantity INT NOT NULL);
CREATE TABLE pharmacy_issues (id BIGINT PRIMARY KEY AUTO_INCREMENT, prescription_id BIGINT NOT NULL, issued_by BIGINT NULL, status ENUM('issued','cancelled') DEFAULT 'issued', created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE TABLE pharmacy_issue_items (id BIGINT PRIMARY KEY AUTO_INCREMENT, pharmacy_issue_id BIGINT NOT NULL, medicine_batch_id BIGINT NOT NULL, quantity INT NOT NULL, unit_price DECIMAL(12,2) NOT NULL);

CREATE TABLE wards (id BIGINT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(120) NOT NULL, type VARCHAR(60) NULL);
CREATE TABLE beds (id BIGINT PRIMARY KEY AUTO_INCREMENT, ward_id BIGINT NOT NULL, code VARCHAR(50) NOT NULL, status ENUM('available','occupied','maintenance') DEFAULT 'available', UNIQUE(ward_id, code));
CREATE TABLE admissions (id BIGINT PRIMARY KEY AUTO_INCREMENT, pet_id BIGINT NOT NULL, consultation_id BIGINT NULL, admitted_at DATETIME NOT NULL, bed_id BIGINT NULL, status ENUM('admitted','discharged') DEFAULT 'admitted', notes TEXT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, INDEX idx_adm_status(status));
CREATE TABLE treatment_records (id BIGINT PRIMARY KEY AUTO_INCREMENT, admission_id BIGINT NOT NULL, recorded_at DATETIME NOT NULL, notes TEXT NOT NULL, created_by BIGINT NULL);
CREATE TABLE discharge_summaries (id BIGINT PRIMARY KEY AUTO_INCREMENT, admission_id BIGINT NOT NULL UNIQUE, summary TEXT NOT NULL, instructions TEXT NULL, follow_up_date DATE NULL, approved_by BIGINT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE invoices (id BIGINT PRIMARY KEY AUTO_INCREMENT, invoice_no VARCHAR(50) UNIQUE NOT NULL, owner_id BIGINT NOT NULL, pet_id BIGINT NOT NULL, status ENUM('draft','issued','partial','paid','cancelled') DEFAULT 'draft', subtotal DECIMAL(14,2) DEFAULT 0, discount DECIMAL(14,2) DEFAULT 0, tax DECIMAL(14,2) DEFAULT 0, total DECIMAL(14,2) DEFAULT 0, balance DECIMAL(14,2) DEFAULT 0, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, INDEX idx_invoices_status(status));
CREATE TABLE invoice_items (id BIGINT PRIMARY KEY AUTO_INCREMENT, invoice_id BIGINT NOT NULL, source_type VARCHAR(50) NOT NULL, source_id BIGINT NULL, description VARCHAR(255) NOT NULL, quantity DECIMAL(10,2) NOT NULL, unit_price DECIMAL(14,2) NOT NULL, line_total DECIMAL(14,2) NOT NULL);
CREATE TABLE payments (id BIGINT PRIMARY KEY AUTO_INCREMENT, invoice_id BIGINT NOT NULL, method VARCHAR(60) NOT NULL, amount DECIMAL(14,2) NOT NULL, reference_no VARCHAR(120) NULL, paid_at DATETIME NOT NULL, received_by BIGINT NULL, INDEX idx_payments_date(paid_at));
CREATE TABLE refunds (id BIGINT PRIMARY KEY AUTO_INCREMENT, payment_id BIGINT NOT NULL, amount DECIMAL(14,2) NOT NULL, reason TEXT NULL, refunded_at DATETIME NOT NULL, processed_by BIGINT NULL);

CREATE TABLE suppliers (id BIGINT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(150) NOT NULL, contact_person VARCHAR(120) NULL, phone VARCHAR(40) NULL, email VARCHAR(190) NULL, address TEXT NULL);
CREATE TABLE purchases (id BIGINT PRIMARY KEY AUTO_INCREMENT, supplier_id BIGINT NOT NULL, po_no VARCHAR(60) UNIQUE NOT NULL, status ENUM('draft','ordered','received','cancelled') DEFAULT 'draft', ordered_at DATETIME NULL, received_at DATETIME NULL, total DECIMAL(14,2) DEFAULT 0);
CREATE TABLE purchase_items (id BIGINT PRIMARY KEY AUTO_INCREMENT, purchase_id BIGINT NOT NULL, medicine_id BIGINT NOT NULL, quantity INT NOT NULL, unit_cost DECIMAL(12,2) NOT NULL, line_total DECIMAL(14,2) NOT NULL);
CREATE TABLE stock_movements (id BIGINT PRIMARY KEY AUTO_INCREMENT, medicine_id BIGINT NOT NULL, batch_id BIGINT NULL, movement_type ENUM('purchase_receive','dispense','adjustment','return') NOT NULL, quantity INT NOT NULL, reference_type VARCHAR(60) NOT NULL, reference_id BIGINT NOT NULL, moved_at DATETIME NOT NULL, created_by BIGINT NULL, INDEX idx_stock_medicine(medicine_id), INDEX idx_stock_moved_at(moved_at));

CREATE TABLE chart_of_accounts (id BIGINT PRIMARY KEY AUTO_INCREMENT, code VARCHAR(30) UNIQUE NOT NULL, name VARCHAR(150) NOT NULL, type ENUM('asset','liability','equity','income','expense') NOT NULL);
CREATE TABLE ledger_entries (id BIGINT PRIMARY KEY AUTO_INCREMENT, account_id BIGINT NOT NULL, entry_date DATE NOT NULL, debit DECIMAL(14,2) DEFAULT 0, credit DECIMAL(14,2) DEFAULT 0, memo VARCHAR(255) NULL, reference_type VARCHAR(60) NULL, reference_id BIGINT NULL, INDEX idx_ledger_date(entry_date));
CREATE TABLE expenses (id BIGINT PRIMARY KEY AUTO_INCREMENT, account_id BIGINT NOT NULL, amount DECIMAL(14,2) NOT NULL, expense_date DATE NOT NULL, description VARCHAR(255) NOT NULL);
CREATE TABLE settings (id BIGINT PRIMARY KEY AUTO_INCREMENT, `key` VARCHAR(120) UNIQUE NOT NULL, `value` JSON NULL);
CREATE TABLE audit_logs (id BIGINT PRIMARY KEY AUTO_INCREMENT, user_id BIGINT NULL, action VARCHAR(120) NOT NULL, auditable_type VARCHAR(120) NOT NULL, auditable_id BIGINT NOT NULL, old_values JSON NULL, new_values JSON NULL, ip_address VARCHAR(64) NULL, created_at TIMESTAMP NULL, INDEX idx_audit_entity(auditable_type, auditable_id));

ALTER TABLE users ADD CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES roles(id);
ALTER TABLE role_permission ADD CONSTRAINT fk_rp_role FOREIGN KEY (role_id) REFERENCES roles(id);
ALTER TABLE role_permission ADD CONSTRAINT fk_rp_permission FOREIGN KEY (permission_id) REFERENCES permissions(id);
ALTER TABLE owners ADD CONSTRAINT fk_owners_created_by FOREIGN KEY (created_by) REFERENCES users(id);
ALTER TABLE breeds ADD CONSTRAINT fk_breeds_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE pets ADD CONSTRAINT fk_pets_owner FOREIGN KEY (owner_id) REFERENCES owners(id);
ALTER TABLE pets ADD CONSTRAINT fk_pets_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE pets ADD CONSTRAINT fk_pets_breed FOREIGN KEY (breed_id) REFERENCES breeds(id);
ALTER TABLE appointments ADD CONSTRAINT fk_appointments_owner FOREIGN KEY (owner_id) REFERENCES owners(id);
ALTER TABLE appointments ADD CONSTRAINT fk_appointments_pet FOREIGN KEY (pet_id) REFERENCES pets(id);
ALTER TABLE visits ADD CONSTRAINT fk_visits_appointment FOREIGN KEY (appointment_id) REFERENCES appointments(id);
ALTER TABLE visits ADD CONSTRAINT fk_visits_pet FOREIGN KEY (pet_id) REFERENCES pets(id);
ALTER TABLE consultations ADD CONSTRAINT fk_consultations_visit FOREIGN KEY (visit_id) REFERENCES visits(id);
ALTER TABLE prescriptions ADD CONSTRAINT fk_prescriptions_consultation FOREIGN KEY (consultation_id) REFERENCES consultations(id);
ALTER TABLE prescription_items ADD CONSTRAINT fk_prescription_items_prescription FOREIGN KEY (prescription_id) REFERENCES prescriptions(id);
ALTER TABLE prescription_items ADD CONSTRAINT fk_prescription_items_medicine FOREIGN KEY (medicine_id) REFERENCES medicines(id);
ALTER TABLE medicine_batches ADD CONSTRAINT fk_medicine_batches_medicine FOREIGN KEY (medicine_id) REFERENCES medicines(id);
ALTER TABLE pharmacy_issues ADD CONSTRAINT fk_pharmacy_issues_prescription FOREIGN KEY (prescription_id) REFERENCES prescriptions(id);
ALTER TABLE pharmacy_issue_items ADD CONSTRAINT fk_pharmacy_issue_items_issue FOREIGN KEY (pharmacy_issue_id) REFERENCES pharmacy_issues(id);
ALTER TABLE pharmacy_issue_items ADD CONSTRAINT fk_pharmacy_issue_items_batch FOREIGN KEY (medicine_batch_id) REFERENCES medicine_batches(id);
ALTER TABLE beds ADD CONSTRAINT fk_beds_ward FOREIGN KEY (ward_id) REFERENCES wards(id);
ALTER TABLE admissions ADD CONSTRAINT fk_admissions_pet FOREIGN KEY (pet_id) REFERENCES pets(id);
ALTER TABLE admissions ADD CONSTRAINT fk_admissions_consultation FOREIGN KEY (consultation_id) REFERENCES consultations(id);
ALTER TABLE admissions ADD CONSTRAINT fk_admissions_bed FOREIGN KEY (bed_id) REFERENCES beds(id);
ALTER TABLE treatment_records ADD CONSTRAINT fk_treatment_records_admission FOREIGN KEY (admission_id) REFERENCES admissions(id);
ALTER TABLE discharge_summaries ADD CONSTRAINT fk_discharge_summaries_admission FOREIGN KEY (admission_id) REFERENCES admissions(id);
ALTER TABLE invoices ADD CONSTRAINT fk_invoices_owner FOREIGN KEY (owner_id) REFERENCES owners(id);
ALTER TABLE invoices ADD CONSTRAINT fk_invoices_pet FOREIGN KEY (pet_id) REFERENCES pets(id);
ALTER TABLE invoice_items ADD CONSTRAINT fk_invoice_items_invoice FOREIGN KEY (invoice_id) REFERENCES invoices(id);
ALTER TABLE payments ADD CONSTRAINT fk_payments_invoice FOREIGN KEY (invoice_id) REFERENCES invoices(id);
ALTER TABLE refunds ADD CONSTRAINT fk_refunds_payment FOREIGN KEY (payment_id) REFERENCES payments(id);
ALTER TABLE purchases ADD CONSTRAINT fk_purchases_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(id);
ALTER TABLE purchase_items ADD CONSTRAINT fk_purchase_items_purchase FOREIGN KEY (purchase_id) REFERENCES purchases(id);
ALTER TABLE purchase_items ADD CONSTRAINT fk_purchase_items_medicine FOREIGN KEY (medicine_id) REFERENCES medicines(id);
ALTER TABLE stock_movements ADD CONSTRAINT fk_stock_movements_medicine FOREIGN KEY (medicine_id) REFERENCES medicines(id);
ALTER TABLE ledger_entries ADD CONSTRAINT fk_ledger_entries_account FOREIGN KEY (account_id) REFERENCES chart_of_accounts(id);
ALTER TABLE expenses ADD CONSTRAINT fk_expenses_account FOREIGN KEY (account_id) REFERENCES chart_of_accounts(id);
ALTER TABLE audit_logs ADD CONSTRAINT fk_audit_logs_user FOREIGN KEY (user_id) REFERENCES users(id);
