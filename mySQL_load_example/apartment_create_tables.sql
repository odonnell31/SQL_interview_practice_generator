# find path to put CSV files in (mySQL specific..)
SHOW VARIABLES LIKE "secure_file_priv";

# create table: apartments
CREATE TABLE apartments (apartment_id int, building_id int,
       vacant_status int, rent int, pet_friendly int,
       PRIMARY KEY (apartment_id));

# load apartments.csv into apartments
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\apartments.csv' 
INTO TABLE apartments 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# view apartments header data
SELECT * FROM apartments
LIMIT 5;

# create table: buildings
CREATE TABLE buildings (building_id int, building_address VARCHAR(75),
		city VARCHAR(25), floors int, units int, built_year int,
        PRIMARY KEY (building_id));

# load buildings.csv into buildings
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\buildings.csv' 
INTO TABLE buildings 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# view buildings header data
SELECT * FROM buildings
LIMIT 5;

# create table: tenants
CREATE TABLE tenants (tenant_id int, tenant_name VARCHAR(50), 
		apartment_id int, renter_income int,
        lease_start DATE, lease_end DATE,
        PRIMARY KEY (tenant_id));

# load tenants.csv into tenants
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\tenants.csv' 
INTO TABLE tenants
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# view tenants header data
SELECT * FROM tenants;

# view all tables in database
SHOW TABLES;