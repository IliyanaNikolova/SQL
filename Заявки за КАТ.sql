use KAT

--1. Да се напише параметрична заявка (или процедура) по зададено име на човек да се изведе информация за неговата собственост.
CREATE PROCEDURE SearchName(@NameSearch nvarchar(30))
AS
BEGIN
SELECT name_driver, surname_driver, reg_nomer, brand, model, color, year_made
FROM Drivers as d
JOIN Drivers_Cars as dc
ON d.id_driver=dc.driver_id
JOIN Cars as c
ON c.id_car=dc.car_id
END

EXEC SearchName 'Лили', 'Асенова'

--Процедурата е алтерната(десен бутон на процедура и Modify)

--2. Да се напише параметрична заявка (или процедура) по въведен регистрационен номер на лек автомобил кой или кои са собствениците му.
CREATE PROCEDURE SearchRegNomer(@RegNomerSearch char(4))
AS
BEGIN
SELECT name_driver, surname_driver FROM Drivers as d
JOIN Drivers_Cars as dc
ON d.id_driver=dc.driver_id
JOIN Cars as c
ON c.id_car=dc.car_id
WHERE reg_nomer=@RegNomerSearch
END

EXEC SearchRegNomer '0602'

--3. Да се напише параметрична заявка (или процедура) по зададено ЕГН на човек да се изведе пълна информация за него и неговата собственост.

CREATE PROCEDURE SearchEGN(@EGNSearch char(10))
AS
BEGIN
SELECT name_driver, surname_driver, adress, number_license,EGN, reg_nomer,brand, model,color,year_made FROM Drivers as d
JOIN Drivers_Cars as dc
ON d.id_driver=dc.driver_id
JOIN Cars as c
ON c.id_car=dc.car_id
WHERE EGN=@EGNSearch
END

EXEC SearchEGN '0256893417'

--4. Да се изведе информация по колко регистрирани автомобила има всяка марка.
SELECT brand, COUNT(car_id) FROM Cars as c
JOIN Drivers_Cars as dc
ON c.id_car=dc.car_id
GROUP BY brand

--5. Да се изведе какви автомобили произведени след 2020 година има регистрирани.
SELECT * FROM Cars
WHERE year_made>2020

--6. Да се изведе информация за автомобили, които са собственост на повече от един човек.
SELECT id_car,reg_nomer,brand,model,color, year_made, COUNT(car_id) as [на колко човека е собственост] FROM Cars as c
JOIN Drivers_Cars as dc
ON c.id_car=dc.car_id
GROUP BY id_car,reg_nomer,brand,model,color, year_made
HAVING COUNT(car_id)>1

--7. Да се изведе информация за хора, които притежават повече от един автомобил.
SELECT id_driver,EGN, name_driver,surname_driver,adress,number_license, COUNT(driver_id) FROM Drivers as d
JOIN Drivers_Cars as dc
ON d.id_driver=dc.driver_id
GROUP BY id_driver,EGN, name_driver,surname_driver,adress,number_license
HAVING  COUNT(driver_id)>1

--8. Да се изведат всички автомобили в черен цвят произведени между 2013 – 2015 година и информация за собствениците им (име и телефон за връзка).

SELECT name_driver,surname_driver,number_license, id_car,reg_nomer,brand,model,color, year_made
FROM Drivers as d
JOIN Drivers_Cars as dc
ON d.id_driver=dc.driver_id
JOIN Cars as c
ON c.id_car=dc.car_id
WHERE color='черен' AND year_made>=2013 AND year_made<=2015 

--9. Да се напише параметрична заявка по зададени: марка, модел и цвят на автомобила да се извежда – годината му на производство,
--името и телефона на собственика му.

CREATE PROCEDURE SearchBrandModelColor(@SearchBrand nvarchar(30), @SearchModel nvarchar(30), @SearchColor nvarchar(20))
AS
BEGIN
SELECT year_made, name_driver, number_license FROM Drivers as d
JOIN Drivers_Cars as dc
ON d.id_driver=dc.driver_id
JOIN Cars as c
ON c.id_car=dc.car_id 
WHERE brand=@SearchBrand and model=@SearchModel and color=@SearchColor
END

EXEC SearchBrandModelColor 'ауди','седан','черен'

--10. Да се изведат от марката Ауди, от кои модели има регистрирани автомобили.