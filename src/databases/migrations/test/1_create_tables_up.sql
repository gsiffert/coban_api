
--
-- Create the tables
--

CREATE TABLE companies(id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name NVARCHAR(50) NOT NULL,
PRIMARY KEY(id));

CREATE TABLE addresses(id INT UNSIGNED NOT NULL AUTO_INCREMENT,
zip NVARCHAR(50) NOT NULL,
street NVARCHAR(100) NOT NULL,
city NVARCHAR(50) NOT NULL,
company_id INT UNSIGNED NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE);

CREATE TABLE accounts(id INT UNSIGNED NOT NULL AUTO_INCREMENT,
email NVARCHAR(100) NOT NULL,
password NVARCHAR(200) NOT NULL,
scope TINYINT UNSIGNED NOT NULL,
PRIMARY KEY(id));

CREATE TABLE users(id INT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name NVARCHAR(100) NOT NULL,
last_name NVARCHAR(100) NOT NULL,
account_id INT UNSIGNED NOT NULL,
company_id INT UNSIGNED NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(account_id) REFERENCES accounts(id) ON DELETE CASCADE,
FOREIGN KEY(company_id) REFERENCES companies(id) ON DELETE CASCADE);

CREATE TABLE devices(id INT UNSIGNED NOT NULL AUTO_INCREMENT,
is_paired BOOL NOT NULL,
user_id INT UNSIGNED NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE);

CREATE TABLE stations(id INT UNSIGNED NOT NULL AUTO_INCREMENT,
line_code INT UNSIGNED NOT NULL,
station_code INT UNSIGNED NOT NULL,
company NVARCHAR(250) NOT NULL,
line NVARCHAR(250) NOT NULL,
name NVARCHAR(250) NOT NULL,
PRIMARY KEY(id));

CREATE TABLE transport_histories(id INT UNSIGNED NOT NULL AUTO_INCREMENT,
date DATETIME NOT NULL,
stock INT UNSIGNED NOT NULL,
expense INT UNSIGNED NOT NULL,
entrance_id INT UNSIGNED NOT NULL,
exit_id INT UNSIGNED NOT NULL,
user_id INT UNSIGNED NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(entrance_id) REFERENCES stations(id) ON DELETE CASCADE,
FOREIGN KEY(exit_id) REFERENCES stations(id) ON DELETE CASCADE,
FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE);
