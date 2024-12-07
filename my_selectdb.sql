/* Francis Danaher
   12/4/24
   Purpose: Create 8 tables with primary and foreign keys.
*/

SELECT 'Installation Starting!!!' AS 'Status';

DROP DATABASE IF EXISTS my_selectdb;

CREATE DATABASE my_selectdb;


SHOW DATABASES;

USE my_selectdb;



SELECT 'LINE 19' AS 'DATABASE CREATION COMPLETED', DATABASE() AS 'DATABASE NAME';



CREATE TABLE IF NOT EXISTS category(
      category_id CHAR(2) ,
      category_name VARCHAR(25) ,
      PRIMARY KEY (category_id)
);
INSERT INTO category (category_id, category_name)
VALUES
('CP', 'Camping'),
('FW', 'Footwear');
SELECT 'Category Table Created' AS 'Status';
SELECT * FROM category;
SHOW TABLES;


CREATE TABLE IF NOT EXISTS product(
      product_id CHAR(3),
      product_name VARCHAR(25) ,
      product_price DECIMAL(7,2) ,
      vendor_id CHAR(2) ,
      category_id CHAR(2) ,
      PRIMARY KEY (product_id),
      FOREIGN KEY (category_id) REFERENCES category(category_id)
);
INSERT INTO product (product_id, product_name, product_price, vendor_id, category_id)
VALUES
('1X1', 'Zzz Bag', 100, 'PG', 'CP'),
('2X2', 'Easy Boot', 70, 'MK', 'FW'),
('3X3', 'Cozy Sock', 15, 'MK', 'FW'),
('4X4', 'Dura Boot', 90, 'PG', 'FW'),
('5X5', 'Tiny Tent', 150, 'MK', 'CP'),
('6X6', 'Biggy Tent', 250, 'MK', 'CP');
SELECT 'Product Table Created' AS 'Status';
SELECT * FROM product;
SHOW TABLES;


CREATE TABLE IF NOT EXISTS customer(
      customer_id CHAR(7) ,
      customer_name VARCHAR(15) ,
      customer_zip CHAR(5) ,
      PRIMARY KEY (customer_id)
);
INSERT INTO customer (customer_id, customer_name, customer_zip)
VALUES
('1-2-333', 'Tina', 60137),
('2-3-444', 'Tony', 60611),
('3-4-555', 'Pam', 35401);
SELECT 'Customer Table Created' AS 'Status';
SELECT * FROM customer;
SHOW TABLES;


CREATE TABLE IF NOT EXISTS  soldvia(
      product_id CHAR(3) ,
      t_id VARCHAR(8) ,
      noof_items INT NOT NULL,
      PRIMARY KEY (product_id, t_id),
      FOREIGN KEY (product_id) REFERENCES product(product_id),
      UNIQUE (t_id)
);
INSERT INTO soldvia (product_id, t_id, noof_items)
VALUES
('1X1', 'T111', 1),
('2X2', 'T222', 1),
('3X3', 'T666', 5),
('1X1', 'T333', 1),
('4X4', 'T777', 1),
('2X2', 'T444', 2),
('4X4', 'T888', 4),
('5X5', 'T999', 2),
('6X6', 'T555', 1);
SELECT 'SoldVia Table Created' AS 'Status';
SELECT * FROM soldvia;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS vendor(
      vendor_id CHAR(2) ,
      vendor_name VARCHAR(25) ,
      PRIMARY KEY (vendor_id)
);
INSERT INTO vendor (vendor_id, vendor_name)
VALUES
('PG', 'Pacifica Gear'),
('MK', 'Mountain King');
SELECT 'Vendor Table Created' AS 'Status';
SELECT * FROM vendor;
SHOW TABLES;


CREATE TABLE IF NOT EXISTS store(
      store_id VARCHAR(3) ,
      store_zip CHAR(5) ,
      region_id CHAR(1) ,
      PRIMARY KEY (store_id),
      UNIQUE (region_id)
);
INSERT INTO store (store_id, store_zip, region_id)
VALUES
('S1', 60600, 'C'),
('S2', 60605, 'D'),
('S3', 35400, 'T');
SELECT 'Store Table Created' AS 'Status';
SELECT * FROM store;
SHOW TABLES;


CREATE TABLE IF NOT EXISTS salestransaction(
      t_id VARCHAR(8) ,
      customer_id CHAR(7) ,
      store_id VARCHAR(3) ,
      t_date DATE NOT NULL,
      PRIMARY KEY (t_id, customer_id, store_id),
      FOREIGN KEY (t_id) REFERENCES soldvia(t_id),
      FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
      FOREIGN KEY (store_id) REFERENCES store(store_id)
);
SELECT 'SalesTransaction Table Created' AS 'Status';
SELECT * FROM salestransaction;
SHOW TABLES;
