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
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) >= 93
ORDER BY city DESC;



