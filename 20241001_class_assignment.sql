




*/

SELECT '' AS 'Installation Starting!!!!';

*/

SELECT '' AS 'Dropping Users';

DROP USER IF EXISTS 'guttman_root'@'local_host';
DROP USER IF EXISTS 'test_user_01'@'local_host';
DROP USER IF EXISTS 'test_user_02'@'local_host';
DROP USER IF EXISTS 'test_user_03'@'local_host';
DROP USER IF EXISTS 'test_user_04'@'local_host';
DROP USER IF EXISTS 'test_user_05'@'local_host';

SELECT '' AS 'Creating user';

CREATE USER IF NOT EXISTS 'guttman_root'@'local_host'
    IDENTIFIED BY  'grizzlies_2024'
    PASSWORD REQUIRE CURRENT;

    CREATE USER IF NOT EXISTS 'test_user_01'@'local_host'
    IDENTIFIED BY  'test_user_20241001'

    FAILED_LOGIN_ATTEMPTS 4
    PASSWORD_LOCK_TIME 1
    PASSWORD EXPIRE INTERVAL 90 DAY
    PASSWORD HISTORY 5
    PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER IF NOT EXISTS 'test_user_02'@'local_host'
    IDENTIFIED BY  'test_user_20241001'

    WITH MAX_QUERIES_PER_HOUR 40
      MAX_UPDATES_PER_HOUR 10
      MAX_CONNECTIONS_PER_HOUR 75
      MAX_USER_CONNECTIONS 2

    FAILED_LOGIN_ATTEMPTS 1
    PASSWORD_LOCK_TIME UNBOUNDED
    PASSWORD EXPIRE INTERVAL 30 DAY
    PASSWORD HISTORY 25
    PASSWORD REUSE INTERVAL 365 DAY;

CREATE USER IF NOT EXISTS 'test_user_03'@'local_host'
  IDENTIFIED BY  'test_user_20241001'

CREATE USER IF NOT EXISTS 'test_user_04'@'local_host'
  IDENTIFIED BY  'test_user_20241001'

CREATE USER IF NOT EXISTS 'test_user_05'@'local_host'
  IDENTIFIED BY  'test_user_20241001'

  SELECT '' AS 'CREATING ROLES';
  DROP ROLE IF EXISTS 'read_only_employees_db',
                      'read_department_info';
  SELECT '' AS 'Granting privledges';

  GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD
    
