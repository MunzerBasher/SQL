

use VehicleMakesDB
GO
ALTER AUTHORIZATION ON
DATABASE::VehicleMakesDB TO[sa]
GO



select Make,  Number = count(*) 
	From VehicleDetails INNER JOIN Makes on Makes.MakeID = VehicleDetails.MakeID  WHERE (Year between 1950 and 2000)
	Group by Make
	having  count(*) > 12000
	order by Number desc


SELECT * FROM VehicleDetails




select * from 
(
	select Make,  Number = count(*) 
	From VehicleDetails INNER JOIN Makes on Makes.MakeID = VehicleDetails.MakeID  WHERE (Year between 1950 and 2000)
	Group by Make
	
) R1
where Number > 12000


SELECT * FROM Makes WHERE Makes.Make LIKE 'B%'


select Make , FuelTypeName as FuelName , TotalVehicle = count(*) From VehicleDetails INNER JOIN FuelTypes on FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID 
INNER JOIN  Makes on Makes.MakeID =  VehicleDetails.MakeID	
Group by Make , FuelTypeName 
order by Makes.Make 







select * from 
(
	select Make,  Number = count(*) 
	From VehicleDetails INNER JOIN Makes on Makes.MakeID = VehicleDetails.MakeID  WHERE (Year between 1950 and 2000)
	Group by Make
	HAVING count(*)  > 10000
	
) R1
WHERE Number > 10000




select * from VehicleDetails LEFT JOIN FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID INNER JOIN Makes 
on Makes.MakeID = VehicleDetails.MakeID WHERE FuelTypes.FuelTypeName = 'GAS'




SELECT  COUNT(*) AS TotalMakes FROM
(

SELECT DISTINCT Makes.Make  from Makes INNER JOIN  VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID 
LEFT JOIN FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID WHERE FuelTypes.FuelTypeName = 'GAS'


)R2



SELECT DISTINCT TOTAL = COUNT(*)FROM Makes INNER JOIN  VehicleDetails ON  Makes.MakeID = VehicleDetails.MakeID INNER JOIN 
FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID WHERE FuelTypes.FuelTypeName = 'GAS'
GROUP BY FuelTypes.FuelTypeName 





select VehicleHaveAdoor ,VehicleTotal  ,CAST(VehicleHaveAdoor as Float) / CAST(VehicleTotal as Float) as PEr From
(
select VehicleHaveAdoor = COUNT(*),VehicleTotal = (select COUNT(*)  from  VehicleDetails) 
from  VehicleDetails where NumDoors > 0
)M

Select count(*) from
(
SELECT Make ,SubModelName , Total = count(*) From SubModels INNER JOIN VehicleDetails  on VehicleDetails.SubModelID = SubModels.SubModelID 
INNER JOIN Makes on VehicleDetails.MakeID = Makes.MakeID 
GROUP BY Make, SubModels.SubModelName
)V

SELECT * FROM SubModels

SELECT 	* FROM  VehicleDetails WHERE  NumDoors = 2 and Engine_Liter_Display > 3

SELECT 	* FROM  VehicleDetails WHERE Engine like '%OHV%' AND Engine_Cylinders = 4


SELECT *	FROM VehicleDetails INNER JOIN  Bodies ON  Bodies.BodyID = VehicleDetails.BodyID where 
Bodies.BodyName in ( 'Sport Utility', 'Coupe') and  VehicleDetails.Year in ( 2020, 2008, 2021)


--SELECT FOUND = 1 
--IF  EXISTS 
(
	SELECT *	FROM VehicleDetails WHERE VehicleDetails.Year = 1950
)


SELECT VehicleDetails.Vehicle_Display_Name ,VehicleDetails.Year , Age = 2023 - VehicleDetails.Year
FROM VehicleDetails where 2023 - VehicleDetails.Year between 15 and 25
ORDER BY Age desc




SELECT MINEngine_CC =  MIN(VehicleDetails.Engine_CC), MAXEngine_CC =  MAX(VehicleDetails.Engine_CC) FROM VehicleDetails 


SELECT * FROM
(

	SELECT * FROM VehicleDetails  WHERE Engine_CC < ((SELECT MAX(Engine_CC) FROM VehicleDetails ) + (SELECT MIN(Engine_CC) FROM VehicleDetails ))/2

)C
WHERE Engine_CC = MIN(Engine_CC)


SELECT * FROM VehicleDetails  WHERE Engine_CC IS unique




SELECT * FROM  VehicleDetails WHERE Engine_CC  IN
(
SELECT DISTINCT TOP 3 Engine_CC FROM VehicleDetails ORDER BY Engine_CC DESC 

)



SELECT Make FROM  VehicleDetails INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID WHERE Engine_CC  IN

(
SELECT DISTINCT TOP 3 Engine_CC FROM VehicleDetails ORDER BY Engine_CC DESC 

)

SELECT Make, TotalNumberDoorsInMake = count(VehicleDetails.NumDoors ) FROM  VehicleDetails INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID 
GROUP BY Make
ORDER BY count(VehicleDetails.NumDoors ) desc



SELECT Make, TotalNumberModelsInMake = count(VehicleDetails.ModelID ) FROM  VehicleDetails INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID 
GROUP BY Make
ORDER BY count(VehicleDetails.ModelID ) desc


SELECT TOP 3 Make, TotalNumberModelsInMake = count(VehicleDetails.ModelID ) FROM  VehicleDetails INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID 
GROUP BY Make
ORDER BY count(VehicleDetails.ModelID ) desc



SELECT TOP 3 SubModels.SubModelName, TotalNumberModelsInMake = count(VehicleDetails.ModelID ) FROM  VehicleDetails INNER JOIN SubModels ON SubModels.ModelID = VehicleDetails.ModelID 
GROUP BY SubModelName
ORDER BY count(VehicleDetails.ModelID ) desc






SELECT Make   FROM Makes INNER JOIN VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID INNER JOIN SubModels ON SubModels.ModelID = VehicleDetails.ModelID

WHERE TotalNumberModelsInMake = count(VehicleDetails.ModelID ) IN

SELECT Make   FROM Makes INNER JOIN VehicleDetails ON Makes.MakeID = VehicleDetails.MakeID WHERE VehicleDetails.ModelID  IN
(
SELECT TOP 3 SubModels.ModelID  FROM  VehicleDetails INNER JOIN SubModels ON SubModels.ModelID = VehicleDetails.ModelID 
GROUP BY SubModels.ModelID 
ORDER BY count(SubModels.ModelID ) desc

)






SELECT TOP 3 Make, TotalNumberModelsInMake = count(VehicleDetails.ModelID ) FROM  VehicleDetails 
INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID WHERE Make = 'Ford'
GROUP BY Make



select * from VehicleDetails





























