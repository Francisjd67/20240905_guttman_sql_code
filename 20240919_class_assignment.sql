CREATE DATABASE IF NOT EXISTS courses;

USE courses;

CREATE TABLE IF NOT EXISTS order_info(

order_info_id INT,
order_id  INT,
product_id INT,
product_quantity INT
);
DROP TABLE IF NOT EXISTS orders(

order_id  INT   AUTO_INCREMENT,
order_date  DATE,
order_info_id INT,
order_valer INT,
order_currency  VARCHAR(10),

PRIMARY KEY( order_id),
FOREIGN KEY(order_info_id) REFERENCES order_info(order_info_id)
);
