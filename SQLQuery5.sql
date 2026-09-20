USE Ecommerce_SQL_Analysis;
GO

-- =====================================================
-- TASK 4: SQL FOR DATA ANALYSIS
-- E-COMMERCE DATABASE
-- =====================================================


-- =====================================================
-- 1. SELECT, WHERE AND ORDER BY
-- =====================================================

SELECT
    CustomerName,
    City,
    Age,
    CustomerSegment
FROM Customers
WHERE Age > 30
ORDER BY Age DESC;


-- =====================================================
-- 2. GROUP BY, SUM, AVG AND COUNT
-- =====================================================

SELECT
    p.Category,
    COUNT(o.OrderID) AS NumberOfOrders,
    SUM(p.UnitPrice * o.Quantity * (1 - o.Discount)) AS TotalRevenue,
    AVG(p.UnitPrice * o.Quantity * (1 - o.Discount)) AS AverageOrderValue
FROM Orders o
INNER JOIN Products p
    ON o.ProductID = p.ProductID
WHERE o.Status = 'Completed'
GROUP BY p.Category
ORDER BY TotalRevenue DESC;


-- =====================================================
-- 3. INNER JOIN
-- =====================================================

SELECT
    o.OrderID,
    c.CustomerName,
    c.City,
    p.ProductName,
    p.Category,
    o.Quantity,
    o.Status
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
ORDER BY o.OrderID;


-- =====================================================
-- 4. LEFT JOIN
-- =====================================================

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.Status
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;


-- =====================================================
-- 5. RIGHT JOIN
-- =====================================================

SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.Status
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID
ORDER BY o.OrderID;


-- =====================================================
-- 6. SUBQUERY
-- Products priced above average
-- =====================================================

SELECT
    ProductID,
    ProductName,
    Category,
    UnitPrice
FROM Products
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM Products
)
ORDER BY UnitPrice DESC;


-- =====================================================
-- 7. VIEW
-- Customer Sales Analysis
-- =====================================================

CREATE VIEW CustomerSalesAnalysis AS
SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    c.CustomerSegment,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(p.UnitPrice * o.Quantity * (1 - o.Discount)) AS TotalSpent,
    AVG(p.UnitPrice * o.Quantity * (1 - o.Discount)) AS AverageOrderValue
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
WHERE o.Status = 'Completed'
GROUP BY
    c.CustomerID,
    c.CustomerName,
    c.City,
    c.CustomerSegment;
GO


-- Query the view
SELECT *
FROM CustomerSalesAnalysis
ORDER BY TotalSpent DESC;


-- =====================================================
-- 8. INDEX
-- =====================================================

CREATE INDEX IX_Orders_CustomerID
ON Orders(CustomerID);


-- =====================================================
-- 9. NULL HANDLING
-- =====================================================

SELECT
    CustomerID,
    CustomerName,
    ISNULL(City, 'Unknown') AS City
FROM Customers
WHERE City IS NULL;


-- =====================================================
-- 10. CUSTOMER SEGMENT ANALYSIS
-- =====================================================

SELECT
    c.CustomerSegment,
    COUNT(DISTINCT c.CustomerID) AS NumberOfCustomers,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(p.UnitPrice * o.Quantity * (1 - o.Discount)) AS TotalRevenue,
    AVG(p.UnitPrice * o.Quantity * (1 - o.Discount)) AS AverageOrderValue
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID
WHERE o.Status = 'Completed'
GROUP BY c.CustomerSegment
ORDER BY TotalRevenue DESC;