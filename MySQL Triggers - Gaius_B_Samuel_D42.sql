CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (id, name, subject, experience, salary) 
VALUES 
(1, 'Alice', 'Math', 5, 50000),
(2, 'Bob', 'Science', 12, 60000),
(3, 'Charlie', 'English', 7, 45000),
(4, 'Diana', 'History', 15, 70000),
(5, 'Eve', 'Physics', 3, 40000),
(6, 'Frank', 'Chemistry', 8, 55000),
(7, 'Grace', 'Biology', 11, 48000),
(8, 'Hank', 'Art', 9, 52000);

CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER //
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with experience greater than 10 years';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END //
DELIMITER ;

INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (9, 'Ivy', 'Philosophy', 4, -5000);

INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (9, 'Ivy', 'Philosophy', 4, 30000);

SELECT * FROM teacher_log; 

DELETE FROM teachers WHERE id = 4;

DELETE FROM teachers WHERE id = 5;

SELECT * FROM teacher_log;
