use college;


select * from student;

 -- Sub queries can be written with where, from , select
-- Example with where
-- Get the name of all student who scored more than class average.
-- Step 1: Find the avg of class
-- Step 2: Find the names of students with marks > AVG

select avg(marks)
from student;  -- returns 87.66

select name,  marks 
from student 
where marks > 87.666;

-- Combine both
select name,  marks 
from student 
where marks > (select avg(marks) from student);

-- Expamle
-- Find the names of  all students with even roll numbers.
-- Step 1: Find the even roll numbers
-- Step 2: Find the names of students with even roll no

select * 
from student
where rollno % 2 = 0; -- returns (102, 104, 106)

select name 
from student
where rollno in (102, 104, 106);

-- Combine:

SELECT name, rollno
from student
where rollno in (select rollno from student where rollno % 2 = 0);


-- Example
-- Find the max marks from the students of delhi
-- Step 1: Find the students of delhi
-- Step 2: Find their max marks using the sublist inn step 1

Select * 
from student
where city = "Delhi";

select max(marks)
from student;

select max(marks), city
from (Select *  from student where city = "Delhi") as temp;

select max(marks), city
from student 
where city = "Delhi";  -- This is also same



