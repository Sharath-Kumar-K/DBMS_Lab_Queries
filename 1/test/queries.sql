DROP DATABASE StudentDB;

CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Student (
StudentNo INT(3) PRIMARY KEY,
StudentName VARCHAR(10) NOT NULL,
Maths INT NOT NULL,
Physics INT NOT NULL,
Chemistry INT NOT NULL,
CProgramming INT NOT NULL,
Department VARCHAR(5) NOT NULL,
Address VARCHAR(15) NOT NULL
);

INSERT INTO Student (StudentNo, StudentName, Maths, Physics, Chemistry, CProgramming, Department, Address)
VALUES
(100, "Hari", 50, 60, 45, 75, "CSE", "Kasaragod"),
(101, "Devi", 60, 55, 78, 40, "CSE", "Kasaragod"),
(102, "Sam", 45, 77, 88, 45, "IT", "Kannur"),
(103, "SreeHari", 90, 75, 77, 60, "IT", "Calicut"),
(104, "Rani", 91, 98, 89, 52, "ECE", "Kannur"),
(105, "Raj", 88, 77, 67, 48, "CSE", "Palakkad");

-- i.

SELECT StudentNo, StudentName FROM Student WHERE CProgramming < 50 ORDER BY CProgramming ASC;

-- ii.

SELECT StudentNo, StudentName FROM Student GROUP BY Department ORDER BY Department DESC AND ORDER BY StudentName ASC;

-- iii.


