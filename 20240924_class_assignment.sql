/* Francis Danaher
   Date created 12/3
   Purpose: Creating tables including primary and foreign keys.
*/


DROP DATABASE IF EXISTS 20240924_testdb;
CREATE DATABASE IF NOT EXISTS 20240924_testdb;

USE 20240924_testdb;

SHOW DATABASES;

SELECT 'DATABASE CREATED' as 'STATUS';

DROP TABLE IF EXISTS supplier;

CREATE TABLE IF NOT EXISTS supplier(

    id INT AUTO_INCREMENT,
    company_name VARCHAR(225),
    contact_name VARCHAR(30),
    city VARCHAR(15),
    country VARCHAR(15),
    phone VARCHAR(24),
    fax VARCHAR(24),

    PRIMARY KEY (id),
    UNIQUE (city, country, phone)

);


DROP TABLE IF EXISTS product;

CREATE TABLE IF NOT EXISTS product(

    id INT AUTO_INCREMENT,
    product_name VARCHAR(40),
    supplier_id INT,
    unit_price DECIMAL(10,4),
    package VARCHAR(50),
    is_discontinued ENUM('Y','N') DEFAULT 'N',

    PRIMARY KEY (id),
    UNIQUE (unit_price)

);

DROP TABLE IF EXISTS orderitem;

CREATE TABLE IF NOT EXISTS orderitem(

    id INT AUTO_INCREMENT,
    order_id INT ,
    product_id INT ,
    unit_price DECIMAL (10,4),
    quantity INT ,

    PRIMARY KEY (id),
    FOREIGN KEY (unit_price) REFERENCES product(unit_price)

);

DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS orders(

    id INT AUTO_INCREMENT,
    order_date DATE NOT NULL,
    customer_id INT,
    total_amount INT,

    PRIMARY KEY (id)

);


DROP TABLE IF EXISTS customer;

CREATE TABLE IF NOT EXISTS customer(

    id INT AUTO_INCREMENT,
    first_name VARCHAR(20),
    last_name VARCHAR(30),
    city VARCHAR(15),
    country VARCHAR(15),
    phone VARCHAR(24),

    PRIMARY KEY (id),
    FOREIGN KEY (city, country, phone) REFERENCES supplier(city,country,phone)


);

SELECT 'TABLES CREATED' as 'STATUS';

SHOW TABLES;
