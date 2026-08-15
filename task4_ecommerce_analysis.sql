-- TASK 4: SQL FOR DATA ANALYSIS

-- 1. SELECT
SELECT * FROM Products;

-- 2. WHERE
SELECT *
FROM Products
WHERE price > 5000;

-- 3. ORDER BY
SELECT *
FROM Products
ORDER BY price DESC;

-- 4. SUM
SELECT SUM(price) AS total_product_price
FROM Products;

-- 5. AVG
SELECT AVG(price) AS average_product_price
FROM Products;

-- 6. GROUP BY
SELECT category, COUNT(*) AS product_count
FROM Products
GROUP BY category;

-- 7. INNER JOIN
SELECT 
    Customers.customer_name,
    Products.product_name,
    Orders.quantity,
    Orders.order_date
FROM Orders
INNER JOIN Customers
ON Orders.customer_id = Customers.customer_id
INNER JOIN Products
ON Orders.product_id = Products.product_id;

-- 8. LEFT JOIN
SELECT 
    Customers.customer_name,
    Orders.order_id
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- 9. SUBQUERY
SELECT product_name, price
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
);

-- 10. TOTAL REVENUE
SELECT 
    SUM(Products.price * Orders.quantity) AS total_revenue
FROM Orders
JOIN Products
ON Orders.product_id = Products.product_id;

-- 11. CUSTOMER-WISE REVENUE
SELECT 
    Customers.customer_name,
    SUM(Products.price * Orders.quantity) AS revenue
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
JOIN Products
ON Orders.product_id = Products.product_id
GROUP BY Customers.customer_name;

-- 12. VIEW
CREATE VIEW Customer_Revenue AS
SELECT 
    Customers.customer_name,
    SUM(Products.price * Orders.quantity) AS revenue
FROM Orders
JOIN Customers
ON Orders.customer_id = Customers.customer_id
JOIN Products
ON Orders.product_id = Products.product_id
GROUP BY Customers.customer_name;

-- 13. INDEXES
CREATE INDEX IF NOT EXISTS idx_customer_id
ON Orders(customer_id);

CREATE INDEX IF NOT EXISTS idx_product_id
ON Orders(product_id);