-- select * from products;

-- Total quantity order vs quantity currently in stock of an order
-- https://stackoverflow.com/questions/2360396/how-can-i-merge-the-columns-from-two-tables-into-one-output
-- https://learnsql.com/cookbook/how-to-create-a-table-from-an-sql-query/



-- 1. Where are items stored and if they were rearranged, could a warehouse be eliminated?
-- The total quantity of items in each warehouse:
SELECT 
    warehouseCode, 
    SUM(quantityInStock) AS totalQuantity
FROM 
    products
GROUP BY 
    warehouseCode;
    
-- 2. How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?
-- the total quantity sold and current quantity in stock for each product:
SELECT
	od.productCode, 
    p.productName, 
    p.quantityInStock,
    sum(od.quantityOrdered) as totalQuantOrder
FROM 
	orderdetails od, 
    products p
WHERE 
	od.productCode = p.productCode
group by 
	p.productCode;

-- 3. Are we storing items that are not moving? Are any items candidates for being dropped from the product line?
DROP TABLE IF EXISTS NotShippedOrders;
CREATE TABLE IF NOT EXISTS NotShippedOrders 
AS 
SELECT 
    n.productCode,
    n.productName,
    n.totalOrderNotShipped_AllReason,
    c.totalOrderCancelled
FROM 
    (
    SELECT
        od.productCode,
        p.productName,
        SUM(od.quantityOrdered) AS totalOrderNotShipped_AllReason 
    FROM
        orders o, 
        orderdetails od,
        products p
    WHERE 
        LOWER(o.status) NOT LIKE "shipped" 
        AND o.orderNumber = od.orderNumber
        AND od.productCode = p.productCode
    GROUP BY
        od.productCode
    ) n
JOIN
    (
    SELECT 
        od.productCode,
        p.productName,
        SUM(od.quantityOrdered) AS totalOrderCancelled
    FROM 
        orders o, 
        orderdetails od,
        products p
    WHERE 
        LOWER(o.status) LIKE "cancelled" 
        AND o.orderNumber = od.orderNumber
        AND od.productCode = p.productCode
    GROUP BY
        od.productCode
    ) c
ON n.productCode = c.productCode
ORDER BY totalOrderNotShipped_AllReason DESC;

SELECT * FROM NotShippedOrders;

-- DEBUG FOR ABOVE CODE
/*select * 
FROM
	orders o, 
    orderdetails od 
WHERE 
	lower(o.status) not like "shipped" 
    and o.orderNumber = od.orderNumber;*/
    
 -- NOT WHAT IM LOOKING FOR   
/*SELECT 
    p.productCode, 
    p.productName, 
    MAX(o.orderDate) AS latestOrderDate,
    MIN(o.orderDate) AS firstOrderDate
FROM 
    products p
JOIN 
    orderdetails od ON p.productCode = od.productCode
JOIN 
    orders o ON od.orderNumber = o.orderNumber
GROUP BY 
    p.productCode, p.productName; */
    

