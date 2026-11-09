use Klasni

--1. Имената на всички ученици и класните им ръководители
SELECT s.firstName, s.surName, kr.firstName, kr.surName
FROM Students as s
JOIN KlasniR as kr
ON s.id=kr.id

--2. Имената на всички учители, които не са класни
SELECT KlasniR.firstName,KlasniR.surName,Students.firstName
FROM KlasniR
LEFT JOIN Students
ON Students.id=KlasniR.id
WHERE Students.firstName IS NULL

--3. Имената на всички ученици, които не са разпределени в паралелки
SELECT Students.firstName,Students.surName, KlasniR.firstName
FROM Students
LEFT JOIN KlasniR
ON Students.id=KlasniR.id
WHERE KlasniR.firstName is NULL

--4.Имената на всички ученици, чийто класен ръководител е преподавател по информатика

SELECT Students.firstName, Students.surName, KlasniR.speciality
FROM Students
JOIN KlasniR
ON Students.id=KlasniR.id
WHERE speciality='информатика'

--5.Имената на всички учители, които имат стаж над 15 години

SELECT KlasniR.firstName,KlasniR.surName, KlasniR.work_age
FROM KlasniR
WHERE work_age>=15

--6. Имената на всички ученици, чийто класни ръководители имат стаж по-малко от 25 години

SELECT Students.firstName, Students.surName,  KlasniR.firstName,KlasniR.surName, KlasniR.work_age
FROM Students 
JOIN KlasniR
ON Students.id=KlasniR.id
WHERE work_age<=25