ALTER TABLE Persons 
ADD DOB DATE;
DELIMITER //

CREATE FUNCTION Calculate_Age(dob DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END //

DELIMITER ;

SELECT Id, Fname, Lname, DOB, Calculate_Age(DOB) AS Age 
FROM Persons;

SELECT Country_name, LENGTH(Country_name) AS Name_Length 
FROM Country;

SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Chars 
FROM Country;

SELECT Country_name, UPPER(Country_name) AS Uppercase_Name, LOWER(Country_name) AS Lowercase_Name 
FROM Country;
