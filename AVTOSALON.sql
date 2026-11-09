CREATE DATABASE CarsShowroom

use CarsShowroom

CREATE TABLE Cars
(Id_car int PRIMARY KEY identity,
Brand_car nvarchar(20),
Model_car nvarchar(20),
Category_id int FOREIGN KEY REFERENCES Categories(Id_category),
Engine_id int FOREIGN KEY REFERENCES Engines(Id_engine),
Color_car nvarchar(15),
year_car int,
price_car decimal)

CREATE TABLE Clients
(Id_client int PRIMARY KEY identity,
first_name nvarchar(15),
sur_name nvarchar(20),
number_client char(10))

CREATE TABLE Sales
(Id_sale int PRIMARY KEY identity,
Car_id int FOREIGN KEY REFERENCES Cars(Id_car),
client_id int FOREIGN KEY REFERENCES Clients(id_client),
SaleDate date)

CREATE TABLE Categories
(Id_category int PRIMARY KEY identity,
name_category nvarchar(25))

CREATE TABLE Engines
(Id_engine int PRIMARY KEY identity,
name_engine nvarchar(30))

--Започваме с екзекютването от най-независимите таблици в случая: 1-engines; 2-categories;3-Cars;4-Clients;5-Sales, попълваме таблиците по реда, в който сме ги създали

--Add items
	--1:

INSERT Engines
VALUES ('Бензинов'), ('Дизелов'), ('Електрически'),
    ('Хибриден'), ('Plug-In хибрид')

	--2:
INSERT Categories
VALUES ('Ван'), ('Джип'), ('Кабрио'), ('Комби'), ('Купе'), ('Миниван'),
      ('Пикап'), ('Седан'), ('Стреч лимузина'), ('Хечбек')

	--3:

INSERT Cars
VALUES ('VW', 'Golf', 1, 1, 'Черен', 2022, 20000),
    ('Audi', 'A3', 2, 2, 'Металик', 2021, 25000),
    ('BMW', '3 Series', 2, 1, 'Син', 2020, 30000),
    ('Mercedes-Benz', 'C-Class', 2, 1, 'Бял', 2022, 35000),
    ('Toyota', 'Corolla', 1, 3, 'Металик', 2021, 22000),
    ('Audi', 'A5', 1, 1, 'Черен', 2020, 32000),
    ('BMW', '6 Series', 1, 2, 'Черен', 2019, 35000),
    ('Audi', 'A8', 3, 1, 'Тъмно сив', 2023, 75000),
    ('Mercedes-Benz', 'G 500', 2, 3, 'Черен', 2022, 68000),
    ('Peugeot', '308', 1, 2, 'Червен', 2022, 23000)

	--4:

INSERT Clients
VALUES ('Иван', 'Радославов', '0888123456'),
    ('Петър', 'Димитров', '0899123456'),
    ('Ирена', 'Костадинова', '0877123456'),
    ('Пламен', 'Петров', '0885123456'),
    ('Георги', 'Георгиев', '0897123456'),
    ('Васил', 'Поптодоров', '0886123456'),
    ('Николай', 'Павлов', '0876123456'),
    ('София', 'Димитрова', '0896123456'),
    ('Ангел', 'Петров', '0884123456'),
    ('Красен', 'Костов', '0875123456')

	--5

INSERT Sales
VALUES (6, 8, '2022-01-16'),
    (2, 3, '2022-02-09'),
    (5, 1, '2022-11-30'),
    (7, 4, '2022-04-19'),
    (1, 6, '2023-05-21')