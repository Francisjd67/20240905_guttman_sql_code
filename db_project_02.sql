/* Name: Francis Danaher
Date Created: 12/1
Purpose: This code creates MySQL users and assigns roles and privileges to each user.
*/

SELECT 'Installation Starting' AS 'Status';

USE employees;
/*Dropping any existing users*/
DROP USER IF EXISTS 'prj_root'@'localhost';
DROP USER IF EXISTS 'prj_user_01'@'localhost';
DROP USER IF EXISTS 'prj_user_02'@'localhost';
DROP USER IF EXISTS 'prj_user_03'@'localhost';


/*Admin user*/
CREATE USER 'prj_root'@'localhost' IDENTIFIED BY 'password';

/* Users with specific roles and privileges*/
CREATE USER 'prj_user_01'@'localhost' IDENTIFIED BY 'password'
    FAILED_LOGIN_ATTEMPTS 0
    PASSWORD_LOCK_TIME 0
    PASSWORD EXPIRE INTERVAL 90 DAY
    PASSWORD HISTORY 5
    PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER 'prj_user_02'@'localhost' IDENTIFIED BY 'password'
    FAILED_LOGIN_ATTEMPTS 0
    PASSWORD_LOCK_TIME 1
    PASSWORD EXPIRE INTERVAL 90
    DAY PASSWORD HISTORY 5
    PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER 'prj_user_03'@'localhost' IDENTIFIED BY 'password'
    FAILED_LOGIN_ATTEMPTS 4
    PASSWORD_LOCK_TIME UNBOUNDED
    PASSWORD EXPIRE INTERVAL 90
    DAY PASSWORD HISTORY 5
    PASSWORD REUSE INTERVAL 365 DAY;

/*Grants privileges to the users based on each user*/
GRANT ALL PRIVILEGES ON *.* TO 'prj_root'@'localhost' WITH GRANT OPTION;
GRANT INSERT, UPDATE ON employees.* TO 'prj_user_01'@'localhost';
GRANT 'read_only_classicmodels_db' TO 'prj_user_02'@'localhost';
GRANT 'read_all_employees' TO 'prj_user_03'@'localhost';


SELECT 'Installation Completed' AS 'Status';
