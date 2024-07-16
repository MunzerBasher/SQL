
USE DrivingLicenseManagement


SELECT * FROM Persons



--ALTER TABLE Persons
--	ADD CONSTRAINT Patriot_check UNIQUE(PatriotNumber)


SELECT * FROM  Users



--ALTER TABLE Users
--	ADD CONSTRAINT Users_check UNIQUE(PersonID)


SELECT * FROM   Orders


--ALTER TABLE  Orders
--	ADD CONSTRAINT  Orders_check CHECK((OrderType_ID =1 AND LicenceFactionID IS NOT NULL) OR OrderType_ID <> 1 AND LicenceFactionID IS NULL)

--INSERT INTO Orders
--	VALUES
--	(1,'D',1,1,1,'F',1)


ALTER TABLE  Orders
	ADD CONSTRAINT  Orders_UNIQUE UNIQUE(PersonID,LicenceFactionID  )



ALTER TABLE  Orders
	ADD CONSTRAINT  Orders_Staus CHECK(Orders_UNIQUE = true and 


CREATE TABLE LicenceFaction
(
	FactionID INT PRIMARY KEY IDENTITY(1,1),
	FactionName NVARCHAR(50) NOT NULL,
	FactionDescription NVARCHAR(100) NOT NULL,
	FactionMinimumAllowedAge INT NOT NULL,
	FactionValidityLength INT NOT NULL,
	FactionFees INT NOT NULL
)

SELECT * FROM LicenceFaction



RESTORE DATABASE DVLD
	from disk = 'C:\DVLD.bak'
