CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE customer(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    number_of_complaints INT DEFAULT 0
);

INSERT INTO customer (first_name, last_name, email_address)
VALUE('Nguyen Quang', 'Hai', 'quanghai@gmail.com');

INSERT INTO customer (first_name, last_name, email_address, number_of_complaints)
VALUE('Nguyen Tuan', 'Anh', 'anhtuan@gmail.com', 1);

CREATE TABLE SALES(
	purchase_number INT AUTO_INCREMENT PRIMARY KEY,
    date_of_perchase DATE NOT NULL,
    customer_id INT NOT NULL,
    item_code CHAR(3)
);

CREATE TABLE items(
	item_code CHAR(3) PRIMARY KEY,
    item DATE NOT NULL,
    unit_price_usd INT NOT NULL,
    company_id INT NOT NULL,
    company VARCHAR(50) NOT NULL,
    headquarters_phone_number CHAR(17)
);

























