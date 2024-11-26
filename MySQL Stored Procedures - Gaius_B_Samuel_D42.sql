CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25) NOT NULL,
    LastName CHAR(25) NOT NULL,
    Salary INT NOT NULL,
    JoiningDate DATETIME NOT NULL,
    Department CHAR(25) NOT NULL
);

INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES
(2, 'Will', 'Smith', 60000, '2021-12-10', 'Finance'),
(3, 'Alice', 'Thomas', 70000, '2020-03-25', 'IT'),
(4, 'Babu', 'Johnson', 55000, '2019-11-01', 'Marketing'),
(5, 'Chandy', 'Davis', 65000, '2023-05-18', 'HR');


DELIMITER //
CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //
DELIMITER ;

CALL AddWorker(1, 'John', 'Doe', 50000, '2022-01-15', 'HR');

DELIMITER //
CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END //
DELIMITER ;

CALL GetWorkerSalary(1, @salary);
SELECT @salary AS Salary;

DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //
DELIMITER ;

CALL UpdateWorkerDepartment(1, 'Finance');

DELIMITER //
CREATE PROCEDURE CountWorkersInDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END //
DELIMITER ;

CALL CountWorkersInDepartment('HR', @workerCount);
SELECT @workerCount AS WorkerCount;

DELIMITER //
CREATE PROCEDURE GetAverageSalaryInDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END //
DELIMITER ;

CALL GetAverageSalaryInDepartment('HR', @avgSalary);
SELECT @avgSalary AS AverageSalary;

