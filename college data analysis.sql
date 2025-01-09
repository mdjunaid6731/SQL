create database college;

use college;

create table student(
	rollno int primary key,
    name varchar(50),
    marks int not null,
    grade varchar(1),
    city varchar(20)
);

desc student;

insert into student
(rollno, name, marks, grade, city)
values
(101, "anil", 78, "C", "Pune"),
(102, "Bhumika", 93, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi");

select * from student;
select name, marks from student; 
select distinct city from student;   -- gives distict city names
 
 set SQL_SAFE_UPDATES = 0;
 
-- Update Command :  to updated exsiting rows
update student 
set grade = "O"
where grade = "A";

update student 
set marks = 12
where rollno = 105;

update student
set marks = marks+1;

-- Delete Caommand :  to delete existing rows
delete from student 
where marks<33;





-- WHERE Clause : To define some conditions
select * from student where marks > 80;
select * from student where city = "Mumbai";

-- AND Operator
select * 
From student
where marks >80 AND city = "Mumbai";

-- OR Operator
select * 
From student
where marks >80 or city = "Mumbai";

-- BETWEEN Operator(selects for a given range)
select * 
From student
where marks between 80 AND 90;  -- inclusive

-- IN Operator(Matchs any values in the given list)
select * 
From student
where city IN ("Delhi", "Mumbai", "Hyderabad");  

-- NOT IN Operator(to negate the given condition)
select * 
From student
where city NOt IN ("Delhi", "Mumbai", "Hyderabad"); 


-- LIMIT Clause : Sets an upper limit on number of (tuples/row) to be returned
select *
From student
LIMIT 2;  --  retunrs only 2 rows

-- ORDER BY Clause :To sort in asce or desc order
select *
from student
order by city asc;

select *
from student
order by marks desc
limit 3;   -- it gives top 3 marks

-- Aggregate function : Perform a calculation on a set of values , and return a single value.
-- COUNT(), MAX(), MIN(), SUM(), AVG() are  most used func
select max(marks)
from student;

select min(marks)
from student;

select count(name)
from student;

select sum(marks)
from student;

select avg(marks)
from student;

-- GROUP BY Clause: Groups rows that have the same values into summary row 
-- It collects data from multiple records and groups the result by one or more column.
-- ** Genrally we use group by with some aggregation function
-- Counts number of students in each city 
select city, count(name)
from student
group by city;

select city, avg(marks)
from student 
group by city;

-- write a query to find avg marks in each city  in ascending order.
select city , avg(marks)
from student
group by city
order by city;

-- HAVING Clause : Similar to WHERE i. e. applies some conditions on rows
-- Used when we want to apply any condition after grouping
-- ...Count number of students in each city where max marks cross 90.
select city, count(name)
from student 
group by city
having max(marks)>90;


-- SELECT column(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column(s)
-- HAVING Condition
-- ORDER BY column(s) ASC;

SELECT city
FROM student
WHERE grade = "O"
GROUP BY city
HAVING MAX(marks) >= 93
ORDER BY city DESC;

-- Revisting Foreign key
create table dept (
	id int primary key,
    name varchar(50)
);

create table teacher(
	id int primary key,
    name varchar(50),
    dept_id int,
    foreign key(dept_id) references dept(id)
);

-- On Update Cascade
-- When we create a foreign key using this option, it deletes the referencing rows in the 
-- child table when the referenced row is deleted in the parent table which has a primary key.

-- On Delete Cascade
-- When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the 
-- child table when the referenced row is updated in the parent table which has a primary key.

drop table teacher;

create table teacher(
	id int primary key,
    name varchar(50),
    dept_id int,
    foreign key(dept_id) references dept(id)
    on update cascade
    on delete cascade
);

insert into dept
values 
(101, "English"),
(102, "IT");

Insert into teacher
values
(101, "Adam", 101),
(102, "Eve", 102);

select * from dept;

update dept 
set id = 103
where id = 102;

select * from teacher; -- Changed in both the tables


-- Table Related Query
-- ADD COLUMN
Alter table student 
add column age int not null default 19;

select * from student;

-- Modify COLUMN
Alter table student 
modify column age varchar(2);

-- Change column
alter table student
change age stu_age int;

-- DROP COLUMN
ALter table student 
Drop column stu_age;

-- Rename table
Alter table student
Rename to student_table;

Alter table student_table
Rename to student;
 
-- truncate
-- Drop deletes the table 
-- Truncate deletes only tables data not table
 
 truncate table student;





