
USE DB3;

select * from Employees;

--INSERT INTO Employees
--VALUES (1, 'MUNZER',2500 , 'Sudan' );
INSERT INTO Employees
VALUES (2, 'Mohamed',2500 , 'Sudan' );
INSERT INTO Employees
VALUES (3, 'Ahmed',2500 , 'Sudan' );
INSERT INTO Employees
VALUES (4, 'OmER',2500 , 'Sudan' );
INSERT INTO Employees
VALUES (5, 'Ali',2500 , 'Sudan' );

INSERT INTO Employees
VALUES 
	(6, 'Ali',2500 , 'Sudan' ),
	(7, 'Ali',2500 , 'Sudan' ),
	(8, 'Ali',2500 , 'Sudan' );

select * from STUDENTS;

INSERT INTO STUDENTS(ID, NAME, CLASS)
VALUES (9,'MOHAMED', 'SECOND');

INSERT INTO STUDENTS
VALUES (3,'ALI',NULL, 'SECOND');

UPDATE Employees
	set Name = 'Munzer'
where ID = 3;

UPDATE Employees
	set Salary = Salary  + 1000
where Salary < 2500 and ID < 10;

UPDATE Employees
	set Salary = Salary + Salary / 10
where Salary < 2500;

SELECT *
INTO EmpoyeesCopy1
FROM Employees;

select * from EmpoyeesCopy1;


SELECT ID, Name
INTO EmpoyeesCopy2
FROM Employees;

select * from EmpoyeesCopy2;


SELECT *
INTO EmpoyeesCopy3
FROM Employees 
where 5=6;

select * from EmpoyeesCopy3;