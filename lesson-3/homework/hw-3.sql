--lesson-3
----1) bulk insert— это команда в sql server которая загрузит данные из файла в таблицу базы данных.
----2)следующие четыре: CSV, txt, json, xml
----3)
create table Products (productID int primary key,productName varchar(50), price decimal(10, 2))
----4)
insert into Products values(1, 'notebook', 2000),(2, 'phone', 1500) 
select * from Products
----5)если стоит null то информация не будет указана, то есть на ее месте будет стоять null, если же дан NOT NULL то значение обязательно должно быть указано
----6)
alter table products
add constraint uq_productname unique (productname)
----7) UNIQUE это одно из ограничений которое запрещает дублирование информации на которую поставлен этот термин
----8)
alter table products
add categoryID int
update Products set categoryID = 1
----9)
create table categories(categoryid int primary key, categoryname varchar (50) unique)
insert into categories values(1, 'electronics')
select * from categories
drop table categories
drop table Products
----10)indentity с помощью его можно с каждой строкой увеличивать и уникально ставать нумерация, например используется для айди(ID)
----11)
bulk insert products
from 'D:\countries1.txt'
with (
format = 'CSV',
fieldterminator = ',',
rowterminator = '/n',
firstrow = 2
)
----12)
create table categories(categoryid int primary key, categoryname varchar (50) unique)
create table Products (productID int primary key,productName varchar(100),price decimal(10, 2),categoryID int,foreign key (categoryID) references Categories(categoryID))
----13) primary key не может быть null, основной ключ таблицы; unique key уникальность в столбце а не в таблице, можно использовать null, в одной таблице несколько uniwue
----14)
alter table products
add constraint chk_price check (price>0)
 select * from Products
 ----15) 
 alter table products
 add stock int not null
 ----16)
 update Products
 set price = 0
 where price is null
 ----17)например есть таблица категории где есть виды товаров телефоны планшеты ноутбуки, и есть таблица товары, где написаны конкретные товары айфон самсунг, чтобы убедиться что номер например 1-телефоны есть в тыблице используется foreign key
 ----18)
 create table customers(age int check (age>=18))
 ----19)
 create table employee(id int identity(100, 10), name varchar(50))
 insert into employee (name) values('jack'),('bob')
 select * from employee
 ----20)
 create table orderdetails(orderid int, productid int, price decimal(10,2), primary key (orderid, productid))
 ----21) isnull- ею можно заменить например пустую цену на 0, coalesce- проверяет несколько значений и показывает первое которое не null
 ----22)
 create table employees10(empid int primary key, email varchar(50) unique)
 ----23)
 create table schools(schoolid int primary key, directorid int, foreign key (customerid) references customers(suctomer id) 
 on delete cascade 
 on update cascade
 )
