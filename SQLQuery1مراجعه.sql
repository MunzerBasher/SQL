
IF NOT EXISTS (SELECT * from sys.databases WHERE name = 'DB3')
	BEGIN
		CREATE DATABASE DB3;
	END




IF  EXISTS (SELECT * from sys.databases WHERE name = 'kok')
	BEGIN
		drop DATABASE kok;
	END




SELECT * from sys.databases 


CREATE TABLE COURSES
(
	ID INT PRIMARY KEY identity(1,1),
	NAME nvarchar(20),
	Code nvarchar(20),
)


insert into COURSES
	values
	('Math' ,'Ma20' ),
	('ML' ,'ML20' )

select * from COURSES

ALTER TABLE COURSES
	ADD Data nvarchar(10);


ALTER TABLE COURSES 
	drop COLUMN Data






