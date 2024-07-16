

-- Assuming the Students table is already created
-- Table for logging new student entries


CREATE TABLE StudentInsertLog (
    LogID INT IDENTITY PRIMARY KEY,
    StudentID INT,
    Name NVARCHAR(50),
    Subject NVARCHAR(50),
    Grade INT,
    InsertedDateTime DATETIME DEFAULT GETDATE()
);


-- Table for logging grade updates
CREATE TABLE StudentUpdateLog (
    LogID INT IDENTITY PRIMARY KEY,
    StudentID INT,
    OldGrade INT,
    NewGrade INT,
    UpdatedDateTime DATETIME DEFAULT GETDATE()
);



CREATE TRIGGER trg_AfterInsertStudent ON Students
AFTER INSERT
AS
BEGIN
    INSERT INTO StudentInsertLog(StudentID, Name, Subject, Grade)
    SELECT StudentID, Name, Subject, Grade FROM inserted;
END;

-- Inserting a new student
INSERT INTO Students (StudentID, Name, Subject, Grade)
VALUES (1, 'John Doe', 'Mathematics', 85);
-- Checking the log table
SELECT * FROM StudentInsertLog;

SELECT * FROM Students 

CREATE TRIGGER trg_AfterUpdateStudent ON Students
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Grade)
    BEGIN
        INSERT INTO StudentUpdateLog(StudentID, OldGrade, NewGrade)
        SELECT i.StudentID, d.Grade AS OldGrade, i.Grade AS NewGrade
        FROM inserted i
        INNER JOIN deleted d ON i.StudentID = d.StudentID;
    END
END;
-- Updating the grade of a student
UPDATE Students
SET Grade = 90
WHERE StudentID = 1;

-- Checking the log table
SELECT * FROM StudentUpdateLog;

CREATE TABLE PersonalInfo (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Address NVARCHAR(255)
);

CREATE TABLE AcademicInfo (
    StudentID INT PRIMARY KEY,
    Course NVARCHAR(100),
    Grade INT,
    FOREIGN KEY (StudentID) REFERENCES PersonalInfo(StudentID)
);




CREATE VIEW StudentView AS
SELECT P.StudentID, P.Name, P.Address, A.Course, A.Grade
FROM PersonalInfo P
JOIN AcademicInfo A ON P.StudentID = A.StudentID;




CREATE TRIGGER trg_InsertStudentView ON StudentView
INSTEAD OF INSERT
AS
BEGIN
    -- Insert into PersonalInfo
    INSERT INTO PersonalInfo (StudentID, Name, Address)
    SELECT StudentID, Name, Address FROM inserted;


    -- Insert into AcademicInfo
    INSERT INTO AcademicInfo (StudentID, Course, Grade)
    SELECT StudentID, Course, Grade FROM inserted;
END;


INSERT INTO StudentView (StudentID, Name, Address, Course, Grade)
VALUES (3, 'Alice Johnson', '789 Pine Rd', 'Physics', 88);


SELECT * FROM PersonalInfo WHERE StudentID = 3;
SELECT * FROM AcademicInfo WHERE StudentID = 3;





