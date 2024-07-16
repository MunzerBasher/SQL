


use CarDetails;


--select * from Car_Details
--where Make = 'BMW'

--select Make ,MakeNumber = count(Make)
--		from Car_Details
--        Group By Make
--	    order by Make 

--insert into Makes
--select distinct Make   from Car_Details 
--order by Make asc


--select * from Makes


--ALTER TABLE Car_Details 
--	ADD ModelID int





--ALTER TABLE Car_Details 
--	DROP Column Fuel_Type_Name


--create table Fuel_Type
--(
--	Fuel_Type_NameID int primary key identity(1,1),
--	Fuel_Type_Name nvarchar(50)
--)


--insert into Fuel_Type 
--select distinct Fuel_Type_Name from Car_Details 

--ALTER TABLE Car_Details 
--	ADD Fuel_Type_D INT 


--select * from  Models 


--SELECT * FROM Fuel_Type


--update Car_Details 
--set Fuel_Type_D  = (select Fuel_Type_NameID  from  Fuel_Type where Fuel_Type.Fuel_Type_Name = Car_Details.Fuel_Type_Name)




select * from Car_Details 



