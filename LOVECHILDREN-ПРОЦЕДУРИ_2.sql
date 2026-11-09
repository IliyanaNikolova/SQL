use LoveChildren

--1. Извеждане на имената и годините на всички записани деца.
CREATE PROCEDURE NameAndAgeChild
AS
BEGIN
SELECT name_child, age_child FROM Children
END

EXEC NameAndAgeChild

--2. Извеждане на имената и специалностите на всички преподаватели
CREATE PROCEDURE NameAndSpecialtyTeacher
AS
BEGIN
SELECT name_teacher, specialty_teacher FROM Teachers
END

EXEC NameAndSpecialtyTeacher

--3. Извеждане на имената на всички деца и името на групата, чийто занятия се провеждат в понеделник.
CREATE PROCEDURE ChildrenGroupMonday
AS
BEGIN
SELECT name_child, name_group
FROM Children as ch
JOIN Children_groups as cg
ON ch.id_children=cg.children_id
JOIN Groups as g
ON g.id_group=cg.group_id
WHERE day_event='понеделник'
END

EXEC ChildrenGroupMonday

--4. Извеждане на имената на преподавателите и кой колко групи води.
CREATE PROCEDURE CountGroupsTeacher
AS
BEGIN
SELECT name_teacher, COUNT(teacher_id)
FROM Teachers as t
JOIN Groups as g
ON t.id_teacher=g.teacher_id
GROUP BY name_teacher
END

EXEC CountGroupsTeacher

--5. Извеждане имената на децата и кой му е преподавател.
CREATE PROCEDURE ChildrenTeachers
AS
BEGIN
SELECT name_child, name_teacher
FROM Children as ch
JOIN Children_groups as cg
ON ch.id_children=cg.children_id
JOIN Groups as g
ON g.id_group=cg.group_id
JOIN Teachers as t
ON t.id_teacher=g.teacher_id
GROUP BY name_child, name_teacher
END

EXEC ChildrenTeachers

--6. В коя група по колко деца има.
CREATE PROCEDURE CountChildrenInGroup
AS BEGIN
SELECT name_group, COUNT(children_id)
FROM Groups as g
JOIN Children_groups as cg
ON g.id_group=cg.group_id
GROUP BY name_group
END

EXEC CountChildrenInGroup