DROP DATABASE BankDB;
CREATE DATABASE BankDB;
USE BankDB;

CREATE TABLE Cust_Details (
Acc_No INT(4) PRIMARY KEY,
Acc_Type VARCHAR(7) NOT NULL,
Name VARCHAR(15) NOT NULL,
Address VARCHAR(20) NOT NULL,
Balance INT NOT NULL
);

ALTER TABLE Cust_Details ADD CONSTRAINT
Acc_Type CHECK ( Acc_Type = "saving" OR Acc_Type = "current" );

ALTER TABLE Cust_Details ADD CONSTRAINT
Balance CHECK ( ( Balance >= 1000 AND Acc_Type = "saving" ) OR Acc_Type = "current" );

INSERT INTO Cust_Details VALUES
( 1001, "saving", "hari", "kasaragod", 10000 ),
( 1002, "saving", "sam", "kannur", 20000 ),
( 1003, "saving", "sree", "calicut", 30000 ),
( 2001, "current", "ali", "kannur", 10000 ),
( 2002, "current", "john", "kasaragod", 20000 );

DELIMITER //
CREATE PROCEDURE credit( IN AccNo INT(4), IN Amount INT )
BEGIN
IF ( NOT EXISTS ( SELECT Name FROM Cust_Details WHERE Acc_No = AccNo ) ) THEN
SELECT "Invalid Account Number" AS Message;
ELSE
UPDATE Cust_Details SET Balance = ( Balance + Amount ) WHERE Acc_No = AccNo;
END IF;
END //
DELIMITER ;

DESCRIBE Cust_Details;

--DELIMITER //
--CREATE PROCEDURE debit( IN AccNo INT(4), IN Amount INT )
--BEGIN
--IF ( NOT EXIST ( SELECT * FROM Cust_Details WHERE Acc_No = AccNo ) ) THEN
--SELECT "Invalid Account Number" AS "";
--ELSE
--UPDATE TABLE Cust_Details SET Balance = ( Balance + Amount ) WHERE Acc_No = AccNo;
--END IF;
--END //
--DELIMITER ;

DELIMITER //
CREATE FUNCTION getBalance( AccNo INT( 4 ) ) RETURNS INT DETERMINISTIC
BEGIN
DECLARE Bal INT;
SELECT Balance INTO Bal FROM Cust_Details WHERE Acc_No = AccNo;
RETURN Bal;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION getAccountType( AccNo INT(4) ) RETURNS VARCHAR(7) DETERMINISTIC
BEGIN
DECLARE AccType VARCHAR(7);
SELECT Acc_Type INTO AccType FROM Cust_Details WHERE Acc_No = AccNo;
RETURN AccType;
END //
DELIMITER ;

SELECT * FROM Cust_Details;

call credit(1001,2000);
call credit(1004,1000);
select getBalance(2001) as currentBalance;


