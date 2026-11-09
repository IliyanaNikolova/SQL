CREATE DATABASE Minder

use Minder

CREATE TABLE Characteristics
(characteristic_id int PRIMARY KEY IDENTITY,
title nvarchar(255) NOT NULL)

CREATE TABLE Users
(user_id int PRIMARY KEY IDENTITY,
username nvarchar(50) NOT NULL,
email varchar(255) NOT NULL,
password varchar(255) NOT NULL,
first_name nvarchar(255) NOT NULL,
last_name nvarchar(255) NOT NULL,
birthdate date NOT NULL,
gender char(1) CHECK (gender IN('f', 'm')),
bio nvarchar(255),
latitude float,
longitude float,
profile_picture nvarchar(50))

CREATE TABLE Characteristics_users
(characteristic_id int FOREIGN KEY REFERENCES Characteristics(characteristic_id),
user_id int FOREIGN KEY REFERENCES Users(user_id),
value nvarchar(255) NOT NULL,
CONSTRAINT PK PRIMARY KEY (characteristic_id, user_id))

CREATE TABLE Connections
(connection_id int PRIMARY KEY IDENTITY,
from_user_id int FOREIGN KEY REFERENCES Users(user_id),
to_user_id int FOREIGN KEY REFERENCES Users(user_id),
accepted int CHECK(accepted IN(0,1)))

CREATE TABLE Likes
(liked_by_user_id int FOREIGN KEY REFERENCES Users(user_id),
liked_user_id int FOREIGN KEY REFERENCES Users(user_id),
CONSTRAINT PK1 PRIMARY KEY(liked_by_user_id, liked_user_id))

INSERT  Characteristics (title) 
VALUES (N'Спортен'), 
		(N'Интелигентен'), 
		(N'Забавен'), 
		(N'Творчески'), 
		(N'Приключенски')

INSERT Users (username, email, password, first_name, last_name, birthdate, gender, bio, latitude, longitude, profile_picture)
VALUES 
('user1', 'user1@example.com', 'pass123', N'Иван', N'Петров', '1990-05-15', 'm', N'Обичам спорта.', 42.6975, 23.3242, 'pic1.jpg'),
('user2', 'user2@example.com', 'pass123', N'Мария', N'Димитрова', '1995-09-22', 'f', N'Любител на книгите.', 42.1354, 24.7453, 'pic2.jpg'),
('user3', 'user3@example.com', 'pass123', N'Георги', N'Иванов', '1988-12-10', 'm', N'Пътешественик по душа.', 41.6338, 25.3775, 'pic3.jpg'),
('user4', 'user4@example.com', 'pass123', N'Елена',N'Симеонова', '1992-07-30', 'f', N'Креативен артист.', 43.2141, 27.9147, 'pic4.jpg')

INSERT  Characteristics_users (characteristic_id, user_id, value) VALUES
(1, 1, N'Много активен'), 
(2, 2, N'Обожава да чете'), 
(3, 3, N'Животът е парти'), 
(4, 4, N'Рисува като професионалист')

INSERT  Connections (from_user_id, to_user_id, accepted) VALUES
(1, 2, 1), -- Иван и Мария са свързани
(2, 3, 0), -- Мария е изпратила заявка на Георги, но не е приета
(3, 4, 1) -- Георги и Елена са приятели

INSERT  Likes (liked_by_user_id, liked_user_id) VALUES
(1, 2), -- Иван харесва Мария
(2, 3), -- Мария харесва Георги
(3, 1), -- Георги харесва Иван
(4, 1); -- Елена харесва Иван