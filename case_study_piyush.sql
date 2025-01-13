create database Piyush;
use Piyush;

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    StockLevel INT NOT NULL,
    ReorderPoint INT NOT NULL
);

CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(255)
);



CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    CustomerName VARCHAR(100),
    Status VARCHAR(50)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

CREATE TABLE Shipments (
    ShipmentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ShipmentStatus VARCHAR(50),
    EstimatedDeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE
);


INSERT INTO Products (ProductName, Category, StockLevel, ReorderPoint)
VALUES ('Laptop', 'Electronics', 50, 10),
       ('Mobile Phone', 'Electronics', 100, 20),
       ('Headphones', 'Accessories', 200, 30);

INSERT INTO Suppliers (SupplierName, ContactInfo)
VALUES ('Tech Distributors', 'tech@distributors.com'),
       ('Gadget Suppliers', 'gadget@suppliers.com');

INSERT INTO Orders (CustomerName, Status)
VALUES ('John Doe', 'Processing'),
       ('Jane Smith', 'Shipped');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES (1, 1, 2),
       (1, 3, 1),
       (2, 2, 3);

INSERT INTO Shipments (OrderID, ShipmentStatus, EstimatedDeliveryDate)
VALUES (1, 'In Transit', '2025-01-15'),
       (2, 'Delivered', '2025-01-10');



SELECT ProductName, StockLevel, ReorderPoint
FROM Products
WHERE StockLevel <= ReorderPoint;

SELECT o.OrderID, o.CustomerName, s.ShipmentStatus, s.EstimatedDeliveryDate
FROM Orders o
JOIN Shipments s ON o.OrderID = s.OrderID;


SELECT o.CustomerName, p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.CustomerName, p.ProductName;


SELECT o.OrderID, o.CustomerName, o.Status
FROM Orders o
LEFT JOIN Shipments s ON o.OrderID = s.OrderID
WHERE s.ShipmentID IS NULL;


SELECT DATE(o.OrderDate) AS OrderDate, 
       SUM(od.Quantity) AS TotalItemsSold,
       COUNT(DISTINCT o.OrderID) AS TotalOrders
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY DATE(o.OrderDate);
