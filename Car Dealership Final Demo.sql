USE mydb;


#Vehicle
SELECT * FROM vehicle;
INSERT INTO vehicle (`VIN`, `year`, `make`, `model`, `color`, `mileage`, `eng_type`, `body_style`, `sale_price`, `status`) VALUES ('JH4DC2383WS006148', 2025, 'Nissan', 'Sentra', 'White', '22', '2.0 L 4-cylinder', 'Sedan', '25998', 'New');
SELECT * FROM vehicle;

SELECT body_style, MAX(sale_price) as `Max Sale Price` 
FROM vehicle
GROUP BY body_style;

SELECT * FROM vehicle;
UPDATE vehicle SET `sale_price` = '20698' WHERE (`VIN` = 'WBANV13598CZ48442');
SELECT * FROM vehicle;

DELETE FROM vehicle WHERE (`VIN` = 'JH4DC2383WS006148');
SELECT * FROM vehicle;


#staff
SELECT * FROM staff;

UPDATE staff SET `email` = 'jsnow@carsales.com' WHERE (`emp_ID` = '1');
UPDATE staff SET `email` = 'agreen@carsales.com' WHERE (`emp_ID` = '2');
UPDATE staff SET `email` = 'twilliam@carsales.com' WHERE (`emp_ID` = '3');
UPDATE staff SET `email` = 'sadams@carsales.com' WHERE (`emp_ID` = '4');
UPDATE staff SET `email` = 'asmith@carsales.com' WHERE (`emp_ID` = '5');
UPDATE staff SET `email` = 'tgold@carsales.com' WHERE (`emp_ID` = '6');
SELECT * FROM staff;

INSERT INTO staff (`emp_id`,`f_name`, `l_name`, `role`, `email`) VALUES ('7','Yolanda', 'Web', 'Customer Service', 'yweb@carsales.com');
SELECT * FROM staff;

SELECT role, COUNT(emp_id) as total_employees 
FROM staff
GROUP BY role;

DELETE FROM `staff` WHERE (`emp_ID` = '7');
SELECT * FROM staff;


#finance department
SELECT * FROM `finance department`;

INSERT INTO `finance department`(`cust_score`, `i_rate`, `loan_term`, `mnth_pymt`) VALUES ('628', '0', '0', '0');
SELECT * FROM `finance department`;

UPDATE `finance department` SET `i_rate` = '11.22' WHERE (`contract_id` = '1000');
SELECT * FROM `finance department`;

SELECT ROUND(AVG(mnth_pymt),2) as `Average Monthly Payment` 
FROM `finance department`
WHERE mnth_pymt > 1;

DELETE FROM `finance department` WHERE (`contract_id` = '1010');
SELECT * FROM `finance department`;


#sales
SELECT * FROM sales;

SELECT sale_type, COUNT(sale_type) as `Sale Type` 
FROM sales
GROUP BY sale_type;

INSERT INTO sales (`sales_id`,`sale_date`, `sale_type`, `cust_id`) VALUES ('106','2024-12-13', 'Full', '13');
SELECT * FROM sales;

UPDATE sales SET `sale_date` = '2024-11-23' WHERE (`sales_id` = '105');
SELECT * FROM sales;

DELETE FROM sales WHERE (`sales_id` = '106');
SELECT * FROM sales;


#customer
SELECT * FROM customer;

SELECT cust_id, COUNT(contract_id) as `Purchases Per Customer` 
FROM customer
GROUP BY cust_id;

INSERT INTO customer (`cust_id`,`cust_fname`, `cust_lname`, `DOB`, `address`, `phone`, `email`) VALUES ('16','Justin', 'Baker', '2002-09-11', '4009 Prospect Street Camden, NJ 08102', '6095042645', 'justinbaker@nomail.com');
SELECT * FROM customer;

UPDATE customer SET `cust_lname` = 'Maker' WHERE (`cust_id` = '16');
SELECT * FROM customer;

DELETE FROM customer WHERE (`cust_id` = '16');
SELECT * FROM customer;


# Part 3
# Working with Finance Department, Sales, Customer and Staff tables
SELECT *
FROM `finance department` fd
JOIN customer c ON fd.cust_id = c.cust_id
JOIN staff e ON fd.emp_id = e.emp_id
JOIN sales s ON fd.sales_id = s.sales_id;

# Filter this down
SELECT 
	fd.contract_id, 
    fd.loan_term, 
    fd.mnth_pymt as `Monthly Payment`, 
    c.cust_fname, 
    c.cust_lname, 
    c.phone,
    e.emp_id,
    s.sales_id
FROM `finance department` fd
JOIN customer c ON fd.cust_id = c.cust_id
JOIN staff e ON fd.emp_id = e.emp_id
JOIN sales s ON fd.sales_id = s.sales_id;

# Working with Sales, Customer, Staff, and Vehicle tables
SELECT *
FROM sales s
JOIN customer c ON s.cust_id = c.cust_id
JOIN staff e ON s.emp_ID = e.emp_id
JOIN vehicle v ON s.VIN = v.VIN;

# Filtering table down
SELECT 
	s.sales_id, 
	s.sale_date, 
	s.sale_type, 
	c.cust_fname, 
	c.cust_lname, 
	c.phone,
	e.emp_id,
	v.VIN
FROM sales s
JOIN customer c ON s.cust_id = c.cust_id
JOIN staff e ON s.emp_id = e.emp_id
JOIN vehicle v ON s.VIN = v.VIN;

# Working with Customer and Finance Department tables
SELECT *
FROM customer c
JOIN `finance department` fd ON fd.contract_id = c.contract_id;

# Filtering down
SELECT 
	c.cust_fname,
    c.cust_lname,
    c.DOB,
    fd.cust_score,
    fd.i_rate
FROM customer c
JOIN `finance department` fd ON fd.contract_id = c.contract_id;