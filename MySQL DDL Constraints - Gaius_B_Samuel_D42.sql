CREATE DATABASE Sales;
USE Sales;

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,              
    Customer_name VARCHAR(100) NOT NULL,   
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE         
);

ALTER TABLE Orders 
ADD order_quantity INT NOT NULL;

RENAME TABLE Orders to sales_orders;

INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) 
VALUES 
(1, 'Abel', 'Electronics', 'Smartphone', '1234567890', 2),
(2, 'Ashwell', 'Clothing', 'T-Shirt', '0987654321', 5),
(3, 'Dencil', 'Electronics', 'Laptop', '1122334455', 1),
(4, 'Feba', 'Groceries', 'Rice', '2233445566', 10),
(5, 'Abhijith', 'Furniture', 'Chair', '3344556677', 4),
(6, 'Asif', 'Electronics', 'Laptop', '4455667788', 1),
(7, 'Keziya', 'Clothing', 'Jacket', '5566778899', 3),
(8, 'Thomas', 'Electronics', 'Tablet', '6677889900', 2),
(9, 'Irene', 'Groceries', 'Sugar', '7788990011', 6),
(10, 'Preethi', 'Furniture', 'Table', '8899001122', 1);

SELECT Customer_name, Ordered_item FROM sales_orders;

SET SQL_SAFE_UPDATES = 0;

UPDATE sales_orders 
SET Ordered_item = 'Tablet' WHERE Ordered_item = 'Smartphone';

SET SQL_SAFE_UPDATES = 1;

DROP TABLE sales_orders;
