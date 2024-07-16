


select top 5  * from Employees;


select top 5 percent * from Employees;


select * from Employees
where Employees.MonthlySalary in (select top 10 Employees.MonthlySalary from Employees);


select distinct MonthlySalary from Employees
order by MonthlySalary desc 



select * from Employees
where Employees.MonthlySalary in(3000, 2996, 2989);


select distinct top 3 MonthlySalary from Employees
order by MonthlySalary desc 

select * from Employees
where MonthlySalary in (select distinct top 3 MonthlySalary from Employees
order by MonthlySalary desc )
order by MonthlySalary desc;


select * from Employees
where MonthlySalary in (select distinct top 3 MonthlySalary from Employees
order by MonthlySalary ASC )
order by MonthlySalary ASC;



Select A = 5 * 4 , B = 6/2


Select A = 5 * 4 , B = 6/2 
from employees


Select ID, FirstName,  half = MonthlySalary/2
from employees


Select ID, FirstName + ' ' + LastName as FullName From Employees;


Select ID, FullName = FirstName + ' ' + LastName  From Employees;


select ID, FirstName , MonthlySalary , YealySalary = MonthlySalary * 12  from employees;


select ID, FirstName , MonthlySalary , YealySalary = MonthlySalary* 12 , BonusAmount = MonthlySalary * BonusPerc  from employees;


select Today = getDate()


select ID, FullName = FirstName + ' ' + LastName, Age = DATEDIFF(Year , DateOfBirth ,getDate()) from Employees;



select TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees;


select  TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees where DepartmentID=2



select * from employees;

select TotalEmployees = count (ID) from Employees;

--count function only counts the not null values.
select ResignedEmployees= count(ExitDate)  from employees;

	   
select TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees;

select  DepartmentID=3,TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees where DepartmentID=3



select DepartmentID, 
	   TotalCount = Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees
       Group By DepartmentID
	   order by DepartmentID	   


select DepartmentID, TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees
       Group By DepartmentID
	   having Count(MonthlySalary) > 100
	   order by DepartmentID


select * from 
(

   select DepartmentID, TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees
       Group By DepartmentID
	

	  
) R1


where R1.TotalCount> 100;


select * from Employees;

--Finds any values that start with "a"
select ID, FirstName from Employees
where FirstName like 'a%';

--Finds any values that end with "a"
select ID, FirstName from Employees
where FirstName like '%a';


--Finds any values that have "tell" in any position
select ID, FirstName from Employees
where FirstName like '%tell%';


--	Finds any values that start with "a" and ends with "a"
select ID, FirstName from Employees
where FirstName like 'a%a';


--Finds any values that have "a" in the second position
select ID, FirstName from Employees
where FirstName like '_a%';


--Finds any values that have "a" in the third position
select ID, FirstName from Employees
where FirstName like '__a%';

--Finds any values that start with "a"
select ID, FirstName from Employees
where FirstName like 'a%' or FirstName like 'b%' ;


--Execute these satatements to update data
Update Employees 
set FirstName ='Mohammed' , LastName='Abu-Hadhoud'
where ID= 285;


Update Employees 
set FirstName ='Mohammad' , LastName='Maher'
where ID= 286;


select ID, FirstName, LastName from Employees
Where firstName = 'Mohammed' or FirstName ='Mohammad'; 

-- will search form Mohammed or Mohammad
select ID, FirstName, LastName from Employees
Where firstName like 'Mohamm[ae]d';



--You can use Not 
select ID, FirstName, LastName from Employees
Where firstName Not like 'Mohamm[ae]d';



select ID, FirstName, LastName from Employees
Where firstName like 'a%' or firstName like 'b%' or firstName like 'c%';


-- search for all employees that their first name start with a or b or c
select ID, FirstName, LastName from Employees
Where firstName like '[abc]%';


-- search for all employees that their first name start with any letter from a to l
select ID, FirstName, LastName from Employees
Where firstName like '[a-l]%';


--Restore Database Shop_Database from disk ='c:\Shop_Database.bak';
SELECT  Employees.ID AS  EmplID , FullName = Employees.FirstName + '   ' + Employees.LastName, Departments.Name as DepartmentsName, DepartmentsID = Departments.ID
FROM   Departments INNER JOIN
             Employees ON Departments.ID = Employees.DepartmentID



SELECT  Employees.FirstName, Employees.LastName, Departments.Name as DeparName , Departments.ID
FROM   Departments INNER JOIN
             Employees ON Departments.ID > 3;




SELECT Departments.Name, Employees.FirstName, Employees.LastName, Employees.ID
FROM   Departments INNER JOIN
             Employees ON Departments.ID = Employees.DepartmentID

where Departments.Name ='IT';


SELECT FullName = Employees.FirstName + '   ' + Employees.LastName , Departments.Name as DepartName , Countries.Name AS CountriesName
FROM   Employees INNER JOIN
             Departments ON Employees.DepartmentID = Departments.ID INNER JOIN
             Countries ON Employees.CountryID = Countries.ID
where DepartmentID < 3 and Countries.Name = 'USA';