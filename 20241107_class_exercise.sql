





SYSTEM CLS;

SELECT 'LINE 09' AS 'Installation Starting!!!';
SELECT USER() AS 'INSTALLATION USER';


DROP DATABASE IF EXISTS my_testdb;






CREATE DATABASE IF NOT EXISTS my_testdb





CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

USE my_testdb;
SHOW DATABASES;

SELECT 'LINE 31' AS 'DATABASE CREATION COMPLETED';


DROP PROCEDURE IF EXISTS usp_get_employee_dept;


DELIMITER //

CREATE PROCEDURE IF NOT EXISTS usp_get_employee_dept (IN e_emp_no INT)
CREATE TABLE IF NOT EXISTS my_testdb.employees

BEGIN
    SELECT
            'Successful' AS 'Installation',
            e.emp_no,
            d.dept_no,
            d.dept_name
    FROM
            employees e
    JOIN
            dept_emp de ON e.emp_no = de.emp_no
    JOIN
            departments d ON de.dept_no = d.dept_no
    WHERE
            e.emp_no = e_emp_no
            AND
            de.from_date =(
                          SELECT
                              MAX(from_date)
                          FROM
                              dept_emp
                          WHERE
                              emp_no = e_emp_no
            );
END//

DELIMITER ;

CALL usp_get_employee_dept(10010);
