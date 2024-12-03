/* Francis Danaher
   12/1/24
   Purpose: Create 8 tables with primary and foreign keys.
*/

SELECT 'Installation Starting!!!' AS 'Status';

DROP DATABASE IF EXISTS my_project_db_01;

CREATE DATABASE my_project_db_01;

SELECT 'LINE 12' AS 'DATABASE CREATION COMPLETED', DATABASE() AS 'DATABASE NAME';
SHOW DATABASES;

USE my_project_db_01;


CREATE TABLE IF NOT EXISTS category(
      category_id CHAR(2) ,
      category_name VARCHAR(25) ,
      PRIMARY KEY (category_id)
);
SELECT 'Category Table Created' AS 'Status';
SELECT * FROM category;


CREATE TABLE IF NOT EXISTS product(
      product_id CHAR(3),
      product_name VARCHAR(25) ,
      product_price DECIMAL(7,2) ,
      vendor_id CHAR(2) ,
      category_id CHAR(2) ,
      PRIMARY KEY (product_id),
      FOREIGN KEY (category_id) REFERENCES category(category_id)
);
SELECT 'Product Table Created' AS 'Status';
SELECT * FROM product;


CREATE TABLE IF NOT EXISTS customer(
      customer_id CHAR(7) ,
      customer_name VARCHAR(15) ,
      customer_zip CHAR(5) ,
      PRIMARY KEY (customer_id)
);
SELECT 'Customer Table Created' AS 'Status';
SELECT * FROM customer;


CREATE TABLE IF NOT EXISTS  soldvia(
      product_id CHAR(3) ,
      t_id VARCHAR(8) ,
      noof_items INT NOT NULL,
      PRIMARY KEY (product_id, t_id),
      FOREIGN KEY (product_id) REFERENCES product(product_id),
      UNIQUE (t_id)
);
SELECT 'SoldVia Table Created' AS 'Status';
SELECT * FROM soldvia;


CREATE TABLE IF NOT EXISTS vendor(
      vendor_id CHAR(2) ,
      vendor_name VARCHAR(25) ,
      PRIMARY KEY (vendor_id)
);
SELECT 'Vendor Table Created' AS 'Status';
SELECT * FROM vendor;


CREATE TABLE IF NOT EXISTS store(
      store_id VARCHAR(3) ,
      store_zip CHAR(5) ,
      region_id CHAR(1) ,
      PRIMARY KEY (store_id),
      UNIQUE (region_id)
);
SELECT 'Store Table Created' AS 'Status';
SELECT * FROM store;


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


CREATE TABLE IF NOT EXISTS region(
    region_id CHAR(1) ,
    region_name VARCHAR(25) ,
    PRIMARY KEY (region_id),
    FOREIGN KEY (region_id) REFERENCES store(region_id)
);
SELECT 'Region Table Created' AS 'Status';
SELECT * FROM region;

SELECT 'Installation Completed' AS 'Status';
