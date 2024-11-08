CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50) NOT NULL,
    Population INT,
    Area DECIMAL(10, 2)
);

INSERT INTO Country (Id, Country_name, Population, Area) 
VALUES 
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'India', 1380000000, 3287263),
(4, 'UK', 67000000, 243610),
(5, 'Australia', 25600000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Japan', 125800000, 377975),
(9, 'Brazil', 212600000, 8515767),
(10, 'China', 1441000000, 9596961);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) 
VALUES 
(1, 'Asif', 'Muhammad', 10000, 4.2, 1, 'USA'),
(2, 'Abel', 'Chacko', 5000, 3.8, 2, 'Canada'),
(3, 'Lilly', 'Mathew', 7000, 4.5, 3, 'India'),
(4, 'Emy', 'Williams', 6000, 4.6, 4, 'UK'),
(5, 'Sophia', 'Nathan', 4000, 4.9, 1, 'USA'),
(6, 'Noah', 'Jones', 8000, 3.7, 5, 'Australia'),
(7, 'Issac', 'Garcia', 6500, 4.3, NULL, NULL),
(8, 'Martin', 'Martinez', 7500, 4.0, 6, 'Germany'),
(9, 'Stephin', 'Miller', 9000, 4.7, 7, 'France'),
(10, 'Mia', 'Davis', 5500, 3.9, 8, 'Japan');

SELECT LEFT(Country_name, 3) AS Country_Abbreviation 
FROM Country;
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name 
FROM Persons;
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries 
FROM Persons;
SELECT MAX(Population) AS Max_Population 
FROM Country;
SELECT MIN(Population) AS Min_Population 
FROM Persons;
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) 
VALUES 
(11, 'Lily', NULL, 3500, 4.4, 1, 'USA'),
(12, 'James', NULL, 3700, 3.6, 2, 'Canada');

SELECT COUNT(Lname) AS Count_Lname FROM Persons;

SELECT COUNT(*) AS Total_Rows FROM Persons;

SELECT Population FROM Country LIMIT 3;

SELECT * FROM Country ORDER BY RAND() LIMIT 3;

SELECT * FROM Persons ORDER BY Rating DESC;

SELECT Country_name, SUM(Population) AS Total_Population FROM Persons GROUP BY Country_name;

SELECT Country_name, SUM(Population) AS Total_Population FROM Persons GROUP BY Country_name HAVING SUM(Population) > 50000;

SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating FROM Persons GROUP BY Country_name 
HAVING COUNT(*) > 2 ORDER BY Avg_Rating ASC;

