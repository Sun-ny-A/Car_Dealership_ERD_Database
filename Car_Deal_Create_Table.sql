CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name varchar(100),
	last_name varchar(150),
	cust_email varchar(50),
	cust_address varchar(150)
);

CREATE TABLE staff(
	staff_id SERIAL PRIMARY KEY,
	department varchar(100),
	first_name varchar(100),
	last_name varchar(150),
	staff_email varchar(50),
	staff_address varchar(150)
);

--to store multple phone numbers of a customer or staff

CREATE TABLE phone_number(
	phone_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customer(customer_id),
  staff_id INT REFERENCES staff(staff_id),
	phone varchar(15)
);

CREATE TABLE dealership(
	store_id SERIAL PRIMARY KEY,
	store_name varchar(100)
);

CREATE TABLE _location(
	location_id SERIAL PRIMARY KEY,
	store_id INT REFERENCES dealership(store_id),
	address varchar(150),
	store_phone varchar(15)
);

CREATE TABLE inventory(
	inventory_id SERIAL PRIMARY KEY,
	item varchar(100),
	category varchar(100),
	seller varchar(100),
	purchase_date date,
	purchase_price numeric(8,2),
	quantity integer,
	location_id INT REFERENCES _location(location_id),
	notes varchar(500)
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	inventory_id INT REFERENCES inventory(inventory_id),
	make varchar(50),
	model varchar(50),
	_year integer,
	car_price numeric(8,2),
	serial_number integer
);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	staff_id INT REFERENCES staff(staff_id),
	car_id INT REFERENCES car(car_id),
	units_sold integer
);

CREATE TABLE sale_invoice(
	invoice_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customer(customer_id),
	salesperson_id INT REFERENCES salesperson(salesperson_id),
	sale_date date,
	purchase_date numeric(8,2),
	total_sale numeric(8,2),
	notes varchar(500)
);

CREATE TABLE mechanics(
	mechanic_id SERIAL PRIMARY KEY,
	staff_id INT REFERENCES staff(staff_id),
	car_id INT REFERENCES car(car_id)
);

CREATE TABLE service_invoice(
	service_id SERIAL PRIMARY KEY,
	serial_number INT REFERENCES car(serial_number),
	customer_id INT REFERENCES customer(customer_id),
	mechanic_id INT REFERENCES mechanics(mechanic_id),
	_type varchar(50),
	service_date date,
	purchase_date numeric(8,2),
	purchase_service numeric(8,2),
	notes varchar(500)
);




