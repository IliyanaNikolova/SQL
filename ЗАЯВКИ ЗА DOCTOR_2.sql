use Doctor

SELECT name_client, middle_name, date, hour_event
FROM Client as c
JOIN Reservation as r
ON c.id_client=r.client_id
WHERE name_client='Анелия'

CREATE PROCEDURE SearchPacient(@namePacient nvarchar(15), @SearchMiddleName nvarchar(20))
AS
BEGIN
SELECT name_client, middle_name, date, hour_event
FROM Client as c
JOIN Reservation as r
ON c.id_client=r.client_id
WHERE name_client=@namePacient AND middle_name=@SearchMiddleName
END


EXEC SearchPacient 'Ангел','Спиров'



--По зададена дата кои пациенти са на преглед
CREATE PROCEDURE SearchDate(@name_date date)
AS
BEGIN
SELECT date, name_client, middle_name
FROM Client as c
JOIN Reservation as r
ON c.id_client=r.client_id
WHERE date=@name_date
END

EXEC SearchDate '2025-03-04'


--По зададено име на населеното място да се изведат имената на пациентите записани за преглед от това населено място
CREATE PROCEDURE SearchPlace(@namePlace nvarchar(50))
AS
BEGIN
SELECT adress, name_client, middle_name,
FROM Client as c
JOIN Reservation as r
ON c.id_client=r.client_id
WHERE adress=@namePlace
END

EXEC SearchPlace 'Шейново'