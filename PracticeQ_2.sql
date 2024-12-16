use practice;

create table customer(
	customer_id int primary key,
    customer varchar(50),
    mode varchar(50),
    city varchar(50)
);

insert into customer
(customer_id, customer, mode, city)
values
(101, "Olivia Barrett", "Netbanking", "Portland"),
(102, "Ethan Sinclair", "Credit Card", "Miami"),
(103, "Maya Hernandez", "Credit Card", "Seattle"),
(104, "Liam Donovan", "Netbanking", "Denver"),
(105, "Sophia Nguyen", "Credit Card", "New Orleans"),
(106, "Caleb Foster", "Debit Card", "Minneapolis"),
(107, "Ava Patel", "Debit Card", "Phoenix"),
(108, "Lucas Carter", "Netbanking", "Boston"),
(109, "Isabella Martinez", "Netbanking", "Nashville"),
(110, "Jackson Brooks", "Credit Card", "Boston");

select * from customer;

-- Find the total payment according to each payment method.
select mode, count(customer_id)
from customer
group by mode;