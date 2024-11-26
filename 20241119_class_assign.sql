/* Francis Danaher




*/
\! CLS;

SELECT 'LINE 09' AS 'Installation Starting!!!';
SELECT USER() AS 'INSTALLATION USER';


DROP DATABASE IF EXISTS my_testdb;






CREATE DATABASE IF NOT EXISTS my_testdb





CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

SHOW DATABASES;


USE my_testdb;

SELECT 'LINE 33' AS 'DATABASE CREATION COMPLETED', DATABASE() AS 'DATABASE NAME';


CREATE OR REPLACE VIEW vw_get_employee_dept
AS
  SELECT
        USER() AS 'Requested_By',
        e.emp_no AS 'Employee',
        d.dept_no AS 'Department_Number',
        d.dept_name AS 'Department_Name',
        de.from_date AS 'dept_date',
        NOW() AS 'Day_Time'
  FROM
      employees.employees e
  JOIN
      employees.dept_emp de ON e.emp_no = de.emp_no
  JOIN
      employees.departments d ON de.dept_no = d.dept_no;

SELECT *
FROM vw_get_employee_dept
LIMIT 10;

DROP FUNCTION IF EXISTS usf_get_max_date;
DELIMITER $$
CREATE FUNCTION usf_get_max_date(e_emp_no INT)
        RETURNS DATE DETERMINISTIC
BEGIN
      DECLARE v_get_max DATE;
      SELECT
          MAX(from_date)
      INTO v_get_max
      FROM
            employees.dept_emp
      WHERE
            emp_no = e_emp_no;

      RETURN v_get_max;
END$$
DELIMITER ;

SELECT usf_get_max_date(10010);

DROP PROCEDURE IF EXISTS usp_get_employee_dept;

DELIMITER //
CREATE PROCEDURE usp_get_employee_dept (IN e_emp_no INT)





BEGIN
    SELECT
        Requested_By AS 'Requested_By',
        Employee,
        Department_Number AS 'Department_Number',
        Department_Name AS 'Department_Name',
        Day_Time AS 'Timestamp'
    FROM vw_get_employee_dept
    WHERE
        employee = e_emp_no
        AND
        dept_date = (SELECT usf_get_max_date(e_emp_no));
END//
DELIMITER ;

CALL usp_get_employee_dept(10010);

SELECT
      'Installation' AS 'Completed',
      USER() AS 'BY',
      DATABASE() AS 'ON',
      NOW() AS 'AT';
