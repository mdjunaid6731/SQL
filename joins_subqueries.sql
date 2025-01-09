use college;

create table student1(
	id int primary key,
    name varchar(50)
);

insert into student1 (id, name)
values
(101, "Adam"),
(102, "Bob"),
(103, "Casey");

create table course(
	id int primary key,
    course varchar(50)
);

insert into course(id, course)
values
(102, "English"),
(105, "Math"),
(103, "Science"),
(107, "Computer Science");

select * from student1;
select * from course;

-- INNER JOIN: Return records that have matching values in both tables
select * 
From student1 as s
inner join course as c
on s.id = c.id;

-- LEFT JOIN: Retruns all records from the left table, and the matched records form the right table
select * 
From student1 as s
left join course as c
on s.id = c.id;

-- RIGHT JOIN: Retruns all records from the right table, and the matched records form the left table
select * 
From student1 as s
right join course as c
on s.id = c.id;

-- FULL JOIN: Returns all records when there is a match in either left or right table
select * 
From student1 as s
left join course as c
on s.id = c.id
UNION
select * 
From student1 as s
right join course as c
on s.id = c.id;

-- Left exclusive join (A-B)
select * 
From student1 as s
left join course as c
on s.id = c.id
where c.id is null;

-- Right exclusive join (B-A)
select * 
From student1 as s
right join course as c
on s.id = c.id
where s.id is null;

-- SELF JOIN
-- It is a regular join but the table is joined with itself.
-- This technique is useful when a table contains hierarchical or related data and you need to
-- compare or analyse rows within the same table.	
create table employee(
	id int primary key,
    name varchar(50),
    manager_id int
 );
 
insert into employee(id, name, manager_id)
values
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", null),
(104, "donald", 103);

select * from employee;

select *
from employee as a
join employee as b
on a.id = b.manager_id;

select a.name, b.name
from employee as a
join employee as b
on a.id = b.manager_id;

select a.name as manager_name, b.name
from employee as a
join employee as b
on a.id = b.manager_id;

-- UNION: It is used to combine the result - set of two or more select statement
select name from employee
union
select name from employee;

select name from employee
union all
select name from employee; -- Also returns common elements


