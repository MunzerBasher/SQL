Select * from Employees;

Select distinct ID, FirstName, LastName,MonthlySalary From Employees;

Select Distinct  DepartmentID from Employees;

Select * from Employees
where DepartmentID in(Select DepartmentID  from Employees where DepartmentID <= 3);

Select * from Employees
where  DepartmentID in(1,2,3);



