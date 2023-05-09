# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Customers_4
(
id int, 
name varchar(255)
);

Create table If Not Exists Orders_4
(
id int, 
customerId int
);

Truncate table Customers_4;

insert into Customers_4 (id, name) values ('1', 'Joe');
insert into Customers_4 (id, name) values ('2', 'Henry');
insert into Customers_4 (id, name) values ('3', 'Sam');
insert into Customers_4 (id, name) values ('4', 'Max');
Truncate table Orders_4;
insert into Orders_4 (id, customerId) values ('1', '3');
insert into Orders_4 (id, customerId) values ('2', '1');

/**
Q. Write an SQL query to report all customers who never order anything.
Example 1:
Input: 
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
**/


SELECT * FROM Customers_4;
SELECT * FROM orders_4;

##########################################################################################
# Type 1
SELECT name AS Customers
FROM Customers_4
WHERE id NOT IN (SELECT DISTINCT customerId FROM orders_4);
##########################################################################################
# Type 2
SELECT name AS Customers
FROM Customers_4
WHERE NOT EXISTS (SELECT customerId FROM Orders_4 WHERE customerId = Customers_4.id);
##########################################################################################
# Type 3  
SELECT c4.name AS Customers
FROM Customers_4 AS c4
WHERE c4.id 
NOT IN (
SELECT c4.id
FROM Customers_4 AS c4
INNER JOIN orders_4 AS o4
ON c4.id = o4.customerId);
##########################################################################################
# This Query returns null values for id 2 & 4
SELECT *
FROM customers_4 c 
LEFT JOIN orders_4 o 
ON c.id = o.customerId;

# Type 4  
# Output :- This Query returns the name for those who have null values
SELECT c.name AS Customers 
FROM customers_4 c 
LEFT JOIN orders_4 o 
ON c.id = o.customerId
WHERE o.customerId IS NULL;
##########################################################################################