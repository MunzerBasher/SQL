
SELECT * FROM Employees
SELECT Name,  dbo.CountEmployeesInDepartment(3) AS EmployeesInDepartment FROM Employees


CREATE FUNCTION dbo.CountEmployeesInDepartment(@Depart int)
RETURNS INT
AS
BEGIN
    DECLARE @averageGrade INT;


    SELECT @averageGrade =  COUNT(*) FROM Employees WHERE DepartmentID = @Depart
    RETURN @averageGrade;
END;


CREATE FUNCTION dbo.GetEmployeeByID(@EmployeeID int)
RETURNS TABLE
AS
RETURN
(
   SELECT * FROM Employees WHERE EmployeeID = @EmployeeID
)


SELECT * FROM dbo.GetEmployeeByID(2) S LEFT JOIN Departments C ON C.DepartmentID= S.DepartmentID

SELECT * FROM 
Customers
 SELECT * FROM Employees 

 SELECT * FROM  Departments

 CREATE FUNCTION dbo.GetTopPerformingEmployees()
RETURNS @Result TABLE (
    EmployeeID INT,
    Name NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO @Result (EmployeeID, Name)
    SELECT TOP 3 EmployeeID, Name
    FROM Employees

    RETURN;
END;


SELECT * FROM dbo.GetTopPerformingEmployees()


CREATE PROCEDURE GenerateDynamicSQL1
    @TableName NVARCHAR(128)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = 'SELECT * FROM ' + @TableName;
    EXECUTE(@SQL);
END






CREATE PROCEDURE GenerateDynamicSQL2
    @TableName NVARCHAR(128)
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = N'SELECT * FROM ' + QUOTENAME(@TableName);
    EXEC sp_executesql @SQL;
END









