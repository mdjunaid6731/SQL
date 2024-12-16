CREATE DATABASE Practice;

CREATE DATABASE IF NOT EXISTS Practice;

DROP DATABASE IF EXISTS company;

SHOW DATABASES;

USE Practice;

CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student
(rollno, name)
VALUES
(101, "Karan"),
(102, "Arjun"),
(103, "Ram");

SELECT * FROM student;

INSERT INTO student VALUES (104, "Shyam");

-- Constraints:
-- NOT NULL : Columns cannot have a null value.... col1 int NOT NUll
-- UNIQUE : All values in column are different..... col2 int UNIQUE
-- PRIMARY KEY : Makes a cloumn unique and not null but used for one... id int PRIMARY KEY
-- FOREIGN KEY : Prevent action that would destroy link between tables
-- DEFAULT : Sets the default value of a column... salary int default 25000
-- CHECK : it can limit the values allowed in a column



-- UNIQUE
CREATE TABLE temp1(
	id int UNIQUE
); 

INSERT INTO temp1 VALUES (101);
INSERT INTO temp1 VALUES (101);   -- It throughs error

select * From temp1;

-- PRIMARY KEY 
create table temp2(
	id int,
    name varchar(50),
    age int,
    city varchar(50),
    primary key(id)
    -- primary key(id, name) Combination of both columns
);

-- FOREIGN KEY
create table temp3(
	cust_id int,
    foreign key(cust_id) references temp2(id)
);

-- DEFAULT
create table emp(
	id int,
    salary int default 25000   -- if salary value is not given then 25000 will be inserted by default
);
INSERT INTO emp (id) values (101);
Select * from emp;

-- CHECK
create table xyz(
	id int primary key,
    city varchar(50),
    age int,
    constraint age_check CHECK (age >= 18  AND city = "Bengaluru")
); 
create table newTab(
	age int check (age >= 18)
);


 




