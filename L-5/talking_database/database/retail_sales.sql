-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS retail_sales_db;

-- Switch to the retail_sales database
USE retail_sales_db;

-- Create the sales table
CREATE TABLE IF NOT EXISTS sales_tb (
    TransactionID INT,
    Date DATE,
    CustomerID VARCHAR(10),
    Gender VARCHAR(10),
    Age INT,
    ProductCategory VARCHAR(50),
    Quantity INT,
    PriceperUnit DECIMAL(10,2),
    TotalAmount DECIMAL(10,2)
);

-- Insert data into the sales table
INSERT INTO sales_tb (TransactionID, Date, CustomerID, Gender, Age, ProductCategory, Quantity, PriceperUnit, TotalAmount)
VALUES
(1, '2023-11-24', 'CUST001', 'Male', 34, 'Beauty', 3, 50, 150),
(2, '2023-02-27', 'CUST002', 'Female', 26, 'Clothing', 2, 500, 1000),
(3, '2023-01-13', 'CUST003', 'Male', 50, 'Electronics', 1, 30, 30),
(4, '2023-05-21', 'CUST004', 'Male', 37, 'Clothing', 1, 500, 500),
(5, '2023-05-06', 'CUST005', 'Male', 30, 'Beauty', 2, 50, 100),
(6, '2023-04-25', 'CUST006', 'Female', 45, 'Beauty', 1, 30, 30),
(7, '2023-03-13', 'CUST007', 'Male', 46, 'Clothing', 2, 25, 50),
(8, '2023-02-22', 'CUST008', 'Male', 30, 'Electronics', 4, 25, 100),
(9, '2023-12-13', 'CUST009', 'Male', 63, 'Electronics', 2, 300, 600),
(10, '2023-10-07', 'CUST010', 'Female', 52, 'Clothing', 4, 50, 200),
(11, '2023-02-14', 'CUST011', 'Male', 23, 'Clothing', 2, 50, 100),
(12, '2023-10-30', 'CUST012', 'Male', 35, 'Beauty', 3, 25, 75),
(13, '2023-08-05', 'CUST013', 'Male', 22, 'Electronics', 3, 500, 1500),
(14, '2023-01-17', 'CUST014', 'Male', 64, 'Clothing', 4, 30, 120),
(15, '2023-01-16', 'CUST015', 'Female', 42, 'Electronics', 4, 500, 2000),
(16, '2023-02-17', 'CUST016', 'Male', 19, 'Clothing', 3, 500, 1500),
(17, '2023-04-22', 'CUST017', 'Female', 27, 'Clothing', 4, 25, 100),
(18, '2023-04-30', 'CUST018', 'Female', 47, 'Electronics', 2, 25, 50),
(19, '2023-09-16', 'CUST019', 'Female', 62, 'Clothing', 2, 25, 50),
(20, '2023-11-05', 'CUST020', 'Male', 22, 'Clothing', 3, 300, 900),
(21, '2023-01-14', 'CUST021', 'Female', 50, 'Beauty', 1, 500, 500),
(22, '2023-10-15', 'CUST022', 'Male', 18, 'Clothing', 2, 50, 100),
(23, '2023-04-12', 'CUST023', 'Female', 35, 'Clothing', 4, 30, 120),
(24, '2023-11-29', 'CUST024', 'Female', 49, 'Clothing', 1, 300, 300),
(25, '2023-12-26', 'CUST025', 'Female', 64, 'Beauty', 1, 50, 50),
(26, '2023-10-07', 'CUST026', 'Female', 28, 'Electronics', 2, 500, 1000),
(27, '2023-08-03', 'CUST027', 'Female', 38, 'Beauty', 2, 25, 50),
(28, '2023-04-23', 'CUST028', 'Female', 43, 'Beauty', 1, 500, 500),
(29, '2023-08-18', 'CUST029', 'Female', 42, 'Electronics', 1, 30, 30);