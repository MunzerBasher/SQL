


USE BankSystemDB

CREATE TABLE  Clients
(
	ClientID INT PRIMARY KEY IDENTITY(1,1),
	AccountNumber NVARCHAR(20) UNIQUE NOT NULL,
	clientPassword NVARCHAR(20) NOT NULL,
	PersonID  INT REFERENCES Parsons(PersonID) UNIQUE 
)




ALTER TABLE Clients
	ADD CONSTRAINT CK_Acco UNIQUE (AccountNumber)
	


ALTER TABLE Clients
	ADD CONSTRAINT CK_Palance CHECK (Palance >= 5000)





SELECT* FROM Clients


INSERT INTO Clients
	VALUES
	('723-813','12345',6,15500),
	('763-143','12345',6,50000)





SELECT * FROM  Persons


SELECT * FROM  Clients

SELECT * FROM  ClientsDATE


SELECT * FROM  USERSDATE


INSERT INTO Persons
	VALUES
	('MUNZER','0907118500'),
	('MOSAB','0122411001')

