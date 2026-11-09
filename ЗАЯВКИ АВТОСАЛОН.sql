use CarsShowroom

--1. Изведете цялата информация от таблица Cars(* заема всички полета)
SELECT * FROM Cars;

--2. Изведете цялата информация за клиентите
SELECT * FROM Clients;

--3. Изведете цялата информация за продажбите
SELECT * FROM Sales;

--4. Изведете всички данни за колите, които са произведени преди 2020 година
SELECT * FROM Cars WHERE year_car < 2020;

--5. Изведете модел, цвят, година и цена за колите с марка 'Audi'
SELECT Model_car, Color_car, year_car, price_car FROM Cars WHERE Brand_car='Audi';

--6. Изведете марка, модел, година и цена за черните коли
SELECT Brand_car, Model_car, year_car, price_car FROM Cars WHERE Color_car='Черен';

--7. Изведете марка, модел, година и цена за колите, чийто цени са до 25000
SELECT Brand_car, Model_car, year_car, price_car FROM Cars WHERE price_car<=25000;

--8. Изведете марка, модел, година и цена за колите с двигател 1 (бензинов)
SELECT Brand_car, Model_car, year_car, price_car FROM Cars WHERE Engine_id=1;

--9. Изведете марка, модел, година и цена за колите от категория 1 ('Ван')
SELECT Brand_car, Model_car, year_car, price_car FROM Cars WHERE Category_id=1;

--10. Изведете всички данни за колите, които са черни или сини
SELECT * FROM Cars WHERE Color_car='Черен' OR Color_car= 'Син';

--11. Изведете всички данни за колите, които са в определен ценови диапазон (например между 18000 и 23000)
SELECT * FROM Cars WHERE price_car BETWEEN 18000 AND 23000;

--12. Изведете марка, модел, година и цена на най-евтиния автомобил
SELECT TOP 1 Brand_car, Model_car, year_car, price_car FROM Cars
ORDER BY price_car

--13. Изведете марка, модел, цвят, година и цена за всички бензинови автомобили, подредени в намаляващ ред по цена
SELECT Brand_car, Model_car, Color_car, year_car, price_car 
FROM Cars 
JOIN Engines
ON Cars.Engine_id=Engines.Id_engine
WHERE name_engine='Бензинов'
ORDER BY price_car DESC

--14. Изведете марка, модел, категория, година и цена за всички автомобили, тип 'Ван, подредени в намаляващ ред по години и по цена
SELECT Brand_car, Model_car,Category_id, year_car, price_car 
FROM Cars 
JOIN Categories
ON Cars.Category_id=Categories.Id_category
WHERE name_category='Ван'
ORDER BY year_car DESC, price_car DESC

--15. Намалете цената с 10% за всички коли с двигател 2 (дизелов) и година <= 2020
UPDATE Cars 
SET price_car=price_car-(price_car*0.1)
WHERE Engine_id=2 AND year_car <=2020

--16. Изтрийте клиент с ID 10
DELETE FROM Clients WHERE Id_client=10

--ДОПЪЛНИТЕЛНИ ЗАЯВКИ
--1. Да се изведат: име на клиент, марка, модел, цвят, цена на всички закупени коли подредени в азбучен ред по марка и след това в намаляващ ред по цена.
SELECT first_name,sur_name, Brand_car, Model_car, Color_car, price_car
FROM Cars 
JOIN Sales
ON Cars.Id_car=Sales.car_id
JOIN Clients 
ON Sales.client_id=Clients.Id_client
ORDER BY Brand_car ASC, price_car DESC

--2. Да се изведат марка, модел, година, цена и категория на колите с цена между 20000 30000 лв, тип Джип.
SELECT Brand_car, Model_car, year_car, price_car, name_category
FROM Cars 
JOIN Categories 
ON Cars.Category_id=Categories.Id_category
WHERE Cars.price_car BETWEEN 20000 AND 30000 AND Categories.name_category='Джип'

--3. Да се изведат марката, модел, категория, година и цена на всички дизелови автомобили, тип „Ван“
SELECT Brand_car, Model_car, year_car, price_car, name_category
FROM Cars 
JOIN Engines
ON Cars.Engine_id=Engines.Id_engine


