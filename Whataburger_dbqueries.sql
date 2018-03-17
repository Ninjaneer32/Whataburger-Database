-- Query A: Display all the records from each table--
SELECT * FROM Stores;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Menu;

-- Query B: Display the total amount of orders there were in each day of the week for the month of February 2018--
Select COUNT(OrderID) AS Total_Orders,
DayoftheWeek
FROM OrderDetails
Group By DayoftheWeek;

-- Query C: List which menu items have been solds more than 10 times--
Select SUM(OD.OrderQuantity) AS Total_Items_Sold,
M.ItemName
FROM OrderDetails as OD
Inner Join Menu AS M
	ON OD.ItemID = M.ItemID
Group By M.ItemName
HAVING SUM(OD.OrderQuantity) > 10;

-- Query D: List out the name of the workers that have sold at least 1 order. Outer Join is necessary because some workers are cooks and don't have any orders attributed to them.--
SELECT DISTINCT E.FirstName,
E.LastName
FROM Employees AS E
RIGHT OUTER JOIN Orders AS O
	ON E.EmployeeID = O.EmployeeID;

-- Query E: Which employee's average sells were more than the average total amount?--
SELECT AVG(TotalAmount), EmployeeID
FROM Orders
WHERE TotalAmount > 
    (SELECT AVG(TotalAmount) 
    FROM Orders)
GROUP BY EmployeeID;