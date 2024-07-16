USE VehicleMakesDB



CREATE FUNCTION dbo.GetAllMakesCount()
RETURNS TABLE
AS
RETURN 
(
	SELECT COUNT(*) AS NUMBER FROM VehicleDetails GROUP BY MakeID 
)


CREATE FUNCTION dbo.GetAllMakeCountByMakeID(@MakeID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT COUNT(*) AS NUMBER FROM VehicleDetails GROUP BY MakeID HAVING VehicleDetails.MakeID = @MakeID
)


CREATE FUNCTION dbo.GetAllMakeCountByMakeIDRIN(@MakeID INT)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT = 0;
	SET  @Result = COUNT(*) FROM VehicleDetails GROUP BY MakeID HAVING VehicleDetails.MakeID = @MakeID 
	RETURN @Result 
END





SELECT * FROM dbo.GetAllMakesCount()



SELECT * FROM VehicleDetails WHERE Year BETWEEN 1900 AND 2000 AND (SELECT * FROM dbo.GetAllMakeCountByMakeID(VehicleDetails.MakeID)) > 1000



SELECT * FROM dbo.GetAllMakeCountByMakeID(2)

SELECT VehicleDetails.ModelID , COUNT(*) AS NumberInModle ,(SELECT COUNT(*) FROM VehicleDetails) AS TotalNumber,
prt = CAST(COUNT(*) AS FLOAT)/ CAST((SELECT COUNT(*) FROM VehicleDetails)  AS FLOAT) 
FROM  VehicleDetails WHERE Year BETWEEN 1900 AND 2000 GROUP BY ModelID



SELECT Makes.Make,COUNT(*) AS NumberOfMakeUsedFuelTypeName FROM Makes INNER JOIN VehicleDetails ON 
Makes.MakeID= VehicleDetails.MakeID INNER JOIN FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID GROUP BY Make HAVING COUNT(*)  > 20000



WITH R AS 
(
	SELECT Makes.Make,COUNT(*) AS NumberOfMakeUsedFuelTypeName FROM Makes 
	INNER JOIN VehicleDetails ON Makes.MakeID= VehicleDetails.MakeID INNER JOIN FuelTypes 
	ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID GROUP BY Make 
)	
SELECT * FROM R WHERE  NumberOfMakeUsedFuelTypeName  > 20000 ORDER BY NumberOfMakeUsedFuelTypeName DESC




SELECT * FROM VehicleDetails INNER JOIN FuelTypes ON FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID WHERE FuelTypes.FuelTypeName = 'GAS'


SELECT Makes.Make, FuelTypeName,COUNT(*) AS NumberOfMakeUsedFuel FROM Makes INNER JOIN VehicleDetails ON Makes.MakeID = VehicleDetails .MakeID  INNER JOIN FuelTypes ON FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
GROUP BY Make,FuelTypeName HAVING FuelTypes.FuelTypeName = 'GAS'



SELECT COUNT(*) AS TotalMakesUsedGas FROM VehicleDetails INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID INNER JOIN 
FuelTypes ON FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID WHERE FuelTypes.FuelTypeName = 'GAS'



SELECT * FROM VehicleDetails WHERE Year BETWEEN 1900 AND 2000 AND (SELECT * FROM dbo.GetAllMakeCountByMakeID(VehicleDetails.MakeID)) > 1000

SELECT * FROM  Makes WHERE Makes.Make LIKE 'B_N%'



WITH Numbers AS 
(
	SELECT 1 AS Number 
	UNION ALL 
	SELECT Number +  1 FROM Numbers WHERE Number < 10

)
SELECT * FROM Numbers


DECLARE @StartDate DATE = '2002-1-1';
DECLARE @EndtDate DATE = '2002-1-30';

WITH DateSeries AS 
(
	SELECT @StartDate AS DateValue

	UNION ALL 
	SELECT DATEADD(DAY,1,DateValue) FROM DateSeries
	WHERE DateValue < @EndtDate
)
SELECT * FROM  DateSeries 



DECLARE @B INT =9
DECLARE @A INT =41
IF @A>@B
	BEGIN
		DECLARE @M INT =40
		IF @A<@M
			BEGIN
				PRINT 'M > A'
			END
		ELSE
			BEGIN	
				PRINT 'M < A'
			END
	END
ELSE
	BEGIN	
		PRINT 'B'
	END



IF EXISTS(SELECT *FROM Makes WHERE  Makes.MakeID = 9)
	BEGIN
		SELECT * FROM Makes
	END


WITH G AS
(
	SELECT MakeID ,CASE
		WHEN MakeID > 21 THEN 'MAKEID > 21'
		WHEN MakeID < 21 THEN 'MAKEID < 21'
		ELSE 'NULL'
		END AS 'MakeIDRank'
	FROM VehicleDetails INNER JOIN FuelTypes ON FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID WHERE FuelTypes.FuelTypeName = 'GAS' 
) 
SELECT * FROM G
GROUP BY MakeIDRank,MakeID 
ORDER BY MakeIDRank DESC


DECLARE @D INT = 1
WHILE @D < 10
	BEGIN
		PRINT 'D = ' + CAST(@D AS NVARCHAR) 
		SET @D = @D + 1
	END


DECLARE @M INT 
DECLARE @X INT 

SELECT  @M =  MIN(MakeID)  FROM Makes 
SELECT  @X =  MAX(MakeID) FROM Makes 
WHILE @M < @X
	BEGIN
		SELECT MakeID, Make FROM Makes 
		SELECT @M =  MIN(MakeID) FROM Makes WHERE @M < ((SELECT MIN(MakeID) FROM Makes ) )

	END


SELECT Make ,SUM(NumDoors) AS NumberDoors FROM Makes INNER JOIN VehicleDetails ON VehicleDetails.MakeID = Makes.MakeID 
GROUP BY Make




SELECT Make ,SUM(NumDoors) AS NumberDoors FROM Makes INNER JOIN VehicleDetails ON VehicleDetails.MakeID = Makes.MakeID WHERE  Make = 'Ford'
GROUP BY Make


SELECT Make ,COUNT(*) AS NumberModelPerMake FROM Makes INNER JOIN VehicleDetails ON VehicleDetails.MakeID = Makes.MakeID 
GROUP BY Make,ModelID




SELECT Make ,COUNT(*) AS NumberModelPerMake FROM Makes INNER JOIN MakeModels ON MakeModels.MakeID = Makes.MakeID 
GROUP BY Make


SELECT Make ,COUNT(*) AS NumberModelPerMake FROM Makes INNER JOIN MakeModels ON MakeModels.MakeID = Makes.MakeID 
GROUP BY Make
HAVING COUNT(*) =
(
	SELECT MAX(NumberModelPerMake) AS MAXNUMBER FROM
	(
		SELECT  Make ,COUNT(*) AS NumberModelPerMake FROM Makes INNER JOIN MakeModels ON MakeModels.MakeID = Makes.MakeID 
		GROUP BY Make
	)
	R
)



SELECT Make ,COUNT(*) AS NumberModelPerMake FROM Makes INNER JOIN MakeModels ON MakeModels.MakeID = Makes.MakeID 
GROUP BY Make
HAVING COUNT(*) =
(
	SELECT MIN(NumberModelPerMake) AS MAXNUMBER FROM
	(
		SELECT  Make ,COUNT(*) AS NumberModelPerMake FROM Makes INNER JOIN MakeModels ON MakeModels.MakeID = Makes.MakeID 
		GROUP BY Make
	)
	R
)


SELECT MAX(NumberModelPerMake) AS MAXNUMBER FROM
(
	SELECT  Make ,COUNT(*) AS NumberModelPerMake FROM Makes INNER JOIN MakeModels ON MakeModels.MakeID = Makes.MakeID 
	GROUP BY Make
)
R



SELECT * FROM MakeModels 
ORDER BY NEWID()















