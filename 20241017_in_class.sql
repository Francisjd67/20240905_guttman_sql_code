/* Francis Danaher                                      Date created 10/24/24

                  This script creates a database, customers, and an order table, and
                  performs 7 SQL joins.
*/


SELECT 'LINE 8' AS 'INSTALLATION SCRIPT STARTING!!!';

SELECT USER() AS 'INSTALLATION USER';

DROP DATABASE IF EXISTS testdb_20241017;

CREATE DATABASE IF NOT EXISTS testdb_20241017
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

SHOW DATABASES;













SELECT 'LINE 31' AS 'DATABASE CREATION COMPLETED!!!';

USE testdb_20241017;

DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers(
      customer_id   INT AUTO_INCREMENT,
      first_name    VARCHAR(30),
      PRIMARY KEY(customer_id)
);





SELECT 'LINE 46' AS 'CREATED TABLE';
SHOW TABLES;

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
      order_id   INT AUTO_INCREMENT,
      amount    DECIMAL(7,2),
      customers   INT,
      PRIMARY KEY(order_id),
      FOREIGN KEY(customers) REFERENCES customers(customer_id)
);

SELECT 'LINE 58' AS 'CREATED TABLE';
SHOW TABLES;
INSERT INTO customers(first_name)
VALUES ('John'),
       ('Robert'),
       ('David'),
       ('John'),
       ('Betty');
SELECT 'LINE 67' AS 'CUSTOMER DATA ADDED';
INSERT INTO orders(amount, customers)
VALUES      (500, (SELECT customer_id FROM customers WHERE first_name = 'David')),
            (200, (SELECT customer_id FROM customers WHERE first_name = 'Robert')),
            (600, (SELECT customer_id FROM customers WHERE first_name = 'John')),
            (800, (SELECT customer_id FROM customers WHERE first_name = 'Betty'));

SELECT 'LINE 73' AS 'ORDERS DATA ADDED';
SELECT 'LINE 74' AS 'INNER JOIN';
SELECT c.customer_id, c.first_name, o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customers;



SELECT 'LINE 82' AS 'LEFT OUTER JOIN';
SELECT c.customer_id, c.first_name, o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customers;

SELECT 'LINE 88' AS 'LEFT OUTER JOIN EXCLUDING INNER JOIN';
SELECT c.customer_id, c.first_name, o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customers
WHERE c.customer_id IS NULL
    OR
      o.customers IS NULL;

SELECT 'LINE 97' AS 'RIGHT OUTER JOIN';
SELECT c.customer_id, c.first_name, o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customers;

SELECT 'LINE 103' AS 'RIGHT OUTER JOIN EXCLUDING INNER JOIN';
SELECT c.customer_id, c.first_name, o.amount
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customers
WHERE c.customer_id IS NULL
    OR
      o.customers IS NULL;
