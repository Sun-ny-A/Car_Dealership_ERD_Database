
ALTER TABLE car
DROP COLUMN serial_number;

ALTER TABLE car
RENAME COLUMN car_id TO serial_number;

ALTER TABLE mechanics
RENAME COLUMN car_id TO serial_number;

ALTER TABLE salesperson
RENAME COLUMN car_id TO serial_number;

ALTER TABLE salesperson
DROP COLUMN units_sold;

--originally had location_id in staff delete but must have accidentally deleted it, adding column
ALTER TABLE staff
ADD COLUMN location_id integer;

INSERT INTO staff(location_id)
VALUES ('')


CREATE OR REPLACE FUNCTION addcustomer(
		first_name varchar(100),
		last_name varchar(150),
		cust_email varchar(50),
		cust_address varchar(150)
) RETURNS INTEGER AS $$
BEGIN
	INSERT INTO customer(
		customer_id,
		first_name,
		last_name,
		cust_email,
		cust_address
	)	VALUES (
		customer_id,
		first_name,
		last_name,
		cust_email,
		cust_address
	);
	RETURN customer_id;
END
$$ LANGUAGE plpgsql;


SELECT addcustomer('003', 'John', 'Wayne', 'cowboywayne@email.com', '45 Rodeo Dr Los Angeles, IL 60615');


SELECT *
FROM staff;


INSERT INTO customer(customer_id, first_name, last_name, cust_email, cust_address)
VALUES ('000', 'Mary', 'Gonna', 'mary@email.com', '555 Circle Dr Chicago, IL 60614'),
('001', 'Tyler', 'Makeit', 'tyler@email.com', '125 Triangle Dr Chicago, IL 60615'),
('002', 'Moore', 'Afterall', 'moore@email.com', '223 Hexagon Dr Chicago, IL 60616');

INSERT INTO staff(staff_id, first_name, last_name, staff_email, staff_address)
VALUES ('111', 'Josephine', 'Baker', 'jb@caremail.com', '423 Red St Los Angeles, CA 34232'),
('112', 'Tyler', 'Perry', 'tp@caremail.com', '988 Blue Dr New York, NY 64235'),
('113', 'Hypatia', 'Woman', 'hw@caremail.com', '242 Purple Ln, Austin TX 99879');

--adding more staff for mechanics table
INSERT INTO staff(staff_id, first_name, last_name, staff_email, staff_address)
VALUES ('114', 'Tom', 'Holland', 'th@caremail.com', '89 Turquoise St Los Angeles, CA 34232');

--adding location_id values
INSERT INTO staff(location_id)
VALUES ('399'),
('396'),
('394'),
('395');


INSERT INTO phone_number(phone_id, customer_id, staff_id, phone)
VALUES ('789', null, 111, '773-744-9999'),
('799', null, '111', '772-744-9999'),
('798', null, '111', '771-744-9999'),
('797', null, '112', '323-744-9999'),
('796', null, '113', '887-744-9999'),
('95', null, '113', '111-744-9999'),
('794', '000', null, '976-744-9999'),
('793', '001', null, '454-744-9999'),
('792', '002', null, '907-744-9999'),
('791', '002', null, '292-744-9999');

INSERT INTO dealership(store_id, store_name)
VALUES ('221', 'Chicago Dealers'),
('222', 'NYC Dealers'),
('223', 'Austin Dealers');

INSERT INTO _location(location_id, store_id, address, store_phone)
VALUES ('399', '221', '6100 Ashland Ave Chicago IL 60657', '999-999-9999'),
('398', '221', '3100 W Cermak Ave Chicago IL 60687', '888-888-8888'),
('397', '221', '1100 Belmont Ave Chicago IL 60647', '777-777-7777'),
('396', '222', '1200 21st Ave New York NY 60637', '666-777-7777'),
('395', '222', '1400 100th Ave New York NY 60637', '555-777-7777'),
('394', '223', '1600 Ranch Ln Austin TX 60617', '444-777-7777'),
('393', '223', '1500 Street St Austin TX  60647', '333-777-7777'),
('392', '223', '1700 Lane Ln Austin TX  60647', '222-777-7777'),
('391', '223', '1800 Boulevard Blvd Austin TX 60647', '111-777-7777');

SELECT *
FROM _inventory;


INSERT INTO inventory(inventory_id, item, category, seller, purchase_date, purchase_price, quantity, location_id, notes)
VALUES ('022', 'car', 'car', 'honda', '07/30/2022', '35000.00', '1', '399', 'black, brand new, excellent condition'),
('023', 'spark plug','ignition system', 'CarMania', '08/10/2023', '40.00', '3', '398', '1 year warranty from date of purchase');

INSERT INTO salesperson(salesperson_id, staff_id, serial_number)
VALUES ('499', '111', '12345'),
('498', '111', '2345'),
('497', '112', '3456');

--car table is cars that have been sold so would not still be in inventory table
ALTER TABLE car
DROP COLUMN inventory_id;

INSERT INTO car(serial_number, make, model, _year, car_price)
VALUES ('12345', 'honda', 'accord', '2022', '30000.00'),
('2345', 'toyota', 'corolla', '2022', '28000.00'),
('3456', 'BMW', 'i8', '2022', '148500.00');

INSERT INTO sale_invoice(invoice_id, customer_id, salesperson_id, sale_date, purchase_amount, total_sale, notes)
VALUES ('599', '000', '499', '05/05/2022', '30000', '35000.00', null),
('598', '001', '498', '06/30/2023', '28000', '32000.00', 'customer will want a used car next summer for daughter'),
('597', '002', '497', '09/12/2022', '148000', '155000.00', 'custom paint after one year');

SELECT *
FROM sale_invoice;

--purchase_date should be purchase_amount
ALTER TABLE sale_invoice
RENAME COLUMN purchase_date TO purchase_amount;

INSERT INTO mechanics(mechanic_id, staff_id, serial_number)
VALUES ('699', '113', '12345'),
('698', '114', '2345');

INSERT INTO service_invoice(service_id, serial_number, customer_id, mechanic_id, _type, service_date, purchase_service, notes)
VALUES ('899', '12345', '000', '699', 'maintenance', '01/04/2023', '55.00', 'first oil change after purchase'),
 ('898', '2345', '001', '698', 'maintenance', '09/24/2023', '45.00', 'first oil change after purchase')

 ALTER TABLE service_invoice
 DROP COLUMN purchase_date;











