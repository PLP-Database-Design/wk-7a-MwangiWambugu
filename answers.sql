SELECT 
    OrderID,
    CustomerName,
    LTRIM(RTRIM(value)) AS Product
FROM 
    productDetails
CROSS APPLY STRING_SPLIT(Products, ',');



CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

ALTER TABLE OrderDetails
DROP COLUMN CustomerName;

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_order_orderdetails
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);
