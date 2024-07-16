


USE VehicleMakesDB



SELECT TOP 3 Make , Count(*) As TotalModelINMake FROM Makes	INNER JOIN MakeModels ON Makes.MakeID = MakeModels.MakeID	
GROUP BY Make
ORDER BY TotalModelINMake DESC
















SELECT TOP 3 ModelName , COUNT(*) AS TotalModel FROM MakeModels INNER JOIN VehicleDetails ON MakeModels.ModelID = VehicleDetails.ModelID
GROUP BY ModelName
ORDER BY TotalModel  DESC

















