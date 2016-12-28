================================================================================================================================================
--1.Get all customers and their addresses.
SELECT first_name,last_name, street, city, state, zip, address_type
FROM customers
INNER JOIN addresses
ON customers.id = addresses.customer_id;

--2.Get all orders and their line items.
SELECT order_date, total, unit_price, quantity
FROM orders
INNER JOIN line_items
ON orders.id = line_items.order_id;

--3.Which warehouses have cheetos?
SELECT warehouse
FROM warehouse
JOIN warehouse_product ON warehouse.id= warehouse_product.warehouse_id
JOIN products ON products.id = warehouse_product.product_id
WHERE description='cheetos';

--4.Which warehouses have diet pepsi?
SELECT warehouse
FROM warehouse
JOIN warehouse_product
ON warehouse.id= warehouse_product.warehouse_id
JOIN products
ON products.id = warehouse_product.product_id
WHERE description='diet pepsi';

--5.Get the number of orders for each customer.
--NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, COUNT (orders.id)
AS "Number Of Orders"
FROM customers
JOIN addresses
ON customers.id = addresses.customer_id
JOIN orders
ON addresses.id = orders.address_id
GROUP BY first_name, last_name;

--6.How many customers do we have?
SELECT COUNT(*)
AS "Number of Customers"
FROM customers;

--7.How many products do we carry?
SELECT COUNT(*)
AS "Number of Products"
FROM products;


--8.What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand)
AS "Total Available on-hand Quantity"
FROM  warehouse_product
JOIN products
ON warehouse_product.product_id = products.id
WHERE description='diet pepsi';
