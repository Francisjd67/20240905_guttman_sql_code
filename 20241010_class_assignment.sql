
SELECT '' AS 'INSTALLATION SCRIPT STARTING!!!';

DROP DATABASE IF EXISTS testdb_20241010;

CREATE DATABASE IF NOT EXISTS testdb_20241010
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED';

USE testdb_20241010;

DROP TABLE IF EXISTS student;

CREATE TABLE IF NOT EXISTS student (
  student_id INT AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(10) NOT NULL,
  PRIMARY KEY (student_id)
);

SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED';

DROP TABLE IF EXISTS company;

CREATE TABLE IF NOT EXISTS company (
  company_id INT AUTO_INCREMENT,
  name VARCHAR(20),
  address VARCHAR(100),
  email VARCHAR(50),
  phone VARCHAR(10),
  PRIMARY KEY (company_id)
);

SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED';

DROP TABLE IF EXISTS customer;

CREATE TABLE IF NOT EXISTS customer (
  customer_id INT AUTO_INCREMENT,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  age INT,
  country VARCHAR(50),
  PRIMARY KEY (customer_id)
);



SHOW TABLES;

INSERT INTO customer (first_name, last_name, age, country)
VALUES
('Adam', 'White', '22', 'Idia'),
('Darren', 'Addams', '31', 'Germany');

SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED';

SELECT '' AS 'INSTALLATION SCRIPT COMPLETED';

SELECT * FROM student;

SELECT * FROM company;

SELECT * FROM customer;
