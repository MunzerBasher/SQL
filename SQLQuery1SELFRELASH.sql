



USE HR_Database 

SELECT * FROM Employees



SELECT * FROM MYEmployees


SELECT MYEmployees.ID AS EmployeesID, MYEmployees.NAME AS EmployeesName , MYEmployees_1.ID AS ManagerID , MYEmployees_1.NAME AS ManagerName
FROM   MYEmployees LEFT JOIN MYEmployees AS MYEmployees_1 ON MYEmployees.ManagerID = MYEmployees_1.ID 




UPDATE MYEmployees SET ManagerID = ID WHERE ManagerID  IS NULL
(
	SELECT MYEmployees.ID AS EmployeesID, MYEmployees.NAME AS EmployeesName , MYEmployees_1.ID AS ManagerID , MYEmployees_1.NAME AS ManagerName
	FROM   MYEmployees LEFT JOIN MYEmployees AS MYEmployees_1 ON MYEmployees.ManagerID = MYEmployees_1.ID WHERE  MYEmployees_1.NAME = 'MUNZER'

)



