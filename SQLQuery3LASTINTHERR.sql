

--create TABLE Persons
--(
--	ID int PRIMARY KEY,
--	Name varchar(20) not null,
--	age int ,
--	countery varchar(50)
--)


--create TABLE Orders
--(
--	ID int PRIMARY KEY,
--	Name varchar(20) not null,
--	Amount int 
--)

ALTER TABLE Orders
	ADD PersonID int
ALTER TABLE Orders
	ADD FOREIGN KEY(PersonID) REFERENCES Persons(ID);


	
SELECT * FROM Orders


SELECT * FROM Persons

insert into Persons
	values 
	('mosab',18,'sudan'),
	('mohanad' , 19 , 'sudan')





ALTER TABLE Persons
	ADD CONSTRAINT DEF_COUN 
	DEFAULT 'SUDAN' FOR countery





insert into Orders
	values 
		('backbord', 1200, 3),
		('phone', 9000, 4)


insert into Orders
	values 
		('phonehead', 1200, 3)


select Persons.Name as PersonName , Orders.Name as OrderName , Orders.Amount
from Persons INNER JOIN Orders 
ON Persons.ID = Orders.PersonID;


SELECT Persons.Name, Orders.Name AS Expr1, Orders.Amount
FROM   Persons INNER JOIN
             Orders ON Persons.ID = Orders.PersonID