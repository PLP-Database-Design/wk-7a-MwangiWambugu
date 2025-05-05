-- Drop the database if it exists
DROP DATABASE IF EXISTS productdbs;
DROP DATABASE IF EXISTS productdb;

-- Create and select the new database
CREATE DATABASE productdbs;
USE productdbs;

-- Table to track each product ordered per order ID
CREATE TABLE productsDetails (
    orderID INT,
    customerName VARCHAR(100),
    product VARCHAR(100)
);

-- Insert sample data
INSERT INTO productsDetails (orderID, customerName, product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Monitor');

-- Table to track orders
CREATE TABLE Orders (
    orderID INT PRIMARY KEY,
    customerName VARCHAR(100)
);

-- Insert orders
INSERT INTO Orders (orderID, customerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Table to track products and quantities in each order
CREATE TABLE Products (
    orderID INT,
    productName VARCHAR(100),
    quantity INT,
    PRIMARY KEY (orderID, productName),
    FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);

-- Insert product data with quantities per order
INSERT INTO Products (orderID, productName, quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- View data
SELECT * FROM productsDetails;
-- SELECT * FROM productOrders;
-- SELECT * FROM Products;
