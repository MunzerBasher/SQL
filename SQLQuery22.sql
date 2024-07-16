
Restore Database HR_Database 
	from disk ='C:\HR_Database.bak';



Select * from Employees;

Select Employees.* from Employees;

Select ID, FirstName, LastName,MonthlySalary From Employees;

Select ID, FirstName, DateOfBirth From Employees;

Select * from Departments;

Select * from Countries;


Select DepartmentID from Employees;

Select Distinct  DepartmentID from Employees;



Select FirstName from Employees;

Select Distinct  FirstName from Employees;


Select FirstName, DepartmentID from Employees;

Select distinct FirstName, DepartmentID from Employees;



Select * from Employees
where Gendor='F';

Select * from Employees
where  MonthlySalary<=500;


Select * from Employees
where  MonthlySalary>500;

Select * from Employees
where Not MonthlySalary<=500;


Select * from Employees
where MonthlySalary<500 and Gendor='F';

select * from Employees
where CountryID=1;


select * from Employees
where Not CountryID=1;


select * from Employees
where  CountryID <> 1;


select * from Employees
where DepartmentID=1;

select * from Employees
where DepartmentID=1 and Gendor='M';


select * from Employees
where DepartmentID=1 Or DepartmentID=2;

select * from Employees
where DepartmentID=1 AND DepartmentID=2;


Select * from Employees
where ExitDate is Null;


Select * from Employees
where ExitDate  is Not Null;

















select * from Employees
where DepartmentID=1 Or DepartmentID=2;


select * from Employees
where DepartmentID=1 Or DepartmentID=2 or DepartmentID=7;


select * from Employees
where DepartmentID=1 Or DepartmentID=2 or DepartmentID=5 or DepartmentID=7;


select * from Employees
where DepartmentID in (1,2,5,7);


select * from Employees
where FirstName in ('Jacob','Brooks','Harper');


select Departments.Name from Departments 
where 
ID in ( select DepartmentID from Employees where MonthlySalary <=210 );


select Departments.Name from Departments 
where 
ID not in ( select DepartmentID from Employees where MonthlySalary <=210 );








select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1


select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By FirstName ;

select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By FirstName ASC;

select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By FirstName desc;

select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By MonthlySalary ;


select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By MonthlySalary Asc;


select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By MonthlySalary Desc;



select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By FirstName , MonthlySalary ;


select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By FirstName ASC, MonthlySalary Desc;
