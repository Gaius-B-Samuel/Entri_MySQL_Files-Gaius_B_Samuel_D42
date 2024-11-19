SELECT Country_Id, COUNT(*) AS Number_of_Persons FROM Persons GROUP BY Country_Id;

SELECT Country_Id, COUNT(*) AS Number_of_Persons FROM Persons
GROUP BY Country_Id ORDER BY Number_of_Persons DESC;

SELECT Country_Id, AVG(Rating) AS Average_Rating FROM Persons
GROUP BY Country_Id HAVING AVG(Rating) > 3.0;

SELECT Country_name FROM Country
WHERE Population = ( SELECT Population FROM Country WHERE Country_name = 'USA');

SELECT Country_name, Population FROM Country WHERE Population > (SELECT AVG(Population) FROM Country);

CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50));
    
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) 
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'Los Angeles', 'California', '90001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Elm St', 'New York', 'New York', '10001', 'USA');


CREATE VIEW customer_info AS SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email FROM Customer;

SELECT * FROM customer_info;

CREATE VIEW US_Customers AS SELECT * FROM Customer WHERE Country = 'USA';

CREATE VIEW Customer_details AS SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State FROM Customer;

SET SQL_SAFE_UPDATES = 0;

UPDATE Customer SET Phone_no = 'New_Phone_Number' WHERE State = 'California';

SET SQL_SAFE_UPDATES = 1;

SELECT State, COUNT(*) AS Number_of_Customers FROM Customer GROUP BY State HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS Number_of_Customers FROM Customer_details GROUP BY State;

SELECT * FROM Customer_details ORDER BY State ASC;

