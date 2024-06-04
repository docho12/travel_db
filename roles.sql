CREATE ROLE db_admin;
GRANT ALL PRIVILEGES ON *.* TO db_admin;

CREATE ROLE table_manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON trips TO table_manager;

CREATE ROLE column_manager;
GRANT SELECT(user_id, username), INSERT(user_id, username) ON users TO column_manager;

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'password';
GRANT db_admin TO 'admin_user'@'localhost';

CREATE USER 'trip_manager'@'localhost' IDENTIFIED BY 'password';
GRANT table_manager TO 'trip_manager'@'localhost';

CREATE USER 'user_manager'@'localhost' IDENTIFIED BY 'password';
GRANT column_manager TO 'user_manager'@'localhost';
