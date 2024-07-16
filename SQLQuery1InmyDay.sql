

SELECT FOUND = 1 WHERE EXISTS (SELECT NationalNo FROM People WHERE NationalNo = 'N1')




SELECT * FROM Users


Create view UsersView as
SELECT Users.UserID, People.PersonID, People.FirstName +' ' + People.SecondName + ' ' + People.ThirdName + ' ' + People.LastName AS FullName, Users.UserName, Users.IsActive
FROM   People INNER JOIN
             Users ON People.PersonID = Users.PersonID





ALTER TABLE People
	ADD CONSTRAINT Check_No UNIQUE(NationalNo)


SELECT * FROM People


