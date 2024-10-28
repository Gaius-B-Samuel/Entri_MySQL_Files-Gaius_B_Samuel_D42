USE sales;

CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Age INT CHECK (Age >= 18),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL 
);

INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) 
VALUES 
(1, 'John', 'Thomas', '1985-06-12', 39, 'M', 'Finance', 40000),
(2, 'Kepha', 'Mathew', '1990-08-23', 34, 'F', 'HR', 30000),
(3, 'Abel', 'Johnson', '1979-02-15', 45, 'M', 'IT', 28000),
(4, 'Aaliya', 'Suresh', '1988-11-05', 35, 'F', 'IT', 26000),
(5, 'Asif', 'Muhammad', '1995-01-29', 29, 'M', 'Sales', 18000),
(6, 'Abhijith', 'Kiran', '1982-07-19', 42, 'F', 'Marketing', 35000),
(7, 'Shabnam', 'Shukoor', '1998-04-10', 26, 'M', 'IT', 15000),
(8, 'Sophia', 'Varghese', '1992-10-02', 32, 'F', 'Finance', 42000),
(9, 'Joel', 'Paul', '1980-05-30', 44, 'M', 'HR', 33000),
(10, 'Preethi', 'Michael', '1993-12-11', 30, 'F', 'Sales', 19000);

SELECT First_name, Last_Name, DOB FROM Managers WHERE Manager_Id = 1;

SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income FROM Managers;

SELECT * FROM Managers WHERE First_name != 'Aaliya';

SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;

SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;





