
select * from Employees
where ExitDate is NULL

select * from ActiveEmployees

select * from
(
select * from Employees
where ExitDate is NULL
) R

select * from ActiveEmployees
where ID > 20;

select * from Employees
where ExitDate is NOT NULL

select FirstName, LastName , Gendor  from Employees

select * from ShortData 


select * from ActiveEmployees
union
select * from RgsEmployees 


select ID, FirstName, LastName , GendorTile =
CASE
	WHEN Gendor = 'M' THEN 'Male'
	WHEN Gendor = 'F' THEN 'Female'
	ELSE 'UNKNOWN'
END

from Employees




select ID, FirstName, LastName , GendorTile =
CASE
	WHEN Gendor = 'M' THEN 'Male'
	WHEN Gendor = 'F' THEN 'Female'
	ELSE 'UNKNOWN'
END,
Status = 
CASE 
	WHEN ExitDate is NULL THEN 'Active'
	WHEN ExitDate is NOT NULL THEN 'Resigned'
END

from Employees



select * from Orgn




