create database hw_15
use hw_15
----task 1
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);
--
select id, name, salary from employees
where salary = (select min(salary) from employees)
----task 2
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);
--
select id,product_name,price from products
where price>(select avg(price) from products)
----task 3
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO Employee (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);
--
select e.id,e.name,d.department_name from Employee as e
join departments as d on e.department_id=d.id
where d.department_name='Sales'
----task 4
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);
--
select c.customer_id,c.name,o.order_id,o.customer_id from customers c
left join orders o on c.customer_id = o.customer_id
where o.order_id is null
----task 5 
CREATE TABLE product (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO product (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);
--
select p.id, p.product_name, p.price, p.category_id from product p
where p.price =(select max(p1.price) from product p1 where p1.category_id=p.category_id)
---- task 6
CREATE TABLE department (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employeees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO department (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employeees (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);
--
select e.id, e.name,e.salary, e.department_id, d.id,d.department_name from employeees e
join department d on e.department_id=d.id
where e.department_id=(
select top 1 department_id from employeees group by department_id order by avg(salary) desc)
----task 7
CREATE TABLE emp (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO emp (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);
--
select e.id,e.name,e.salary,e.department_id from emp e
where e.salary =(select max(e1.salary) from emp e1 where e1.department_id=e.department_id)
----task 8 
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);
--
select s.student_id,s.name, g.student_id,g.course_id,g.grade from students s
join grades g on s.student_id = g.student_id
where g.grade=(select max(g2.grade) from grades g2 where g2.course_id=g.course_id)
----task 9
CREATE TABLE prod (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO prod (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);
--
with Ranked as
(select id, product_name, price, category_id, 
ROW_NUMBER() over(partition by category_id order by price desc) as rn
from prod)
select id, product_name, price, category_id from Ranked
where rn=3
---- task 10
CREATE TABLE employeeees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employeeees (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);
--
select e.id,e.name,e.salary from employeeees e
where e.salary> (select avg(salary)) and e.salary<(select max(e1.salary) from employeeees e1 where e1.department_id=e.department_id)
