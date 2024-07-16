
USE ToDoListAppDB


--CREATE TABLE Users
--(
--	USERID INT PRIMARY KEY IDENTITY(1,1),
--	FIRSTNAME NVARCHAR(20) NOT NULL,
--	LASTNAME NVARCHAR(20) NOT NULL,
--	USERPASSWORD NVARCHAR(20) NOT NULL,
--	IMAGEPASS NVARCHAR(20) 
--)

-----------------------------------------------------------------------------------------------------------------------

--CREATE TABLE Tasks
--(
--	TASKID INT PRIMARY KEY IDENTITY(1,1),
--	TITLE NVARCHAR(20) NOT NULL,
--	DATAVALUE NVARCHAR(20) NOT NULL,
--	USERID  INT NOT NULL,
--	CATEGORIZEID INT NOT NULL,
--	REPEATID INT NOT NULL,
--	LISTID  INT 
--)


---------------------------------------------------------------------------------------------------------------

--CREATE TABLE Lists
--(
--	LISTID INT PRIMARY KEY IDENTITY(1,1),
--	TITLE NVARCHAR(20) NOT NULL,
--	DATAVALUE NVARCHAR(20) NOT NULL,
--	USERID  INT NOT NULL
--)

-----------------------------------------------------------------------------------------------------------


--CREATE TABLE Steps
--(
--	STEPID INT PRIMARY KEY IDENTITY(1,1),
--	TITLE NVARCHAR(20) NOT NULL,
--	DATAVALUE NVARCHAR(20) NOT NULL,
--	TASKID INT  NOT NULL
--)

-----------------------------------------------------------------------------------------------------------

--CREATE TABLE  CATEGORIZE
--(
--	CATEGORIZEID INT PRIMARY KEY IDENTITY(1,1),
--	TITLE NVARCHAR(20) NOT NULL
--)


----------------------------------------------------------------------------------------------------------------


--CREATE TABLE  REPLAY
--(
--	REPLAYID INT PRIMARY KEY IDENTITY(1,1),
--	TITLE NVARCHAR(20) NOT NULL
--)


----------------------------------------------------------------------------------------------------------------

--ALTER TABLE  Tasks
--	ADD PriorityID NVARCHAR(50) NOT NULL


----------------------------------------------------------------------------------------------------------------


--CREATE TABLE  Priorities
--(
--	PriorityID INT PRIMARY KEY IDENTITY(1,1),
--	TITLE NVARCHAR(20) NOT NULL,
--)

------------------------------------------------------------------------------------------------------------------

--INSERT INTO Priorities
--	VALUES
--	('My Day'),
--	('Planned'),
--	('Important'),
--	('Normal'),
--	('Urgent')



----------------------------------------------------------------------------------------------------------------


--SELECT * FROM  Users


--SELECT * FROM Tasks


--SELECT * FROM  Lists


--SELECT * FROM Steps


--SELECT * FROM  CATEGORIZE


--SELECT * FROM  REPLAY


--SELECT * FROM Notes


--SELECT * FROM  Priorities




------------------------------------------------------------------------------------------------------------------------------------------





------------------------------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------------------------------------------------------


--ALTER TABLE Tasks
--	ADD  FOREIGN KEY(REPEATID) REFERENCES REPLAY




------------------------------------------------------------------------------------------------------------------------------------------


CREATE VIEW TasksData AS
SELECT Tasks.TASKID, Tasks.TITLE, Tasks.DATAVALUE, Priorities.TITLE AS Priority, CATEGORIZE.TITLE AS CATEGORIZE, REPLAY.TITLE AS REPLAY, 
Users.USERID ,Tasks.Checked,Tasks.Step,Tasks.Note,Tasks.FilePass
FROM   Tasks INNER JOIN
             Users ON Tasks.USERID = Users.USERID INNER JOIN
             REPLAY ON Tasks.REPEATID = REPLAY.REPLAYID AND Tasks.REPEATID = REPLAY.REPLAYID INNER JOIN
             Priorities ON Tasks.PriorityID = Priorities.PriorityID INNER JOIN
             CATEGORIZE ON Tasks.CATEGORIZEID = CATEGORIZE.CATEGORIZEID



CREATE VIEW TasksData AS
SELECT Tasks.TASKID, Tasks.TITLE, Tasks.DATAVALUE, Priorities.TITLE AS Priority, CATEGORIZE.TITLE AS CATEGORIZE, REPLAY.TITLE AS REPLAY, Tasks.Checked, Tasks.Step, Tasks.Note, Tasks.FilePass, Tasks.USERID
FROM   Tasks INNER JOIN
             REPLAY ON Tasks.REPEATID = REPLAY.REPLAYID AND Tasks.REPEATID = REPLAY.REPLAYID INNER JOIN
             Priorities ON Tasks.PriorityID = Priorities.PriorityID INNER JOIN
             CATEGORIZE ON Tasks.CATEGORIZEID = CATEGORIZE.CATEGORIZEID


--CREATE VIEW ListsData AS
--SELECT Lists.LISTID, Lists.TITLE, Lists.DATAVALUE, Lists.USERID
--FROM   Users INNER JOIN
--             Lists ON Users.USERID = Lists.USERID





SELECT * FROM ImportantTasks


SELECT * FROM NormalTasks


SELECT * FROM MyDayTasks


SELECT * FROM PlannedTasks


SELECT * FROM ListsData 


SELECT * FROM TasksData 


SELECT * FROM  StepsData 


SELECT * FROM   NotesData 


SELECT * FROM TasksData 


SELECT * FROM Notes



ALTER TABLE Notes
	ADD CONSTRAINT CH_TASKID  UNIQUE(TASKID)



SELECT * FROM Steps


ALTER TABLE Steps
	ADD CONSTRAINT CH_TASK  UNIQUE(TASKID)


DELETE FROM Notes WHERE NOTEID = 32


INSERT INTO Notes
	VALUES
	('Hi',82,'C:\Documents')





UPDATE Tasks
	SET Checked = 0;




	SELECT * FROM Tasks



SELECT * FROM  Priorities




UPDATE Priorities
	SET TITLE = 'MyDay'
	WHERE PriorityID = 5




	
UPDATE Tasks
	SET PriorityID = 2 WHERE PriorityID IS NULL

SELECT * FROM Tasks

