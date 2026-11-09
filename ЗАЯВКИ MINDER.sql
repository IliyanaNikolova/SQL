use Minder

--1.Извлечете имената на характеристиките от таблицата с характеристики. Подредете ги по име в азбучен ред.
SELECT title FROM Characteristics
ORDER BY title

--2.Извлечете информация за всички инициирани връзки, които са приети. Сортирайте ги в намаляващ ред по номера на потребителя, с когото са установени.
SELECT from_user_id, to_user_id, accepted
FROM Connections 
WHERE accepted=1
ORDER BY to_user_id DESC

--3. Имената на всички потребители, които са инициирали връзки, но не са приети.
SELECT from_user_id, to_user_id, u1.first_name as [ot], u2.first_name as[kym] FROM Connections
JOIN Users as u1
ON Connections.from_user_id=u1.user_id
JOIN Users as u2
ON Connections.to_user_id=u2.user_id
WHERE accepted=0

--4. Изведете името на най-харесвания потребител
SELECT TOP 1 first_name FROM Users as u1
JOIN (SELECT liked_user_id as t, COUNT(liked_user_id) as br FROM Likes
GROUP BY liked_user_id) as res
ON res.t=u1.user_id
ORDER BY res.br DESC

--Кой кого харесва
SELECT first_name as fn,res.br FROM Users as u1
JOIN (SELECT liked_user_id as t, COUNT(liked_user_id) as br FROM Likes
GROUP BY liked_user_id) as res
ON res.t=u1.user_id

SELECT u2.first_name as [koi], u1.first_name as [kogo] FROM Likes
JOIN Users as u1
ON Likes.liked_user_id=u1.user_id
JOIN Users as u2
ON Likes.liked_by_user_id=u2.user_id

--6. Кой не е харесван от никого
SELECT u2.first_name as [koi], u1.first_name as [kogo] FROM Likes
FULL JOIN Users as u1
ON Likes.liked_user_id=u1.user_id
FULL JOIN Users as u2
ON Likes.liked_by_user_id=u2.user_id
WHERE liked_user_id IS NULL