use lesson2homework
----1
create table Employees(EmpID int, name varchar(50), salary decimal(10,2))
----2
insert into Employees values
(1,'Jamshid',250),
(2,'Gulnora',370),
(3,'Erkin',455)
select * from Employees
----3
update Employees
set salary = 7000 
where EmpID = 1
----4
delete from Employees
where EmpID = 2
----5 delete удаляет отдельные строки но не структуру; tnarcate удаляет все строки но не структуру; dpop удаляет строки и структуры.
----6
alter table employees
alter column name varchar(100)
----7
alter table employees
add Department varchar(50)
----8
alter table employees
alter column salary float 
----9
create table Departments(DepartmentID int primary key, DepartmentName varchar(50))
select * from Departments
----10
delete from Employees
----11
select 1,'production'
select 2,'hr'
select 3,'it'
----12
update Employees
set Department = 'Management'
where Salary > 5000
----13
delete from Employees
----14
alter table Employees
drop column Department
----15
exec sp_rename 'Employees', 'StaffMembers'
----16
drop table Departments
----17
create table Products(ProductID int primary key, ProductName varchar(50), Category varchar(50), price decimal (10,2))
----18
alter table Products
add constraint chk_price check (price > 0)
----19
alter table Products
add StockQuantity int default 50
----20
exec sp_rename 'Category', 'ProductCategory'
----21
select * from Products
insert into Products values
(10,'iphone','phone',1500,800),
(11,'iphone','phone',1400,500),
(12,'hp','notebook',1100,1000),
(13,'lenovo','notebook',1200,null),
(14,'iphone','phone',560,780)
----22
select * into Prosucts_Backup from Products
----23
exec sp_rename 'Products', 'Inventory'
----24
alter table Inventory
drop constraint chk_price

alter table Inventory
alter column Price float
----25
alter table Inventory
add ProductCode int identity(1000,5)
select * from Inventory
-------------------------------------------
