CREATE DATABASE Online_store

use Online_store

CREATE TABLE Customers
(id_customer int PRIMARY KEY ,
name_customer nvarchar(50) NOT NULL,
email varchar(30) NOT NULL,
registration_date date)

CREATE TABLE Products
(id_product int PRIMARY KEY,
name_product nvarchar(255) NOT NULL,
price money,
category nvarchar(255))

CREATE TABLE Orders
(id_order int PRIMARY KEY,
customer_id INT FOREIGN KEY REFERENCES Customers(id_customer),
order_date date)

CREATE TABLE OrderDetails
(order_detail_id int PRIMARY KEY,
order_id int FOREIGN KEY REFERENCES Orders(id_order),
product_id int FOREIGN KEY REFERENCES Products(id_product),
quantity int)

INSERT Customers
VALUES (1, 'Иван Иванов', 'ivan@example.com', '2023-01-15')

INSERT Customers
vALUES
		(2, 'Мария Петрова', 'maria@example.com', '2023-02-10'),
		(3, 'Георги Димов', 'georgi@example.com', '2023-03-05'),
		(4, 'Тодор Тодоров', 'todor@example.com', '2024-01-02'),
		(5, 'Силвия Петкова', 'petkova@example.com', '2024-06-03'),
		(6, 'Лили Андреева', 'lili@example.com', '2024-08-10')

INSERT Products
VALUES(1,'Лаптоп',1500,'Електроника'),
		(2,'Мишка',50,'Аксесоари'),
		(3,'Телефон',800,'Електроника'),
		(4,'Раница',58,'Аксесоари'),
		(5,'Слушалки',250,'Аксесоари'),
		(6,'Тонколони',280,'Аксесоари'),
		(7,'Телевизор',650,'Електроника')

INSERT Orders
VALUES (1,1,'2024-01-10'),
		(2,1,'2024-02-15'),
		(3,2,'2024-02-20'),
		(4,3,'2024-03-05'),
		(5,1,'2024-03-10'),
		(6,6,'2025-01-30'),
		(7,4,'2025-02-01'),
		(8,3,'2025-02-10')

INSERT OrderDetails
VALUES (1,1,1,1),
		(2,1,2,2),
		(3,2,3,1),
		(4,3,1,1),
		(5,4,4,3),
		(6,5,2,1),
		(7,6,4,2),
		(8,7,7,1),
		(9,8,5,7)