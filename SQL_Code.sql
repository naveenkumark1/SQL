-- Create Database - This creates a database
create database sql_intro;

-- Show Databases - This lists all the existing databases
show databases;

-- Use Databases - Use a specified database 
use sql_intro;

-- Delete Database - Deletes a database 
drop database if exists sql_intro;

-- -- Cloning a Database ----
-- See the list of the databases
show databases;
use sys;
show tables;
-- Create backup 
-- Servet tab -> Data export -> Select the schema and table -> Export options -> Export to self contained file -> 
-- -> Select locaiton -> Add filename -> Start export -> Data will be exported to SQL file (Optional we can delete the database)

-- Crete new database 
create database ecomm2;
use ecomm2;

create database if not exists e_commerce;

-- Copy the data from SQL file to the new database 
-- -> Use the data import tab 

-- Check if the process is successful
show tables;

-- STORAGE ENGINES
-- See storage engines 
SHOW ENGINES;

-- set default storage engine
set default_storage_engine = INNODB;

-- Create table using an engine - engine command

(Table creation code
) engine = INNODB;

create database employees_db;
CREATE TABLE IF NOT EXISTS employees_db.EMP_TABLE (
 EMP_ID VARCHAR(4) NOT NULL,
 FIRST_NAME VARCHAR(100) NOT NULL,
 LAST_NAME VARCHAR(100),
 GENDER VARCHAR(1),
 ROLE VARCHAR(100),
 DEPT VARCHAR(100),
 MANAGER_ID VARCHAR(100),
 check(GENDER in ('M', 'F', 'O'))
) ENGINE=INNODB;

-- Convert table from one storage engine to other storage engine - alter table command 

alter table ecomm2.category engine = InnoDB; 
ALTER TABLE employees_db.EMP_TABLE ENGINE=MERGE;

-- Table Manipulation commands in MYSQL 

-- create table 
-- describe table 
-- show table 
-- alter table 
-- truncate table 
-- drop table 

## Creating the Employee records table 

CREATE TABLE IF NOT EXISTS 
employees_db.EMP_RECORDS (
 EMP_ID VARCHAR(4) NOT NULL,
 FIRST_NAME VARCHAR(100) NOT NULL,
 LAST_NAME VARCHAR(100),
 GENDER VARCHAR(1)
) ENGINE=INNODB;

## Check constrain - To be used when creating a table to check if the column or the table satisfied a boolean expressison 

CREATE TABLE IF NOT EXISTS 
employees_db.EMP_TABLE_2 (
 EMP_ID VARCHAR(4) NOT NULL,
 FIRST_NAME VARCHAR(100) NOT NULL,
 LAST_NAME VARCHAR(100),
 GENDER VARCHAR(1),
 ROLE VARCHAR(100),
 DEPT VARCHAR(100),
 MANAGER_ID VARCHAR(100),
 EXP INTEGER NOT NULL CHECK (EXP >= 0)
) ENGINE=INNODB;

## Analysing the table descreption using the 'describe' statement 

describe e_commerce;
describe employees_db.emp_records;

## List all the tables using the 'show' tables 

show tables;

use employees_db;
show tables;

## Table manipluation - Modify the table structure 
## Alter - Add col, Modify col, Rename col, Dropping col

## Add column - Single column and Multiple column
## Single column
ALTER TABLE employees_db.EMP_RECORDS
ADD ROLE VARCHAR(100);

## Multiple column 
ALTER TABLE employees_db.EMP_RECORDS
ADD DEPT VARCHAR(100),
ADD MANAGER_ID VARCHAR(100);

DESCRIBE employees_db.EMP_RECORDS;

## Modify columns - 
## Drop column
ALTER TABLE employees_db.EMP_RECORDS
DROP COLUMN MANAGER_ID;

## Check drop columns for multiple columns ??? 

## Renaming a table 
ALTER TABLE employees_db.EMP_RECORDS
RENAME TO employees_db.EMP_DATA;

### Generated columns : Use 'add' and 'generate always as' statements 
ALTER TABLE employees_db.EMP_DATA
ADD FULL_NAME VARCHAR(200)
GENERATED ALWAYS AS(CONCAT(FIRST_NAME,' ',LAST_NAME));

## Truncating tables in my SQL - deletes all the records from the table 
TRUNCATE TABLE employees_db.EMP_DATA;

## Dropping tables in MySQL - Single and multiple tables 
use employees_db;
show tables;

DROP TABLE IF EXISTS
employees_db.emp_data,
employees_db.emp_table;

### Insert and query data in tables 

## 'insert' is used to insert one or more rows in to the table 
CREATE TABLE IF NOT EXISTS 
employees_db.EMP_TABLE (
 EMP_ID VARCHAR(4) NOT NULL,
 FIRST_NAME VARCHAR(100) NOT NULL,
 LAST_NAME VARCHAR(100),
 GENDER VARCHAR(1),
 ROLE VARCHAR(100),
 DEPT VARCHAR(100),
 MANAGER_ID VARCHAR(100),
 check(GENDER in ('M', 'F', 'O'))
) ENGINE=INNODB;

DESCRIBE employees_db.EMP_TABLE;

## Single column 
INSERT INTO employees_db.EMP_TABLE(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,MANAGER_ID)
VALUES ("E260", "Roy", "Collins", "M", "SENIOR DATA SCIENTIST", "RETAIL", 
"E583");

## Multiple column
INSERT INTO 
employees_db.EMP_TABLE(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,MANAGER_ID)
VALUES
("E620", "Katrina", "Allen", "F", "JUNIOR DATA SCIENTIST", "RETAIL","E612"),
("E583", "Janet", "Hale", "F", "MANAGER", "RETAIL", "E002"),
("E612", "Tracy", "Norris", "F", "MANAGER", "RETAIL", "E002"),
("E002", "Cynthia", "Brooks", "F", "PRESIDENT", "ALL", "E001");


### Update data in the table - Single or multiple columns 

-- Upload data from extrnal CSV - lesson 8 (proj_records.csv)
-- Createdb -> rightclick -> Data import wizard -> select csv

create database csv;
use csv;

show tables;

CREATE TABLE csv.proj_records_bkp AS
SELECT * FROM csv.proj_records;

UPDATE PROJ_RECORDS_BKP
SET DEV_QTR = 'Q2'
WHERE (START_DATE, CLOSURE_DATE) IN (
 SELECT START_DATE, CLOSURE_DATE
 FROM PROJ_RECORDS
 WHERE DEV_QTR = 'Q3'
);

## Query data from tables 
SELECT EMP_ID, FIRST_NAME, GENDER
FROM employees_db.EMP_table;

## Select with the * condition to select all the columns 
SELECT * FROM employees_db.EMP_table;

#### Filtering the data 

## ----------------------------------------------------------------------------
##----------------------------  NEW Code --------------------------------------
## ----------------------------------------------------------------------------

## Comments 
-- Single line comment 
## Single line comment 
/* Multi
line
comment */

#The following are the most important SQL commands for database manipulation:
#1. CREATE DATABASE
#2. SHOW DATABASES
#3. USE
#4. DROP DATABASE (or DROP SCHEMA

# Step 1: Create a database named employees_db with the CREATE DATABASE statement.
CREATE DATABASE IF NOT EXISTS 
employees_db;

#Step 2: Create another database named employees_db_2 with the CREATE DATABASE statement.
CREATE DATABASE IF NOT EXISTS 
employees_db_2;

#Step 1: Use the SHOW DATABASES statement to list all the existing databases as given below
SHOW DATABASES;

# Step 1: Use the USE statement to change the default database to employees_db as given below.
USE employees_db;

# Step 2: Use the SELECT databases() statement to verify the default database as given below.
SELECT database();

#Step 1: Use the DROP statement to drop the employees_db_2 database, as given below.
DROP DATABASE IF EXISTS employees_db_2;

#Making a clone of an original database in MySQL includes the following three steps:
#• Step 1: Create a SQL file backup of the original database
#• Step 2: Create a new database
#• Step 3: Copy the data from the SQL file to the new database

CREATE DATABASE new_database_name;
USE new_database_name;
CREATE TABLE new_database_name.table_name AS
SELECT * FROM old_database_name.table_name;

# Storage engines 
#Following are some of the MySQL storage engines:
#1. InnoDB
#2. MyISAM
#3. MERGE (MRG_MyISAM)
#4. CSV

# See engines
SHOW ENGINES;


#Step 1: Use the SET statement to set the value for the default_storage_engine variable as 
#INNODB to make it the default storage engine for the employees_db database as given below
SET default_storage_engine = INNODB;

#Step 1: Create the required EMP_TABLE table in the employees_db database with the CREATE 
#TABLE statement and set the value for the ENGINE variable as INNODB as given below.

CREATE TABLE IF NOT EXISTS 
employees_db.EMP_TABLE (
 EMP_ID VARCHAR(4) NOT NULL,
 FIRST_NAME VARCHAR(100) NOT NULL,
 LAST_NAME VARCHAR(100),
 GENDER VARCHAR(1),
 ROLE VARCHAR(100),
 DEPT VARCHAR(100),
 MANAGER_ID VARCHAR(100),
 check(GENDER in ('M', 'F', 'O'))
) ENGINE=INNODB;

#Step 1: Use the ALTER TABLE statement to set the value for the ENGINE variable to MERGE to 
#set it as the default storage engine for the EMP_TABLE table as given below.

ALTER TABLE employees_db.EMP_TABLE 
ENGINE=MERGE;

#The following are the most crucial SQL commands for manipulating tables:
#1. CREATE TABLE
#2. DESCRIBE
#3. SHOW TABLES
#4. ALTER TABLE
#5. TRUNCATE TABLE
#6. DROP TABLE

#Step 1: Create the required EMP_RECORDS table in the employees_db database with the 
#CREATE TABLE statement as given below.

CREATE TABLE IF NOT EXISTS 
employees_db.EMP_RECORDS (
 EMP_ID VARCHAR(4) NOT NULL,
 FIRST_NAME VARCHAR(100) NOT NULL,
 LAST_NAME VARCHAR(100),
 GENDER VARCHAR(1)
) ENGINE=INNODB;

#Step 2: Use the CREATE TABLE statement with the CHECK clause and a column constraint for the 
#EXP column to create another table similar to EMP_RECORDS named EMP_TABLE_2 as given below.

CREATE TABLE IF NOT EXISTS 
employees_db.EMP_TABLE_2 (
 EMP_ID VARCHAR(4) NOT NULL,
 FIRST_NAME VARCHAR(100) NOT NULL,
 LAST_NAME VARCHAR(100),
 GENDER VARCHAR(1),
 ROLE VARCHAR(100),
 DEPT VARCHAR(100),
 MANAGER_ID VARCHAR(100),
 EXP INTEGER NOT NULL CHECK (EXP >= 0)
) ENGINE=INNODB;

#Step 3: Use the CREATE TABLE statement with the CHECK and CONSTRAINT clauses along with a 
#table constraint for the EXP and GENDER columns respectively to create another table similar to 
#EMP_TABLE_2 named EMP_TABLE_3 as given below.

CREATE TABLE IF NOT EXISTS employees_db.EMP_TABLE_3 (
 EMP_ID VARCHAR(4) NOT NULL,
 FIRST_NAME VARCHAR(100) NOT NULL,
 LAST_NAME VARCHAR(100),
 GENDER VARCHAR(1),
 ROLE VARCHAR(100),
 DEPT VARCHAR(100),
 MANAGER_ID VARCHAR(100),
 EXP INTEGER NOT NULL CHECK (EXP >= 0),
 CONSTRAINT gender_check CHECK(GENDER in ('M', 'F', 'O'))
) ENGINE=INNODB;

#Step 4: Use the DESCRIBE statement to analyze the structure of the EMP_RECORDS table as 
#given below.

DESCRIBE employees_db.EMP_RECORDS;

#Step 5: Use the SHOW TABLES statement to display all the available tables in the 
#employees_db database, as given below.

use employees_db;
SHOW TABLES;

#The ALTER statement is used to modify a table by performing actions such as adding a 
#column, altering a column, renaming a column, dropping a column, and renaming a table.
#• Following are some of the operations that the ALTER statement can perform:
#1. Adding columns to a table
#2. Modifying columns in a table
#3. Renaming a column in a table
#4. Dropping a column
#5. Renaming a table

#Two ways to add columns to a table:
#1. Adding a single column to a table
#2. Adding multiple columns to a table

#Step 6: Use the ALTER TABLE statement with the ADD clause to add a ROLE column in the 
#EMP_RECORDS table as given below.

ALTER TABLE employees_db.EMP_RECORDS
ADD ROLE VARCHAR(100);

#Step 7: Use the ALTER TABLE statement with the ADD clause to add the DEPT and 
#MANAGER_ID columns in the EMP_RECORDS table as given below

ALTER TABLE employees_db.EMP_RECORDS
ADD DEPT VARCHAR(100),
ADD MANAGER_ID VARCHAR(100);

#Step 8: Use the DESCRIBE statement to analyze the structure of the EMP_RECORDS table to 
#verify the changes as given below.

DESCRIBE employees_db.EMP_RECORDS;

#Two ways to modify columns in a table:
#1. Modifying a single column in a table
#2. Modifying multiple columns in a table

#Step 9: Use the ALTER TABLE statement with the MODIFY clause to add a NOT NULL 
#constraint to the GENDER column in the EMP_RECORDS table as given below.
ALTER TABLE employees_db.EMP_RECORDS
MODIFY GENDER VARCHAR(1) NOT NULL;

#Step 10: Use the ALTER TABLE statement with the MODIFY clause to add a NOT NULL 
#constraint to both DEPT and MANAGER_ID columns in the EMP_RECORDS table as given 
#below.

ALTER TABLE employees_db.EMP_RECORDS
MODIFY DEPT VARCHAR(100) NOT NULL,
MODIFY MANAGER_ID VARCHAR(100) NOT NULL;

#Step 11: Use the DESCRIBE statement to analyze the structure of the EMP_RECORDS table to 
#verify the changes as given below.

DESCRIBE employees_db.EMP_RECORDS;

#Step 12: Use the ALTER TABLE statement with the CHANGE COLUMN clause to rename the 
#ROLE column as JOB in the EMP_RECORDS table as given below.

ALTER TABLE employees_db.EMP_RECORDS
CHANGE COLUMN ROLE JOB VARCHAR(100);

DESCRIBE employees_db.EMP_RECORDS;

#Step 14: Use the ALTER TABLE statement with the DROP clause to drop the MANAGER_ID
#column in the EMP_RECORDS table as given below.

ALTER TABLE employees_db.EMP_RECORDS
DROP COLUMN MANAGER_ID;

DESCRIBE employees_db.EMP_RECORDS;

#Step 16: Use the ALTER TABLE statement with the RENAME TO clause to rename the 
#EMP_RECORDS table to EMP_DATA as given below.

ALTER TABLE employees_db.EMP_RECORDS
RENAME TO employees_db.EMP_DATA;

SHOW TABLES;
DESCRIBE employees_db.EMP_DATA;

## Generated columns : Generated columns are those whose data is generated using predefined expressions and 
#computations.

#Step 19: Use the ALTER TABLE statement with the ADD and GENERATED ALWAYS AS clauses 
#to add a FULL_NAME column generated by combining the FIRST_NAME and LAST_NAME 
#columns in the EMP_RECORDS table as given below.

ALTER TABLE employees_db.EMP_DATA
ADD FULL_NAME VARCHAR(200)
GENERATED ALWAYS AS(CONCAT(FIRST_NAME,' 
',LAST_NAME));

DESCRIBE employees_db.EMP_DATA;  # Shows virtual generated 

#To delete all data in an existing table in the MySQL database, use the TRUNCATE TABLE
#statement.

#Step 21: Use the TRUNCATE TABLE statement to delete all records from the EMP_DATA table 
#as given below.

TRUNCATE TABLE employees_db.EMP_DATA;

#Step 22: Use the SELECT statement with * condition to analyze the data available in the 
#EMP_DATA table as given below.

SELECT * FROM employees_db.EMP_DATA;

#To remove existing tables in the MySQL database, use the DROP TABLE statement.
#• The dropping operation can be performed in the following ways:
#1. Dropping a single table
#2. Dropping multiple tables

SHOW TABLES;

DROP TABLE IF EXISTS
employees_db.emp_data,
employees_db.emp_table;

SHOW TABLES;

## Insert : In MySQL, the INSERT statement is used to insert one or more rows to a table.

#Step 1: Create the required EMP_TABLE table in the employees_db database with the CREATE 
#TABLE statement as given below.

CREATE TABLE IF NOT EXISTS 
employees_db.EMP_TABLE (
 EMP_ID VARCHAR(4) NOT NULL,
 FIRST_NAME VARCHAR(100) NOT NULL,
 LAST_NAME VARCHAR(100),
 GENDER VARCHAR(1),
 ROLE VARCHAR(100),
 DEPT VARCHAR(100),
 MANAGER_ID VARCHAR(100),
 check(GENDER in ('M', 'F', 'O'))
) ENGINE=INNODB;

DESCRIBE employees_db.EMP_TABLE;

#• The insert operation can be performed in the following ways:
#1. Inserting the values for a single row in the table
#2. Inserting the values for multiple rows in the table

#Step 3: Use the INSERT TABLE statement with VALUES clause to insert the required data only 
#for the first row into the EMP_TABLE table, as shown below.

INSERT INTO 
employees_db.EMP_TABLE(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,MANAGER_ID)
VALUES ("E260", "Roy", "Collins", "M", "SENIOR DATA SCIENTIST", "RETAIL", "E583");

INSERT INTO 
employees_db.EMP_TABLE(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,MANAGER_ID)
VALUES
("E620", "Katrina", "Allen", "F", "JUNIOR DATA SCIENTIST", "RETAIL", "E612"),
("E583", "Janet", "Hale", "F", "MANAGER", "RETAIL", "E002"),
("E612", "Tracy", "Norris", "F", "MANAGER", "RETAIL", "E002"),
("E002", "Cynthia", "Brooks", "F", "PRESIDENT", "ALL", "E001");

#• To update records in the table, use the UPDATE statement.
### Update data in the table - Single or multiple columns 

-- Upload data from extrnal CSV - lesson 8 (proj_records.csv)
-- Createdb -> rightclick -> Data import wizard -> select csv

create database csv;
use csv;

show tables;

CREATE TABLE csv.proj_records_bkp AS
SELECT * FROM csv.proj_records;

UPDATE PROJ_RECORDS_BKP
SET DEV_QTR = 'Q2'
WHERE (START_DATE, CLOSURE_DATE) IN (
 SELECT START_DATE, CLOSURE_DATE
 FROM PROJ_RECORDS
 WHERE DEV_QTR = 'Q3'
);

SELECT * FROM csv.proj_records_bkp;

#Querying Data from Tables
#• To query data from one or more tables, use the SELECT statement.

#Step 1: Use the SELECT statement to fetch the values for the EMP_ID, FIRST_NAME, and GENDER
#columns from the EMP_DATA table, as given below.

SELECT EMP_ID, FIRST_NAME, GENDER
FROM employees_db.emp_table;

#Step 1: Use the SELECT statement with the * condition to fetch the values of all the columns 
#from the EMP_DATA table, as given below.

SELECT * FROM employees_db.emp_table;

#Filtering Data from Tables in MySQL
#The following are the most important SQL commands for filtering data from tables:
#1. WHERE
#2. SELECT DISTINCT
#3. AND
#4. OR
#5. NOT
#6. IN
#7. NOT IN
#8. BETWEEN
#9. LIKE
#10. LIMIT
#11. IS NULL

#WHERE Clause in SELECT Statement
#• The WHERE clause in the SELECT statement allows us to filter rows returned by a query by 
#specifying a search condition.
#• There is no built-in Boolean type in MySQL. Instead, it considers zero to be FALSE and non-zero numbers to be TRUE.
#• The search condition in a WHERE clause is a logical expression that uses the AND, OR, and 
#NOT logical operators to combine one or more expressions.

#WHERE Clause in SELECT Statement: Example
#Step 1: Use the SELECT statement with the WHERE clause to fetch the values of all the columns 
#where ROLE is set to MANAGER from the EMP_TABLE table as given below.

SELECT * FROM employees_db.EMP_TABLE
WHERE ROLE = "MANAGER";

#DISTINCT Clause in SELECT Statement
#• The DISTINCT clause in the SELECT statement is used to eliminate duplicate rows from the 
#result set that may be produced while querying data from a table.
#• When using the DISTINCT clause to provide a column with NULL values, the DISTINCT clause 
#will only preserve one NULL value since it considers all NULL values to be the same.

#DISTINCT Clause in SELECT Statement: Example
#Step 1: Use the SELECT statement with the DISTINCT clause to get all the unique values of the 
#ROLE column from the EMP_TABLE table as given below.

SELECT DISTINCT ROLE
FROM employees_db.EMP_TABLE
ORDER BY ROLE;

#AND Operator in MySQL
#• The AND operator is a logical operator that combines two or more Boolean expressions and 
#returns 1, 0, or NULL.
#• The AND operator is used for filtering data with the WHERE clause.

#Step 1: Use the SELECT statement with the WHERE clause and AND operator to get the values of 
#all the columns where ROLE is set to MANAGER and DEPT is set to RETAIL from the EMP_TABLE
#table as given below.

SELECT * FROM employees_db.EMP_TABLE
WHERE ROLE = "MANAGER"
AND DEPT = "RETAIL";

#OR Operator in MySQL
#• The OR operator is a logical operator that combines two Boolean expressions and returns 1 
#(true) if either of the expressions is true.
#• The OR operator is used for filtering data with the WHERE clause

#OR Operator in MySQL: Example
#Step 1: Use the SELECT statement with the WHERE clause and OR operator to get the values of 
#all the columns where ROLE is set to either MANAGER or PRESIDENT from the EMP_TABLE table 
#as given below.

SELECT * FROM employees_db.EMP_TABLE
WHERE ROLE = "MANAGER"
OR ROLE = "PRESIDENT";

#IN Operator in MySQL
#• The IN operator is used to determine if a value matches any other value in a list.
#• If the value equals any value in the list (value1, value2, value3,...), the IN operator returns 1 
#(true). Otherwise, it returns a value of 0

#IN Operator in MySQL: Example
#Step 1: Use the SELECT statement with the WHERE clause and IN operator to get values of all the 
#columns where ROLE is set to the required profiles from the EMP_TABLE table as given below.

SELECT * FROM employees_db.EMP_TABLE
WHERE 
ROLE IN ("JUNIOR DATA SCIENTIST", "SENIOR DATA SCIENTIST");

#NOT IN Operator in MySQL
#• The NOT IN operator is formed by combining the NOT and IN operators.
#• The NOT IN operator, in contrast to the IN operator, is used to determine if a value does not 
#match any of the values in a list

#NOT IN Operator in MySQL: Example
#Step 1: Use the SELECT statement with the WHERE clause and NOT IN operator to get the values 
#of all the columns where ROLE is set to the required profiles from the EMP_TABLE table as given 
#below.

SELECT * FROM employees_db.EMP_TABLE
WHERE 
ROLE NOT IN ("MANAGER", "PRESIDENT");

#------ Assited practice - Filtering 

#BETWEEN Operator in MySQL
#• The BETWEEN operator is a logical operator that determines whether a value belongs in a 
#range.
#• If the following condition is true, the BETWEEN operator returns 1: value >= low AND value 
#<= high
#• Otherwise, it returns 0.
#• The BETWEEN operator returns NULL if the value, low, or high is NULL.

#BETWEEN Operator in MySQL: Example
#Step 1: Use the TRUNCATE TABLE statement to delete all records from the EMP_TABLE as given below.

TRUNCATE TABLE employees_db.EMP_TABLE;

#Step 2: Use the ALTER TABLE statement with the ADD clause to add an EXP column to the 
#EMP_TABLE table as given below.

ALTER TABLE employees_db.EMP_TABLE
ADD EXP INTEGER;

#Step 3: Use the INSERT TABLE statement with VALUES clause to insert the required data for 
#multiple rows into the EMP_RECORDS table, as shown below.
INSERT INTO employees_db.EMP_TABLE(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,MANAGER_ID,EXP)
VALUES
("E260", "Roy", "Collins", "M", "SENIOR DATA SCIENTIST", "RETAIL", "E583", 7),
("E620", "Katrina", "Allen", "F", "JUNIOR DATA SCIENTIST", "RETAIL", "E612", 2),
("E583", "Janet", "Hale", "F", "MANAGER", "RETAIL", "E002", 14),
("E612", "Tracy", "Norris", "F", "MANAGER", "RETAIL", "E002", 13),
("E002", "Cynthia", "Brooks", "F", "PRESIDENT", "ALL", "E001", 17);

SELECT * FROM employees_db.EMP_TABLE;

#Step 5: Use the SELECT statement with the WHERE clause and BETWEEN operator to get values 
#of all columns where EXP is between 7 to 14 from the EMP_TABLE table as given below.

SELECT * FROM employees_db.EMP_TABLE
WHERE EXP BETWEEN 7 AND 14;

#LIKE Operator and Wildcards
#• The LIKE operator is a logical operator that determines whether or not a string contains a 
#specified pattern.
#• The LIKE operator returns 1 (true) if the expression in the syntax matches the pattern. 
#Otherwise, it returns 0 (false).
#• For creating patterns, MySQL supports two wildcard characters:
#1. Percentage (%): It matches any string of zero or more characters
#1. Underscore (_): It matches any single character

#When a wildcard character appears in a pattern, the ESCAPE clause is used to treat it as a 
#regular character.
#• The LIKE operator is utilized in the WHERE clause of the SELECT, DELETE, and UPDATE
#statements.
#• Wildcard Example 1: The s% matches any string that starts with the character s such as sun
#and six. 
#• Wildcard Example 2: The se_ matches any string that starts with se and is followed by any 
#character such as see and sea.

#Step 1: Use the INSERT TABLE statement with VALUES clause to insert the required data for 
#multiple rows into the EMP_TABLE, as shown below.

INSERT INTO 
employees_db.EMP_TABLE(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,MANAGER_ID,EXP)
VALUES
("E052", "Dianna", "Wilson", "F", "SENIOR DATA SCIENTIST", "HEALTHCARE", "E083", 6),
("E505", "Chad", "Wilson", "M", "ASSOCIATE DATA SCIENTIST", "HEALTHCARE","E083", 5),
("E083", "Patrick", "Voltz", "M", "MANAGER", "HEALTHCARE", "E002", 15);

#Step 2: Use the SELECT statement with the WHERE clause and LIKE operator to get values of all 
#columns where LAST_NAME starts with w from the EMP_TABLE table as given below.

SELECT * FROM employees_db.EMP_TABLE
WHERE LAST_NAME LIKE "w%";

#---- Assisted practice limiting

#LIMIT Operator in MySQL
#• The LIMIT clause in the SELECT statement is used to limit the number of rows returned.
#• One or two arguments are accepted by the LIMIT clause, and their values must be zero or 
#positive integers.
#• Since the SELECT statement returns rows in an arbitrary order by default, the rows returned 
#are unpredictable when the LIMIT clause is added to the SELECT statement.
#• As a result, the LIMIT clause should always be used with an ORDER BY clause to ensure that 
#the expected output is produced.

#LIMIT Operator in MySQL: Example
#Step 1: Use the SELECT statement with the ORDER BY clause and LIMIT operator to get the 
#required values of the rows from the EMP_TABLE table as given below.

SELECT * FROM employees_db.EMP_TABLE
ORDER BY EXP
LIMIT 3;

#IS NULL Operator in MySQL
#• The IS NULL operator determines whether or not a value is NULL.
#• The expression returns 1 (true) if the value is NULL. Otherwise, it returns 0 (false).
#• IS NULL is a comparison operator that can be used anywhere an operator can be used, such 
#as in a SELECT or WHERE clause.

#IS NULL Operator in MySQL: Example
#Step 1: Use the INSERT TABLE statement with VALUES clause to insert the required data into 
#the EMP_TABLE table, as shown below.

INSERT INTO 
employees_db.EMP_TABLE(EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT)
VALUES 
 ("E001", "Arthur", "Black", "M", "CEO", "ALL");
 
#Step 2: Use the SELECT statement with the WHERE clause and IS NULL operator to get values of 
#all the columns where MANAGER_ID is NULL from the EMP_TABLE table as given below.

SELECT * FROM employees_db.EMP_TABLE
WHERE MANAGER_ID IS NULL;

#IS NOT NULL Operator in MySQL
#• The IS NOT NULL operator is formed by combining the NOT and IS NULL operators.
#• The IS NOT NULL operator, in contrast to the IS NULL operator, determines if a value is NOT 
#NULL.
#• The expression, in contrast to the IN operator, returns 1 (true) if the value is NOT NULL. 
#Otherwise, it returns 0 (false).
#• Like the IS NULL operator, the IS NOT NULL is also a comparison operator that can be used 
#anywhere an operator can be used, such as in a SELECT or WHERE clause.

#Step 1: Use the SELECT statement with the WHERE clause and IS NOT NULL operator to get 
#values of all the columns where MANAGER_ID is NOT NULL from the EMP_TABLE table as given 
#below.

SELECT * FROM employees_db.EMP_TABLE
WHERE MANAGER_ID IS NOT NULL;

# SORTING TABLE DATA
#ORDER BY Clause in MySQL
#• The order of rows in the result set obtained from the SELECT statement is unspecified.
#• The ORDER BY clause is added to the SELECT statement to sort the rows in the result set.
#• The data in the result set produced by the ORDER BY clause is sorted in ascending order by 
#default.

#ORDER BY Clause in MySQL: Example
#Step 1: Use the SELECT statement with the ORDER BY clause to get values of all the columns 
#ordered in the required format from the EMP_TABLE table as given below.

SELECT * FROM employees_db.EMP_TABLE
ORDER BY EXP DESC;

##Grouping Table Data
#GROUP BY Clause in MySQL
#• The GROUP BY clause divides a set of rows into subgroups depending on column or 
#expression values.
#• For each group, the GROUP BY clause produces a single row. In other words, the number of 
#rows in the result set is reduced.
#• The GROUP BY clause is an optional clause of the SELECT statement.
#• The GROUP BY clause is used with aggregate functions such as SUM, AVG, MAX, MIN, and 
#COUNT.
#• The information for each group is provided by the aggregate function in the SELECT clause.

#Step 1: Use the SELECT statement with the GROUP BY clause to get the first row of each group 
#from the EMP_TABLE table, as given below.

SELECT DEPT, COUNT(*) as employee_count
FROM employees_db.EMP_TABLE
GROUP BY DEPT;

### BUGGY - HAVING 

#HAVING Clause in MySQL
#• The HAVING clause is used to define filter criteria for a group of rows or aggregates in the 
#SELECT statement.
#• The HAVING clause is frequently used with the GROUP BY clause to filter groups based on a 
#specified condition.
#• The HAVING clause operates like the WHERE clause if the GROUP BY clause is removed.
#• Each group produced by the GROUP BY clause is evaluated by the HAVING clause, and if the 
#result is true, the row is included in the result set.
#• Note: The WHERE clause applies a filter condition to each individual row, whereas the HAVING 
#clause applies it to each group of rows.

#HAVING Clause in MySQL: Example
#Step 1: Use the SELECT statement with the GROUP BY and HAVING clauses to get the first row of 
#each group meeting a required condition from the EMP_TABLE table as given below.

# Buggy code
SELECT DEPT, SUM(EXP) as total_experience
FROM employees_db.EMP_TABLE
GROUP BY DEPT
HAVING total_experience >= 1 or total_experience <= 10;

## ### DeepDive
## Rollup 
#ROLLUP: Example
#Step 1: Use the SELECT statement with the GROUP BY and ROLLUP clauses to get the employee 
#count in each country along with the grand total from the EMP_TABLE table, as given below.

SELECT COUNTRY, COUNT(EMP_ID) AS EMP_COUNT
FROM employees_db.EMP_TABLE
GROUP BY COUNTRY WITH ROLLUP;

####################################################################
################  OPERATORS, CONSTRAINTS and DATA TYPES  ###########
####################################################################

#Learning Objectives
#- By the end of this lesson, you will be able to:
#- Identify the different types of operators in MySQL
#- List the different MySQL constraints 
#- Determine the levels of data in SQL
#- Differentiate between the data types in SQL

# MySql Operators
# • An operator is a reserved word or character used 
# with the WHERE clause of an SQL statement.
# • It specifies a condition in the SQL statement.

###### Use employee records in the lession 6 data sets 

use employees_db;

## Arithmetic operators 

SELECT Emp_ID, Salary + Bonus as 
Emp_Total_Earning FROM Emp_Records; 

SELECT Emp_ID, ('Salary – Deductions') as Emp_Final_Earning FROM Emp_Records;

SELECT Emp_ID, Salary - Deductions as Emp_Total_Earning FROM Emp_Records; 

SELECT Emp_ID, Salary - Deductions as Emp_Final_Earning FROM Emp_Records;

SELECT Salary * 2 as New_Salary FROM Emp_Records;

SELECT Salary / 2 as New_Salary FROM Emp_Records;

## Bitwise operators - ### DeepDive

#Bitwise operators perform bit manipulations between two expressions of integer data type.

use employees_db;
SELECT Salary & Bonus from Emp_Records;

# & | !

SELECT Salary & Bonus from Emp_Records;
SELECT Salary | Bonus from Emp_Records;

# Comparison operators 
# Comparison operators compare values between operands and return TRUE or FALSE based 
# on the condition. 

SELECT Emp_ID, Salary from Emp_Records WHERE Salary > 25000;

# Logical Operators 
# Logical operators compare two conditions at a time to determine whether a row can be selected for an 
# output or not.

#Consider the same employee records table. If you want to extract data based on two conditions, that 
#are salary and location, then you use the AND operator.

SELECT Emp_ID, Salary, Country from Emp_Records
WHERE Salary > 1000 AND Country = 'India';

#If you want to extract data based on any one of the two conditions mentioned, that are salary or annual 
#bonus, then you use OR operator.

SELECT Emp_ID, Salary from Emp_Records WHERE 
Salary > 2000 OR Bonus <1000;

# NOT Operator 

SELECT Emp_ID, First_Name, Last_Name from Emp_Records WHERE NOT country = 'India';

Select * from employees_db.emp_records where not country = 'India';

# Like operator 
SELECT Emp_ID, First_Name from Emp_Records WHERE First_Name LIKE 'K%'; 


## Order of execution - Presedence of execution 

## Select -> From -> Join -> Where -> Group by -> having 

SELECT Emp_ID, First_Name from Emp_Records WHERE First_Name LIKE 'K%';

#Constraints in MYSQL
#Constraint is a condition that specifies the type of data that can be entered into a table.
#MySQL Constraints
#There are two types of constraints in MySQL:
#• Column level restrictions
#• Table level restrictions

#NOT NULL Constraint

# NOT NULL constraint prevents the column from having NULL or empty values.
CREATE table Employee (ID int, First_Name text NOT NULL, Last_Name text NOT NULL, City VARCHAR(30));

#Primary contraint 
#Primary constraint provides a distinct identity to each record in a table. A table can only have one 
#primary key.

CREATE table People (ID int Primary Key, Name varchar (30) NOT NULL, Age int);

# Primary and NOT NULL Constraints: Example
# Problem Statement: As a product manager, you are required to create a table with product details, 
#such as product ID which is the primary key, product name, and date of manufacturing which is not a 
#not value.

CREATE table Product_Details (Pro_ID int Primary Key, Pro_Name varchar (30) NOT NULL, Date_Manf DATE);
insert into Product_Details (Pro_ID, Pro_Name, Date_Manf) values (151,"Prod_Name","2021-02-24");
#Since its not NULL - prod name cannot be null
insert into Product_Details (Pro_ID, Date_Manf) values (151,"2021-02-24");


#############  DATA TYPES IN SQL
#Data type refers to the nature or format of data that is entered into the database.

#Data types are divided into three categories:
#• String
#• Numeric
#• Time and Date

## String types 

#CHAR(size)	A FIXED length string (can contain letters, numbers, and special characters). The size parameter specifies the column length in characters - can be from 0 to 255. Default is 1
#VARCHAR(size)	A VARIABLE length string (can contain letters, numbers, and special characters). The size parameter specifies the maximum string length in characters - can be from 0 to 65535
#BINARY(size)	Equal to CHAR(), but stores binary byte strings. The size parameter specifies the column length in bytes. Default is 1
#VARBINARY(size)	Equal to VARCHAR(), but stores binary byte strings. The size parameter specifies the maximum column length in bytes.
#TINYBLOB	For BLOBs (Binary Large Objects). Max length: 255 bytes
#TINYTEXT	Holds a string with a maximum length of 255 characters
#TEXT(size)	Holds a string with a maximum length of 65,535 bytes
#BLOB(size)	For BLOBs (Binary Large Objects). Holds up to 65,535 bytes of data
#MEDIUMTEXT	Holds a string with a maximum length of 16,777,215 characters
#MEDIUMBLOB	For BLOBs (Binary Large Objects). Holds up to 16,777,215 bytes of data
#LONGTEXT	Holds a string with a maximum length of 4,294,967,295 characters
#LONGBLOB	For BLOBs (Binary Large Objects). Holds up to 4,294,967,295 bytes of data
#ENUM(val1, val2, val3, ...)	A string object that can have only one value, chosen from a list of possible values. You can list up to 65535 values in an ENUM list. If a value is inserted that is not in the list, a blank value will be inserted. The values are sorted in the order you enter them
#SET(val1, val2, val3, ...)	A string object that can have 0 or more values, chosen from a list of possible values. You can list up to 64 values in a SET list
 
#String Data Type: Example
#Problem Statement: You are an IT administrator and want to create a table that shows the office 
#assets assigned to each employee, with the employee ID, employee Name with a restriction of number 
#of characters, and asset name which does not have any character limit. 
#Objective: Create a table with employee name of char data type and asset name of varchar data type.

CREATE TABLE Asset_Tracker (Emp_ID int, Emp_Name char (7), Asset_Name varchar (255));

#Employee name has a character limit. When you enter a longer name as shown below in the third 
#instance, you will get an error notification.
insert into employees_db.Asset_Tracker (Emp_ID, Emp_Name, Asset_Name)
values (23, 'Michael', 'Printer'),(46, 'John', 'Laptop'),(36, 'Samantha', 'Desktop Printer');

#Numeric Data types 

# Bit - Used for bits
# int - Used for whole numbers
# Float - Used for floating point numbers 

#Numeric Data Type: Example
#Problem Statement: You are a sales manager who wants to create a table with price and quantity of 
#each item that has been sold.
#Objective: Create a table with product name, quantity, and price with varchar, int, and float data 
#type respectively.

CREATE TABLE Sales_Tracker (Pro_Name varchar(255), Pro_Price float, Pro_Quantity int);

#Price is a float data type, because prices can have decimal values; quantity is always an integer

insert into Sales_Tracker (Pro_Name, Pro_Price, Pro_Quantity) values ('Mobiles', 8999.99, 26.4),('Laptops',24455.77, 48),('Washing_Machines',2344.55, 34);

###############################################################
##################### SQL Functions 
###############################################################

#By the end of this lesson, you will be able to:
#Illustrate SQL functions
#Identify aggregate functions
#Outline date and time, numeric, and advance functions
#List general, duplicate, and inline functions

## Aggregate functions 

# Count - Count function returns the total number of rows in a specified column or a table.
## Use product_Dataset from LEP_Lession 5

SELECT COUNT(price) as 
Price_greater_than_100 FROM product_datasets
WHERE price > 100;

# Sum - Sum function returns the sum of values from a particular column.
SELECT SUM(stock) as total_stock FROM product_datasets;

# Average - Average function returns the average value of a particular column.
SELECT AVG(price) as average_price FROM product_datasets;

# First - First function returns the first field value of the given column - using LIMIT
SELECT stock FROM product_datasets LIMIT 5;

# Last - Last function returns the last field value of the given column
SELECT stock FROM product_datasets ORDER BY p_code DESC LIMIT 5;

# Min - Min function returns the minimum value of the given column
SELECT MIN(price) as minimum_price FROM product_datasets;

# Max - Max function returns the maximum value of the given column.
SELECT MAX(price) as maximum_price FROM product_datasets;

#Problem Scenario: You are working in a superstore as a junior database administrator. Your manager 
#has asked you to collect data from the superstore’s table with the schema named as example to check 
#and improve the sales records and growth of your store by performing a queried operation on the 
#database. 
#Objective: You should determine the sum of the sales and profit columns, calculate the average profit, 
#count the total number of products with a price greater than 100, and calculate the maximum profit 
#and loss from the superstore table.

# use superstore dataset - Assisted practice - Lession 6

#Solution

SELECT COUNT(Sales) as Updated_value, sum(Sales) as Total_Sales, Sum(Profit) as Total_Profit, 
avg(Profit) as Average_Profit, ABS(min(Profit)) as Maximum_Loss, max(Profit) as Maximum_Profit 
FROM sample_superstore
WHERE Sales > 100;

### Scalar Functions - The scalar functions return a single value from an input value. It works on each record independently.

#Round - Round function helps to round a value to a specified number of places.
SELECT Sales, Profit, 
ROUND(Profit, 2) AS Rounded_Profit FROM sample_superstore;

# Length - Length function returns the total length of the given column.
SELECT length(p_name) as 
Length_product_name FROM product_datasets;

## ### DeepDive
# Format - Format function is used to format field value in the specified format.
#SELECT FORMAT('Postal Code','##_###') AS Formated_Num from sample_superstore;

# MID - MID function is used to retrieve the specified characters from the text field.
## Usage of backtick for spaced columns 
SELECT MID(`Customer ID`,1,4) as New_Num FROM sample_superstore;

# Now - NOW function is used to retrieve the system’s current date and time.
SELECT NOW() AS current_date_time;

# Ucase - UCASE function converts the given column to uppercase.
SELECT UCASE(p_name) FROM product_datasets;

# Lcase - LCASE function converts the given column to Lowercase.
SELECT LCASE(p_name) FROM product_datasets;

#Problem Scenario: You are working in a superstore as a junior database administrator. Your manager 
#has asked you to find the order number from the order ID column for the better functionality of your 
#store and to compare the order shipping and delivery dates. 
#Objective: You are required to extract the order number from the column order ID and list the 
#shipping and delivery dates. Also, compare these dates with the present date.

SELECT `Order ID`, mid(`Order ID`,9,14) as Order_Number , `Order Date`, `Ship Date`, Now() as Today FROM sample_superstore;

######### String Functions 
# Concat - Concat function is used to combine one or more characters into a single string.
SELECT CONCAT(p_name,' ',category) AS product_name_category FROM product_datasets;

# Trim - Trim function is used to remove the spaces from both sides of the given string.
SELECT TRIM(p_name) AS Trimmed_pname FROM product_datasets;

#Problem Scenario: You are working in a superstore as a junior database administrator. Your manager 
#has asked you to retrieve the list of all the customer addresses to send them a personalized invite as a 
#marketing strategy for an upcoming sale in the store.
#Objective: You are required to display the customer's name, city, state, and postal code from the 
#superstore table in a single column address. Also, count the length of the customer’s name and 
#convert it into lowercase and state into uppercase, respectively.

SELECT Concat(lcase(`Customer Name`),' ','(' , length(`Customer Name`), ')', ' ', ucase(City),' ', ucase(State),' ', `Postal Code`) as Address FROM sample_superstore;

## Numeric functions 

# ABS Function - ABS function is used to return  the absolute value of a given number.
select abs(profit) as abs_profit from sample_superstore;

# Ceil Functions - Ceil function returns the smallest integer value that is greater than or equal to the given number.
select ceil(profit) as abs_profit from sample_superstore;

# Floor - Floor function returns the largest integer value that is less than or equal to the given number.
select floor(profit) as abs_profit from sample_superstore;

# Truncate - Truncate function is used to truncate a number to the specified number of decimal places.
select truncate(profit,1) as abs_profit from sample_superstore;

# Mod - MOD function returns the remainder of a number by dividing it with another number
select mod(profit,1) as abs_profit from sample_superstore;

#Problem Scenario: You are working in a superstore as a junior database administrator. Your manager 
#has asked you to perform different operations on the sales column in order to obtain the highest profit 
#so that the management can plan the next quarter accordingly.
#Objective: The data that you received from the profit column is in decimals. You are required to 
#perform mathematical and scaler operations using different functions to manipulate and compare the 
#profit generated. 

SELECT Round(Profit, 1) as Profit_per_delivery_Round_off, Format(Profit, 3) as 
Profit_per_delivery_Format, Truncate(Profit,2) as Profit_per_delivery_Truncate, ABS(Profit) as 
Profiit_per_delivery_Absolute_Value, Ceil(Profit) as Profiit_per_delivery_Ceiling, Floor(Profit) 
as Profiit_per_delivery_Floor 
FROM sample_superstore;

#Problem Scenario: As the junior database administrator, your manager has asked you to check if years 
#of experience is odd or even.
#Objective: You are required to calculate the experience MOD 2.

SELECT emp_id, exp,
 CASE 
 WHEN MOD(exp, 2) = 0 THEN 'Even'
 ELSE 'Odd'
 END AS Exp_type
FROM emp_table;

#Date and time functions 

# Date - Date function extracts the date part from the given expression.
select now();
SELECT DATE(now()) AS date;

# Time - Time function extracts the time from the given expression.
select now();
SELECT TIME(now()) AS date;

SELECT MICROSECOND(CURDATE());
SELECT YEAR(NOW());


# Extract - Extract function extracts the date, month, year, and time from the given expression.

SELECT EXTRACT(MINUTE_MICROSECOND FROM "2017-06-15");

### WORKS ONLY FOR EXTRACT 
#MICROSECOND
#SECOND
#MINUTE
#OUR
#DAY
#WEEK
#MONTH
#QUARTER
#YEAR
#SECOND_MICROSECOND
#MINUTE_MICROSECOND
#MINUTE_SECOND
#HOUR_MICROSECOND
#HOUR_SECOND
#HOUR_MINUTE
#DAY_MICROSECOND
#DAY_SECOND
#DAY_MINUTE
#DAY_HOUR
#YEAR_MONTH

#### DeepDive
# Date Format - Date format function returns the date in a specified format.

# Debug
SELECT DATE_FORMAT(`Ship Date`, "%W %M %Y") from sample_superstore;
SELECT DATE_FORMAT("2017-06-15", "%M %d %Y");

### DeepDive 
# Handling Duplicates in Mysql 
# Using DISTINCT and COUNT keywords to fetch the number of unique records.


SELECT COUNT(DISTINCT(category)) 
AS Unique_records FROM product_datasets;

# Using COUNT and GROUP BY keywords to eliminate the duplicate records.
SELECT p_code, p_name, price, category, COUNT(distinct(category)) AS Count
FROM product_datasets
GROUP BY category;

#Problem Scenario: You are working in a superstore as a junior database administrator. Your manager 
#informed you that the table of your superstore has duplicate customer IDs due to multiple orders from 
#the same customer. 
#Objective: You are required to filter all the duplicate values and display the list of unique customers

SELECT `Customer ID` , COUNT(DISTINCT (`Customer ID`)) as Count
FROM sample_superstore
GROUP BY `Customer ID`;

## Activity - Get only unique rows in a data table

## Misceleneous functions 

# Convert - Convert function converts a value into a specified data type.
# CAST - Similar to convert - Deep dive

#SELECT CONVERT(Profit, int) AS Int_value from sample_superstore;
SELECT CONVERT(Profit, char) AS Int_value from sample_superstore;

#Convert can handle below 
#DATE	Converts value to DATE. Format: "YYYY-MM-DD"
#DATETIME	Converts value to DATETIME. Format: "YYYY-MM-DD HH:MM:SS"
#DECIMAL	Converts value to DECIMAL. Use the optional M and D parameters to specify the maximum number of digits (M) and the number of digits following the decimal point (D).
#TIME	Converts value to TIME. Format: "HH:MM:SS"
#CHAR	Converts value to CHAR (a fixed length string)
#NCHAR	Converts value to NCHAR (like CHAR, but produces a string with the national character set)
#SIGNED	Converts value to SIGNED (a signed 64-bit integer)
#UNSIGNED	Converts value to UNSIGNED (an unsigned 64-bit integer)
#BINARY	Converts value to BINARY (a binary string)

SELECT convert(profit AS UNSIGNED) FROM sample_superstore;

SELECT CAST(profit AS UNSIGNED) FROM sample_superstore;

## Cast supports 
#BINARY[(N)]
#CHAR[(N)]
#DATE
#DATETIME
#DECIMAL[(M[,D])]
#SIGNED [INTEGER]
#TIME
#UNSIGNED [INTEGER]

# IF - IF function returns value1 if the expression is TRUE, or value2 if the expression is FALSE
SELECT IF(profit <100,'YES','NO') AS Lesser_100 from sample_superstore;

# ISNULL - ISNULL function returns 1 if the expression is NULL or else 0 if the expression is NOT NULL
SELECT ISNULL(profit) AS Null_Check from sample_superstore;

# IFNULL - IFNULL function takes two expression.
# • It returns the first expression if the first expression is NOT NULL otherwise returns the second expression
SELECT IFNULL(profit,'This is NULL') AS Null_Check from sample_superstore;

# Colase - Coalesce function returns the first non-null value from a list of expressions
SELECT COALESCE(profit) from sample_superstore;

####################################################################
############ Sub queries, Operators and derived tables 
####################################################################

#By the end of this lesson, you will be able to:
#Identify the different join operations performed on tables
#List the various type of set operations and their usage
#Create and view subqueries with different methods
#Use derived tables for complex operations
#Verify subquery output with EXISTS operator

#Alias in SQL

#An alias is a temporary name assigned to a table, column, or expression for the 
#purpose of an SQL query, and it exists only for the duration of the query.
#The AS keyword is used to make an alias.
#If an alias contains space, it must be enclosed in quotation marks.
#Aliases are typically used to make column names easier to comprehend.

#Column Alias
#A column alias is a temporary name assigned to a column having a long 
#or descriptive technical name in order to simplify the query output.

#Step 1: Use the CONCAT_WS function in the SELECT statement as shown below
SELECT CONCAT_WS(', ', LAST_NAME, FIRST_NAME)
FROM PROJ_DB.EMP_RECORDS
WHERE DEPT = "HEALTHCARE";

#Step 2: Use the CONCAT_WS function in the SELECT statement followed by the AS keyword as shown below:
SELECT CONCAT_WS(', ', LAST_NAME, FIRST_NAME) AS `FULL NAME`
FROM PROJ_DB.EMP_RECORDS
WHERE DEPT = "HEALTHCARE";

#Table Alias
#A table alias is a temporary name assigned to a table that has a descriptive 
#technical name to simplify the query output.

#Step 1: Use the SELECT statement with an alias name for the table as shown below:
SELECT e.FIRST_NAME, e.LAST_NAME
FROM PROJ_DB.EMP_RECORDS AS e
WHERE e.DEPT = "HEALTHCARE";

######################################
############ JOINS IN SQL 
######################################

# What is a join ? 
# A JOIN is a method of linking data between one (self-join) or more tables based on a related column between them

#Types of joins 
# Inner join
# Left(Outer) join
# Right(Outer) join 
# Full outer join

### Inner join 

# Syntax Type 1
SELECT column_list
FROM table_1
INNER JOIN table_2 ON join_condition;

# Syntax Type 2
SELECT column_list
FROM table_1
INNER JOIN table_2 USING (column_name);

#Problem Statement: Your manager expects you to identify employees assigned to projects.
#Objective: Write an SQL query using the INNER JOIN clause with either ON or 
#USING keyword to perform the inner join on the EMP_RECORDS and 
#ROJ_ASSIGN tables in MySQL.

# Step 1: Use the INNER JOIN clause with the ON keyword in the SELECT statement to join 
# EMP_RECORDS and PROJ_ASSIGN tables as shown below:

SELECT
 e.EMP_ID, e.FIRST_NAME, e.LAST_NAME,
 e.DEPT, e.MANAGER_ID,
 p.PROJ_ID
FROM
 EMP_RECORDS AS e
INNER JOIN PROJ_ASSIGN p ON e.EMP_ID = p.EMP_ID
WHERE e.ROLE NOT IN ("MANAGER", "PRESIDENT", "CEO")
ORDER BY e.MANAGER_ID;

# Step 2: Use the INNER JOIN clause with the USING keyword in the SELECT statement to join 
# EMP_RECORDS and PROJ_ASSIGN tables as shown below:

SELECT
 e.EMP_ID, e.FIRST_NAME, e.LAST_NAME,
 e.DEPT, e.MANAGER_ID,
 p.PROJ_ID
FROM
 EMP_RECORDS e
INNER JOIN PROJ_ASSIGN p using (EMP_ID)
WHERE e.ROLE NOT IN ("MANAGER", "PRESIDENT", "CEO")
ORDER BY e.MANAGER_ID;

### Left join 

# Syntax 
SELECT column_list 
FROM table_1 
LEFT JOIN table_2 ON join_condition;

#Problem Statement: Your manager wants the details of the ongoing projects along with the 
#number of employees working on them.
#Objective: Write an SQL query using the LEFT JOIN clause with either ON or USING
#keyword to perform the left join on the PROJ_RECORDS and PROJ_ASSIGN tables in MySQL.

#Step 1: Use the LEFT JOIN clause with the ON keyword in the SELECT statement to join 
#PROJ_RECORDS and PROJ_ASSIGN tables as shown below:

SELECT
  p.PROJ_ID, p.PROJ_NAME, p.DOMAIN,
  COUNT(DISTINCT a.EMP_ID) AS `EMP_COUNT`,
  p.DEV_QTR, p.STATUS
FROM
  PROJ_RECORDS p
LEFT JOIN
  PROJ_ASSIGN a USING (PROJ_ID)
WHERE
  p.STATUS IN ("DONE", "WIP")
GROUP BY
  p.PROJ_ID, p.PROJ_NAME, p.DOMAIN, p.DEV_QTR, p.STATUS
ORDER BY
  p.PROJ_ID
LIMIT 0, 1000;

### Right Join 

# Syntax 
SELECT column_list 
FROM table_1 
RIGHT JOIN table_2 ON join_condition;

#Problem Statement: Your manager wants the details of each employee along with the 
#number of projects assigned to them.
#Objective: Write an SQL query using the RIGHT JOIN clause with either ON or USING
#keyword to perform the left join on the EMP_RECORDS and PROJ_ASSIGN tables in MySQL.

#Step 1: Use the RIGHT JOIN clause with the ON keyword in the SELECT statement to join 
#EMP_RECORDS and PROJ_ASSIGN tables as shown below:

SELECT
 e.EMP_ID, e.FIRST_NAME, e.LAST_NAME,
 e.ROLE, e.DEPT, e.MANAGER_ID,
 COUNT(DISTINCT a.PROJ_ID) AS `PROJ_COUNT`
FROM
 PROJ_ASSIGN a
RIGHT JOIN EMP_RECORDS e ON a.EMP_ID = e.EMP_ID
WHERE e.ROLE NOT IN ("MANAGER", "PRESIDENT", "CEO")
GROUP BY e.EMP_ID
ORDER BY e.MANAGER_ID;

#Step 2: Use the RIGHT JOIN clause with the USING keyword in the SELECT statement to join 
#EMP_RECORDS and PROJ_ASSIGN tables as shown below:

SELECT
 e.EMP_ID, e.FIRST_NAME, e.LAST_NAME,
 e.ROLE, e.DEPT, e.MANAGER_ID,
 COUNT(DISTINCT a.PROJ_ID) AS `PROJ_COUNT`
FROM
 PROJ_ASSIGN a
RIGHT JOIN EMP_RECORDS e using (EMP_ID)
WHERE e.ROLE NOT IN ("MANAGER", "PRESIDENT", "CEO")
GROUP BY e.EMP_ID
ORDER BY e.MANAGER_ID;

## Full outer join 

SELECT select_list
FROM table_1
FULL OUTER JOIN table_2;

#Problem Statement: Your manager expects you to fetch an all-encompassing list of records 
#from both the employee and project records tables, ensuring the inclusion of every row from 
#each table, irrespective of whether a match exists or not.
#Objective: Write an SQL query using the FULL OUTER JOIN clause to perform the 
#full outer join on the EMP_RECORDS and PROJ_ASSIGN tables to obtain their full 
#information in MySQL.

#Step 1: Use the FULL OUTER JOIN clause in the SELECT statement to join EMP_RECORDS and 
#PROJ_ASSIGN tables as shown below

SELECT
 e.EMP_ID, e.FIRST_NAME, e.LAST_NAME,
 e.DEPT, e.MANAGER_ID, 
 a.PROJ_ID
FROM
 PROJ_ASSIGN a
FULL OUTER JOIN EMP_RECORDS e
WHERE e.ROLE NOT IN ("MANAGER", "PRESIDENT", "CEO")
ORDER BY e.FIRST_NAME;

## Alternatively - Since MySQL doesnot support Full outer join 
SELECT
  e.EMP_ID, e.FIRST_NAME, e.LAST_NAME,
  e.DEPT, e.MANAGER_ID,
  a.PROJ_ID
FROM
  EMP_RECORDS e
LEFT JOIN
  PROJ_ASSIGN a ON e.EMP_ID = a.EMP_ID
WHERE
  e.ROLE NOT IN ("MANAGER", "PRESIDENT", "CEO")

UNION

SELECT
  e.EMP_ID, e.FIRST_NAME, e.LAST_NAME,
  e.DEPT, e.MANAGER_ID,
  a.PROJ_ID
FROM
  PROJ_ASSIGN a
RIGHT JOIN
  EMP_RECORDS e ON e.EMP_ID = a.EMP_ID
WHERE
  e.ROLE NOT IN ("MANAGER", "PRESIDENT", "CEO")

ORDER BY
  FIRST_NAME;


### Self join 

#The SELF JOIN clause joins a table to itself using the INNER JOIN or LEFT JOIN.
#The SELF JOIN is often used to query hierarchical data or to compare rows 
#within the same table.
#To perform a SELF JOIN, table aliases must be used to avoid repeating the 
#same table name in a single query.
#MySQL throws an error if a table is referenced twice or more in a query without 
#utilizing table aliases.

#Problem Statement: Your manager wants you to identify the number of employees 
#reporting to each manager including the President and the CEO.
#Objective: Write an SQL query using either INNER JOIN or LEFT JOIN clause to simulate 
#the SELF JOIN clause on the EMP_RECORDS table in MySQL.

#Step 1: Use the INNER JOIN clause in the SELECT statement to simulate the SELF JOIN clause to 
#join EMP_RECORDS table as shown below:

SELECT
  e1.EMP_ID AS EMPLOYEE_ID,
  e1.FIRST_NAME AS EMPLOYEE_FIRST_NAME,
  e1.LAST_NAME AS EMPLOYEE_LAST_NAME,
  e1.DEPT AS EMPLOYEE_DEPT,
  e1.MANAGER_ID AS EMPLOYEE_MANAGER_ID,
  e2.EMP_ID AS MANAGER_ID,
  e2.FIRST_NAME AS MANAGER_FIRST_NAME,
  e2.LAST_NAME AS MANAGER_LAST_NAME,
  e2.DEPT AS MANAGER_DEPT,
  e2.MANAGER_ID AS MANAGER_MANAGER_ID,
  a.PROJ_ID
FROM
  EMP_RECORDS e1
LEFT JOIN
  PROJ_ASSIGN a ON e1.EMP_ID = a.EMP_ID
LEFT JOIN
  EMP_RECORDS e2 ON e1.MANAGER_ID = e2.EMP_ID
WHERE
  e1.ROLE NOT IN ("MANAGER", "PRESIDENT", "CEO")
ORDER BY
  e1.EMP_ID;


#### Subquery in SQL
#A subquery is a query nested within another query such as SELECT, INSERT, 
#UPDATE, or DELETE.
#It is also called an Inner Query or Inner Select while the statement that 
#contains the subquery is called an outer query or outer select.
#It can be used anywhere an expression is used and must be closed in 
#parentheses.
#A subquery can also be nested within another subquery


#Subquery as Expressions
#A subquery that returns a single value can be used as an expression.
# Let’s say you need to determine the count of managers and the total 
# team strength excluding them in the retail domain in MySQL.

SELECT m.DEPT, COUNT(DISTINCT m.EMP_ID) AS 
'MANAGER_COUNT',
 ( SELECT COUNT(DISTINCT e.EMP_ID) FROM EMP_RECORDS e
 WHERE e.ROLE NOT IN ("MANAGER", "PRESIDENT", "CEO")
 AND e.DEPT IN ("RETAIL") ) AS 'TEAM_STRENGTH'
FROM EMP_RECORDS m
WHERE m.ROLE IN ("MANAGER") AND m.DEPT IN ("RETAIL");

## Dept is null 
SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT
FROM EMP_RECORDS
WHERE ROLE = 'MANAGER';

#Subquery with WHERE Clause
#A subquery can be used with a WHERE clause.
# Let’s say you need to determine the list of upcoming projects with no 
# manager and team member assigned to them in MySQL.

SELECT p.PROJ_ID, p.PROJ_NAME, p.DOMAIN
FROM PROJ_RECORDS p
WHERE p.PROJ_ID NOT IN (
 SELECT DISTINCT a.PROJ_ID
 FROM PROJ_ASSIGN a
) AND p.STATUS IN ("YTS");

# Subquery with Comparison Operators
#Comparison operators can be used to compare a single value 
#returned by a subquery with the expression in the WHERE clause.
#Let’s say you need to determine the employee with the highest 
#experience in the organization in MySQL.

SELECT
 e.EMP_ID,
 CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS `FULL_NAME`,
 e.ROLE, e.DEPT
FROM EMP_RECORDS e
WHERE e.EXP = (SELECT MAX(EXP) FROM EMP_RECORDS);

#Subquery with IN and NOT IN Operators
# A subquery that returns more than one value can be used with IN or 
# NOT IN operators in the WHERE clause.
# Let’s say you need to determine the list of all managers who have not 
# been assigned to any projects in the organization in MySQL.

SELECT 
 e.EMP_ID, e.FIRST_NAME, e.LAST_NAME, e.ROLE, e.DEPT
FROM EMP_RECORDS e
WHERE e.EMP_ID NOT IN (
 SELECT DISTINCT a.EMP_ID FROM PROJ_ASSIGN a
 ) AND e.ROLE IN ("MANAGER");
 
# Subquery with ANY Operator
#A subquery that returns a list of values that can be used with ANY operator in the 
#WHERE clause.
#The ANY operator compares each value provided by the subquery with the 
#comparison expression and returns TRUE if any comparison pair evaluates to 
#TRUE; otherwise, it returns FALSE.

#Let’s say you need to determine any five employees with more than or equal to 
#the average experience of all employees in the organization in MySQL.

SELECT
 e.EMP_ID,
 CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS 
`FULL_NAME`,
 e.ROLE, e.DEPT, e.EXP
FROM EMP_RECORDS e
WHERE e.EXP >= ANY (SELECT AVG(EXP) FROM EMP_RECORDS)
LIMIT 5;

#Note: In this example, Employee Experience is compared with the average experience, which is a single 
#value. Alternatively, you can use ANY to compare different values with multiple values. For example, 
#when you want to compare the experience of any employee with that of the manager(s).

# Subquery with ALL Operator
#A subquery that returns a list of values can also be used with ALL operators in the 
#WHERE clause.
#The ALL operator compares each value provided by the subquery with the 
#comparison expression and returns TRUE if all the comparison pairs evaluate to 
#TRUE; otherwise, it returns FALSE.

#Let’s say you need to determine all the employees with less than the 
#average experience of all employees in MySQL.

SELECT
 e.EMP_ID,
 CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS 
`FULL_NAME`,
 e.ROLE, e.DEPT, e.EXP
FROM EMP_RECORDS e
WHERE e.EXP < ALL (SELECT AVG(EXP) FROM EMP_RECORDS);

#Note: In this example, Employee Experience is compared with the average experience, which is a single 
#value. Alternatively, you can use ANY to compare different values with multiple values. For example, 
#when you want to compare the experience of any employee with that of the manager(s).

# Subquery with EXISTS or NOT EXISTS Operators

#A subquery can also be used with the EXISTS and NOT EXISTS operators.
#The EXISTS operator returns TRUE if the subquery returns the results; otherwise, 
#it returns FALSE. The NOT EXISTS operator is opposite to the EXISTS operator.

# Let’s say you need to print the names of all the projects only if even one project is 
# assigned to any employee in MySQL.

SELECT PROJ_NAME
FROM PROJ_RECORDS
WHERE EXISTS (
 SELECT PROJ_ID
 FROM PROJ_ASSIGN
) ORDER BY PROJ_ID;

#Subquery in the FROM Clause
#The FROM clause creates a temporary table from the result set returned by a 
#subquery, often known as a derived table or materialized subquery.

# Let’s say you need to determine the maximum, minimum, and average 
# employee experience in the organization in MySQL.


SELECT
  MAX(EXP) AS 'MAX_EXP',
  MIN(EXP) AS 'MIN_EXP',
  FLOOR(AVG(EXP)) AS 'AVG_EXP'
FROM (
  SELECT EMP_ID, MAX(EXP) AS EXP
  FROM EMP_RECORDS
  GROUP BY EMP_ID
) AS TOTAL_EXP;

# Subquery with SELECT Statement

#Subqueries are frequently used with the SELECT statement
#Let’s say you need to determine all those projects that are assigned to at least 
#one of the employees in MySQL.

SELECT 
 PROJ_ID, PROJ_NAME,
 DOMAIN, STATUS
FROM PROJ_RECORDS
WHERE PROJ_ID IN (
 SELECT DISTINCT PROJ_ID FROM PROJ_ASSIGN
) ORDER BY PROJ_ID, DOMAIN;

# Derived Tables in SQL
# A derived table is a virtual table returned by a SELECT statement.
# A derived table is created by using a stand-alone subquery in the FROM clause of a SELECT statement.

# Derived table Syntax - Derived table name (Alias) mandatory
SELECT select_list
FROM (
 SELECT select_list
 FROM table_1
) derived_table_name
WHERE derived_table_name.c1 > 0;

#Problem Statement: Your manager wants you to find the total number of managers in the 
#organization.
#Objective: Write an SQL query using the COUNT function with the DISTINCT keyword on 
#the output returned by a subquery which creates a DERIVED TABLE to return the EMP_ID
#of all managers from the EMP_RECORDS tables in MySQL.

#Step 1: Use the COUNT function with the DISTINCT keyword on the output returned by a subquery 
#which creates a DERIVED TABLE for returning the EMP_ID of all managers as shown below:
# SENIOR DATA SCIENTIST = MANAGER

SELECT COUNT(DISTINCT EMP_ID) AS 'MANAGER_COUNT'
FROM (
 SELECT DISTINCT EMP_ID FROM EMP_RECORDS
 WHERE ROLE IN ("SENIOR DATA SCIENTIST")
) employees
WHERE EMP_ID = employees.EMP_ID;

SELECT COUNT(DISTINCT EMP_ID) AS 'MANAGER_COUNT'
FROM EMP_RECORDS
WHERE ROLE = 'SENIOR DATA SCIENTIST';

# EXISTS Operator

# The EXISTS operator is a Boolean operator that returns true or false and is 
# frequently used to check if rows returned by a subquery exist.

# Syntax 
SELECT 
 select_list
FROM
 a_table
WHERE
 [NOT] EXISTS(subquery);

#Problem Statement: Your manager wants you to provide the basic information of all the 
#managers in the organization.
#Objective: Write an SQL query using the EXISTS operator to verify the existence of 
#managers and return their details if available from the EMP_RECORDS tables in MySQL.

#Step 1: Use the EXISTS operator in the SELECT statement to verify the existence of managers 
#and return their details if available from the EMP_RECORDS tables as shown below:

SELECT m.EMP_ID, m.FIRST_NAME, m.LAST_NAME,
 m.ROLE, m.DEPT
FROM EMP_RECORDS m
WHERE EXISTS(
 SELECT 1 FROM EMP_RECORDS WHERE ROLE IN 
("SENIOR DATA SCIENTIST")
) AND ROLE IN ("SENIOR DATA SCIENTIST");

#Note: SELECT 1 is frequently used in situations where you wish to verify the existence of record.
#Or simply retrieve a constant value without specifying a particular column or table.

#NOT EXISTS Operator: Opposite of exists operator 

#Problem Statement: Your manager wants you to provide the basic information of all the 
#employees with one year or less than one year of experience in the organization.

#Objective: Write an SQL query that verifies if there is no entry for a negative experience in 
#the EMP_RECORDS tables using the NOT EXISTS operator, and then returns the basic 
#information for all employees in that table with an experience of less than or equal to one 
#in MySQL.

#Step 1: Use the NOT EXISTS operator in the SELECT statement to verify if there is no negative 
#entry experience.
#Step 2: Return the basic information of all the employees with an experience of less than or 
#equals to one in the EMP_RECORDS table as shown below:

SELECT m.EMP_ID, m.FIRST_NAME, m.LAST_NAME,
 m.DEPT, m.EXP
FROM EMP_RECORDS m
WHERE NOT EXISTS(
 SELECT 1 FROM EMP_RECORDS WHERE EXP < 0
) AND m.EXP <= 1;

/*Exists vs IN

EXISTS operator
• Faster than IN operator
• Does not depend on subquery
• Works on the at least found principle
• Stops scanning the table as soon as a 
matching row is found

IN operator
• Slower than EXISTS operator
• Depends on subquery
• Used in conjunction with a subquery
• Waits for MySQL to complete the execution 
of the subquery to utilize its result*/

##### Window functions in SQL

# By the end of this lesson, you will be able to:
#Explain window functions and various clauses
#List the aggregate window functions
#Classify ranking window functions
#Categorize the miscellaneous window functions

#The window function is like an SQL function that takes input values from a window of one or more 
#rows of a SELECT statement’s result set.
#The window functions perform various operations on a group of rows and provide an aggregated 
#value for each row with a unique identity.

# Syntax
window_function_name(expression)OVER([partition_definition] 
[order_definition] [frame_definition] );

#Window function specifies the window function name with an expression. 
#OVER clause can comprise partition definition, order definition, and frame definition.

##Clauses in windoes function 
#Partition clause 
#Frame clause 
#Order by clause

# Partition clause - The partition clause is used to divide or split the rows into partitions, and 
#the partition boundary is used to split two partitions.

PARTITION BY
<expression>[{,<expression>...}];

# Order By Clause - Order By clause is an arrangement of rows inside a partition. It performs
#partitions using multiple keys where each key has an express

ORDER BY <expression> [ASC|DESC], 
[{,<expression>...}];

# Frame clause - Frame clause is defined as subset of the current position. It allows to move the subset 
#within a partition based on the position of the current row in its partition.

frame_unit
{<frame_start>|<frame_between>};

#The frame unit can be a row or range that specifies the kind of relationship between 
#the current row and frame row.

#Frame unit - Rows: It assigns row number for offset of current and frame row.
#Frame unit - Range: It assigns row values for offset of current and frame row.
#Frame start - Frame start specifies the frame boundary.
#Frame between - Frame between specifies the frame boundary.

##Problem Scenario:
#The HR of a company wants to calculate the performance of employees department-wise based 
#on the employee ratings. 
##Objective:
#You are required to retrieve the employee ID, first name, role, department, and employee rating by 
#calculating the maximum employee rating using PARTITION BY and MAX function on department 
#and employee rating fields respectively.
##Instructions: 
#Refer to the employee dataset given in the course resource section in LMS and create an employee 
#table using fields mentioned in dataset. Insert the values accordingly to perform the above 
#objectives.


SELECT EMP_ID,FIRST_NAME,ROLE,DEPT,EMP_RATING,MAX(EMP_RATING)OVER(PARTITION BY DEPT) AS MAX_EMP_RATING FROM emp_records;

##Aggregate Window Functions
#The aggregate window functions perform on a particular set of rows and 
#provide the result in a single row.

# Syntax 
window_function ( [ ALL ] expression )
OVER ( [ PARTITION BY expr_list ] [ 
ORDER BY order_list frame_clause ] );

#Deepdive
#Window function - It can be any aggregate window function. 
#ALL - ALL helps to maintain all duplicate values from the expression.
#OVER - It distinguishes window aggregation from general aggregation functions.
#PARTITION BY - PARTITION BY provides a window if there are one or more expressions.
#ORDER BY - ORDER BY is used to sort the rows within each partition. 

# Types of Aggregate window functions
#min()
#max()
#sum()
#count()
#avg()

# FOR MIN AND MAX
#Problem Scenario:
#The HR of a company wants to identify the minimum and the maximum salary of the employees in 
#a role.
#Objective:
#You are required to display the employee’s ID, first name, role, and salary by finding the minimum 
#and maximum salary of the employees using PARTITION BY clause, MIN, and MAX functions on 
#role and salary fields respectively.
#Instructions:
#Refer to the employee table which is created and perform the above objectives.

SELECT EMP_ID,FIRST_NAME,ROLE,SALARY, MAX(SALARY) OVER (PARTITION BY ROLE) 
MAX_SALARY,MIN(SALARY) OVER (PARTITION BY ROLE) MIN_SALARY FROM emp_records;

## FOR AVG AND COUNT 
#Problem Scenario:
#The HR of a company wants to identify the average performance of the employees department
#wise and also find the total number of records in a department.
#Objective:
#You are required to display the employee’s ID, first name, department, and employee rating by 
#calculating the average employee rating and the total number of records in a department using 
#PARTITION BY clause, AVG, and COUNT functions on department and employee rating fields 
#respectively.
#Instructions: 
#Refer to the employee table which is created and perform the above objectives.


SELECT EMP_ID,FIRST_NAME,DEPT,EMP_RATING, AVG(EMP_RATING)OVER(PARTITION BY DEPT) 
AVG_EMP_RATING_IN_DEPT, COUNT(*) OVER(PARTITION BY DEPT) NO_OF_RECORDS_IN_DEPT FROM 
emp_records;

## For SUM 
#Problem Scenario:
#The HR of a company wants to calculate the total employee rating in a department.
#Objective:
#You are required to display the employee’s Id, first name, department, and employee rating by 
#calculating the total employee rating in a department using PARTITION BY clause and SUM 
#function on the department and the employee rating fields respectively. 
#Instructions:
#Refer to the employee table which is created and perform the above objectives.

SELECT EMP_ID,FIRST_NAME,DEPT,EMP_RATING, SUM(EMP_RATING) OVER (PARTITION BY DEPT) 
TOTAL_EMP_RATING_IN_DEPT FROM emp_records;

## Ranking window functions 
# Rank 
# Dense Rank 
# Row number 
# Percentage Rank 

## Dense Rank -
#• It assigns a rank to every row in a partition based on the ORDER BY clause.
#• It assigns the same rank for equal values. 
#• It has no gaps if two or more rows have a similar rank.

## Rank
#• Rank helps to assign a rank to all rows within every partition.
#• The first row of the rank will be 1. 
#• Same rank for the same value.
#• There will be a gap if two or more rows have the same rank.

#Use Case for Rank and Dense Rank
#Problem Scenario:
#The HR of a company wants to assign a rank for each employee based on their employee rating.
#Objective:
#You are required to display the employee’s ID, first name, department, and employee rating by 
#assigning a rank to all the employees based on their employee rating using ORDER BY clause, 
#RANK, and DENSE RANK functions on the employee rating field.
#Instructions: 
#Refer to the employee table which is created and perform the above objectives.

SELECT EMP_ID,FIRST_NAME,DEPT,EMP_RATING, RANK() OVER (ORDER BY EMP_RATING) 
EMP_RATING_RANK, DENSE_RANK() OVER (ORDER BY EMP_RATING) EMP_RATING_DENSE_RANK FROM 
emp_records;

# Row number 
#• Row number retrieves the unique sequential number of each row for the specified data.
#• Similar values will have different ranks.

#Use Case for Row Number
#Problem Scenario:
#The IT department of a company wants to assign an asset number for each employee based on 
#their employee ID in ascending order.
#Objective:
#You are required to display the employee’s ID, first name, role, and department by assigning a 
#number to each employee in ascending order of their employee ID using ORDER BY clause and 
#ROW NUMBER function on the employee ID field.
#Instructions: 
#Refer to the employee table which is created and perform the above objective.

SELECT EMP_ID,FIRST_NAME,ROLE,DEPT,ROW_NUMBER() OVER(ORDER BY EMP_ID) 
EMP_ID_ASC_ROWNUMBER FROM emp_records;

## Percent Rank 
#• Percent rank helps to evaluate the percentile rank of a value in a partition or result set.
#• It returns a value between zero to one.
#Use Case for Percent Rank
#Problem Scenario:
#The HR of a company wants to calculate the overall percentile of the employee rating in a 
#department.
#Objective:
#You are required to display employee’s ID, first name, role, department, and employee rating by 
#calculating the percentile of the employee rating in a department using ORDER BY clause and 
#PERCENT RANK function on an employee rating field.
#Instructions: 
#Refer to the employee table which is created and perform the above objective.

SELECT EMP_ID,FIRST_NAME,ROLE,DEPT,EMP_RATING,PERCENT_RANK() OVER(ORDER BY EMP_RATING) 
PERCENTILE_EMP_RATING FROM emp_records;

### Working with Views 

#By the end of this lesson, you will be able to:
#Illustrate SQL views
#List the view manipulation methods
#Utilize the view process algorithms
#Implement CHECK constraints on views

#In SQL, a view refers to a virtual table. It can be created by selecting fields from one or more tables. 

#Syntax 

CREATE VIEW view_name AS
SELECT column1, column2, column3,….
FROM table_name
WHERE condition…

#Problem Scenario: You are a data analyst in your company, and you are asked to create a temporary 
#table of employees with salary more than 22000.
#Objective: Use the view command to create a temporary table for the condition mentioned above.

# Step1 : Create a table named employee records with the following data:
# Step 2: Use the following view syntax to create a temporary table of employees with salary more than 22000.


CREATE VIEW Employee_View AS
SELECT Emp_ID, First_Name, country
FROM Emp_records
WHERE Salary > 2000;

## Seelct table 
SELECT * FROM Employee_View;

## Replace View 
CREATE OR REPLACE VIEW Employee_View AS
SELECT Emp_ID, country
FROM Emp_Records
WHERE Salary > 2000;

## Alter view and replace - Explore 
## Rename view 

RENAME TABLE employee_view TO new_view;

# Delete view 
drop view new_view;

###################################################
##### Stored procedures and triggers in SQL ##### 
###################################################

##Learning objectives 
#List the advantages of stored procedures
#Interpret the various aspects of stored procedures
#Outline the different types of error handlers
#Analyze SQL triggers

# A stored procedure is a collection of precompiled SQL commands in a database.
# When a procedure calls itself, then it is called a recursive stored procedure.

##The explanation of each parameter in the stored procedure syntax is given below:
#Procedure Name • Refers to the name of the stored procedure
#Declaration Section • Refers to the declarations of all variables
#Executable Section • Refers to the section of code that is executable

## Advantages of stored procedures 
#Secure Database
#Centralized Business Logic
#Reduced Network Traffic
#Better Performance
#Higher Productivity 
#Ease of Use
#Increased Scalability

#MySQL Workbench uses the delimiter (;) to separate statements and execute each 
#statement distinctly.

##Creating Stored Procedures
#CREATE PROCEDURE keywords are used to create stored procedures.
#In MySQL, code is written between the BEGIN and END keywords. The delimiter character is placed 
#after END to conclude the procedure statement.

#CREATE PROCEDURE procedure_name(parameter_list)
#BEGIN
# statements;
#END

#Executing Stored Procedures
#To execute the stored procedure, you can use the following syntax with the CALL keyword:
#If the procedure has parameters, then the parameter values must be specified in 
#the parenthesis.

#CALL [Procedure Name] ([Parameters])


##Removing Stored Procedures
#DROP PROCEDURE statement is used to delete stored procedures.
#• If you drop a procedure that does not exist without using the IF EXISTS option, MySQL 
#shows an error. 
#• If you use the IF EXISTS option for the same condition, then MySQL shows a warning. 

#DROP PROCEDURE [IF EXISTS] stored_procedure_name;

#Problem Statement: You are a junior DB administrator in your company. Your manager has 
#asked you to retrieve data on employees with more than five years of experience, using a 
#single command.
#Objective: Use a stored procedure to retrieve the required data anytime.

#Step 1: You have a table on employees with details, such as employee ID, first name, last 
#name, gender, role name, department, experience, country, and continent.

#Step 2: Create a stored procedure that displays the employees with more than five years of 
#experience using the following command.

CREATE PROCEDURE get_mid_experience()
BEGIN
SELECT * FROM Emp_Table WHERE exp > 5;
END;

#Changing the Default Delimiter
#MySQL Workbench uses the delimiter (;) to separate statements and execute each 
#statement distinctly.
#• If MySQL Workbench is used to define a stored procedure 
#with semicolon characters, then it considers the whole 
#stored procedure as multiple statements.
#• To tackle this, redefine the delimiter temporarily. This will 
#pass the whole stored procedure to the MySQL workbench 
#as a single statement. 
#• The command to redefine delimiter is DELIMITER 
#delimiter_character.
#Note: Backslash (\) is an escape character, and it must be avoided in MySQL.

DELIMITER //
CREATE PROCEDURE get_mid_experience()
BEGIN
    SELECT * FROM Emp_Table WHERE exp > 5;
END //
DELIMITER ;

#Step 3: Call for the stored procedure to return the results based on the specified condition.
CALL get_mid_experience();

## Declare and set varibale 
#DECLARE and SET keywords are used to declare and set variables

#Declaring Variables
#DECLARE variable_name 
#datatype(size) [DEFAULT 
#default_value];

#Assigning Variables
#SET variable_name = value;

#Problem statement: You are a junior DB administrator, and your manager has asked you to 
#identify the total number of employees in the employee table created earlier. 
#Objectives: Use the stored procedure to view the number of employees anytime and also 
#declare a variable for total employees.

# Step 1: Using the same employee table as earlier, create a stored procedure and declare a 
# default variable 0.

DELIMITER &&
CREATE PROCEDURE get_total_employees()
BEGIN
    DECLARE totalemployee INT DEFAULT 0;
    BEGIN
        SELECT COUNT(*)
        INTO totalemployee
        FROM Emp_Table;
    END;
    SELECT totalemployee;
END &&
DELIMITER ;

#Step 2: Use the CALL function to view the stored procedure results. 
CALL get_total_employees();

## Stored procedures that return multiple values 

# IN 
# Out 
# INout 

## IN 
#This is the default mode, and parameter is the input here. The calling program must pass an 
#argument to the stored procedure when it is defined.
#• Values are protected in an IN parameter.
#• When the values in the parameter are changed, 
#the original value remains unchanged after the 
#stored procedure ends.

#Problem Statement: You are a junior DB administrator in your organization. Your manager 
#has asked you to list the employee names in the automotive department.
#Objective: Create a stored procedure with an IN parameter to extract employee names by 
#specifying the department name.

#Step 1: Create a procedure named employee of auto. Keep the department as the IN parameter.

DELIMITER //
CREATE PROCEDURE Employee_of_Auto(
    IN Department VARCHAR(255)
)
BEGIN
    SELECT First_name, Dept
    FROM Emp_Table
    WHERE Dept = Department;
END //
DELIMITER ;

# Step 2: Call the procedure with the mentioned department.
CALL Employee_of_Auto("RETAIL");


#Stored Procedures That Return Multiple Values (OUT)
#This parameter is used to pass a parameter as an output. Its value can be changed inside 
#the stored procedure.

#The initial value of the OUT parameter cannot be accessed by the stored procedure 
#when it starts.

#Problem Statement: You are a junior DB administrator in your organization. Your manager 
#has asked you to count the employees in the retail department.
#Objective: Create a stored procedure with an OUT parameter and extract the required result.

#Step 1: Create a procedure called employee count in retail with the OUT parameter to count the 
#employees in the retail department.

DELIMITER &&
CREATE PROCEDURE Emp_Count_in_Retail ( OUT total_Emp INT)
BEGIN
SELECT count(Emp_ID) INTO total_Emp FROM Emp_Table WHERE Dept 
= "Retail";
END &&

#Step 2: Call the created procedure to store the returned value. Pass a session variable named 
#@Retail_Employees. Select values from these in a separate value called employee retail. 

#@Retail_Employees - Is a session variable 

CALL Emp_Count_in_Retail (@Retail_Employees);
Select @Retail_Employees AS EmployeeRetail;

#Stored Procedures That Return Multiple Values (IN OUT)
#This is a combination of IN and OUT parameters. 

#This specifies that the calling program can pass the argument and the stored procedure can 
#modify the INOUT parameter.

#Problem Statement: You are a junior DB administrator in your organization. Your manager 
#wants to track total number of changes made each time when there is a new addition to an 
#existing database.
#Objective: Create a stored procedure with an IN OUT parameter to display the required 
#count.

DELIMITER //
CREATE PROCEDURE Iterations (INOUT count INT, IN increment INT)
BEGIN
    SET count = count + increment;
END //
DELIMITER ;

#Step 2: Set Iterations to zero. Call the procedure with the variable when there is one change; 
#repeat the process when there are five changes.
set @count = 5;
call Iterations(@count, 1);
select @count;

#################################
##### CONDITIONAL STATEMENT 
#################################

## IF 
## CASE 

## IF condition - checks for a single condition 
DELIMITER //
CREATE PROCEDURE Example_IF(x INT)
BEGIN
    IF x > 0 THEN
        SELECT 'Positive';
    END IF;
END //
DELIMITER ;
-- Call the procedure
CALL Example_IF(5);

## IF-ELSE - checks for two conditions 
DELIMITER //
CREATE PROCEDURE Example_IF_ELSE(x INT)
BEGIN
    IF x > 0 THEN
        SELECT 'Positive';
    ELSE
        SELECT 'Non-Positive';
    END IF;
END //
DELIMITER ;

-- Call the procedure

## If then else - Checks for multiple condition 
DELIMITER //
CREATE PROCEDURE Example_IF_THEN_ELSE(x INT)
BEGIN
    SELECT
        CASE
            WHEN x > 0 THEN 'Positive'
            ELSE 'Non-Positive'
        END AS Result;
END //
DELIMITER ;

-- Call the procedure
CALL Example_IF_THEN_ELSE(-3);

### CASE 

SELECT
    exp,
    CASE
        WHEN exp > 10 THEN 'Greater than 10'
        WHEN exp = 10 THEN 'Equal to 10'
        ELSE 'Less than 10'
    END AS result
FROM emp_records;

####### Adding the output of a query in to a table 

-- Example: Insert employees with more than 5 years of experience into senior_employees
INSERT INTO senior_employees (Emp_ID,FIRST_NAME,Exp)
SELECT Emp_ID,FIRST_NAME, Exp
FROM emp_records
WHERE Exp > 5;

-- Create the senior_employees table
CREATE TABLE senior_employees (
    Emp_ID VARCHAR(255),
    FIRST_NAME VARCHAR(255),
    Exp INT
);

##########################
######### Loops in MYSQL 
##########################

## Loop 
## While 
## repeat 


## Loop 
DELIMITER //
CREATE PROCEDURE Example_LOOP()
BEGIN
    DECLARE counter INT DEFAULT 1;
    simple_loop: LOOP
        -- Your code here
        SELECT counter;
        SET counter = counter + 1;
        IF counter > 5 THEN
            LEAVE simple_loop;
        END IF;
    END LOOP simple_loop;
END //
DELIMITER ;

call example_loop();

#DECLARE Statement: Declares a variable named counter of type INT and initializes it to 1.
#LOOP Statement: Initiates an unconditional loop labeled as simple_loop.
#Code inside the loop: It prints the value of counter and increments it by 1 in each iteration.
#IF Statement: Checks if counter is greater than 5.
#LEAVE Statement: Exits the loop labeled simple_loop if the condition is true.
#END LOOP: Marks the end of the LOOP block.
#Procedure End: Marks the end of the stored procedure.

## While 
DELIMITER //
CREATE PROCEDURE Example_WHILE()
BEGIN
    DECLARE counter INT DEFAULT 1;
    WHILE counter <= 5 DO
        -- Your code here
        SELECT counter;
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;

call Example_WHILE();

#DECLARE Statement: Declares a variable named counter of type INT and initializes it to 1.
#WHILE Loop: Executes the block of code between DO and END WHILE as long as the condition counter <= 5 is true.
#Code inside the loop: Prints the value of counter and increments it by 1 in each iteration.
#SET Statement: Increments the value of counter by 1 in each iteration.
#END WHILE: Marks the end of the WHILE loop.
#Procedure End: Marks the end of the stored procedure.

## Repeat 
DELIMITER //
CREATE PROCEDURE Example_REPEAT()
BEGIN
    DECLARE counter INT DEFAULT 1;
    REPEAT
        -- Your code here
        SELECT counter;
        SET counter = counter + 1;
    UNTIL counter > 5 END REPEAT;
END //
DELIMITER ;

call Example_REPEAT();

#DECLARE Statement: Declares a variable named counter of type INT and initializes it to 1.
#REPEAT Loop: Executes the block of code between REPEAT and UNTIL until the condition counter > 5 becomes true.
#Code inside the loop: Prints the value of counter and increments it by 1 in each iteration.
#SET Statement: Increments the value of counter by 1 in each iteration.
#UNTIL Statement: Specifies the condition to exit the loop (counter > 5). The loop continues executing until this condition becomes true.
#END REPEAT: Marks the end of the REPEAT loop.
#Procedure End: Marks the end of the stored procedure.


#######################################
##### Execution plan in MYSQL
#######################################

#Unlike other database solutions, MySQL does not 
#generate byte-code to execute a query result. 
#Instead, the query execution plan is used.
#• The query execution plan is a list of instructions that 
#the query execution must follow to produce the 
#query result.
#• It converts the source code (SQL query) into an 
#executable program.

#Problem Scenario:
#A data analyst of a company wants to check the execution plan for a query to view the performance and 
#cost of the query.
#Objective: 
#View the execution plan and create an index on the query to improve efficiency of the query.

CREATE TABLE exe_plan (
ID int,
NAME varchar(255),
DESIGNATION varchar(255),
CITY varchar(255)
);

INSERT INTO exe_plan 
(ID,NAME,DESIGNATION,CITY) VALUES ('3','STEVE', 'LD', 'Paris'),('3','STEVE', 'LD', 'Paris'),('3','STEVE', 'LD', 'Paris');

Select *from exe_plan;

select *from exe_plan where 
NAME='STEVE';

###################################### 
#### Connecting SQL AND Python 
######################################


