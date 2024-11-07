CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50) NOT NULL,
    Population INT,
    Area DECIMAL(10, 2)
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

INSERT INTO Country (Id, Country_name, Population, Area) 
VALUES 
(1, 'USA', 331004578, 9833520),
(2, 'Canada', 38001578, 9984670),
(3, 'India', 1380000496, 3287263),
(4, 'UK', 67004576, 243610),
(5, 'Australia', 25600034, 7692024),
(6, 'Germany', 83007945, 357022),
(7, 'France', 67000427, 551695),
(8, 'Japan', 125807640, 377975),
(9, 'Brazil', 212698500, 8515767),
(10, 'China', 1441004250, 9596961);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) 
VALUES 
(1, 'John', 'Doe', 10000, 4.2, 1, 'USA'),
(2, 'Ava', 'Smith', 5000, 3.8, 2, 'Canada'),
(3, 'Liam', 'Johnson', 7000, 4.5, 3, 'India'),
(4, 'Emma', 'Williams', 6000, 4.6, 4, 'UK'),
(5, 'Sophia', 'Brown', 4000, 4.9, 1, 'USA'),
(6, 'Noah', 'Jones', 8000, 3.7, 5, 'Australia'),
(7, 'Isabella', 'Garcia', 6500, 4.3, NULL, NULL),
(8, 'Oliver', 'Martinez', 7500, 4.0, 6, 'Germany'),
(9, 'Elijah', 'Miller', 9000, 4.7, 7, 'France'),
(10, 'Mia', 'Davis', 5500, 3.9, 8, 'Japan');

SELECT DISTINCT Country_name FROM Persons;
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;
SELECT * FROM Persons WHERE Rating > 4.0;
SELECT * FROM Country WHERE Population > 1000000;
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;
SELECT * FROM Persons WHERE Country_name IS NULL;
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';
