use Online_store

--1. Намерете клиенти, които са направили 2 или повече поръчки.
SELECT name_customer, COUNT(id_order)
FROM Customers as c
JOIN Orders 
ON c.id_customer=Orders.customer_id
GROUP BY name_customer
HAVING COUNT(id_order)>=2

--2. Изведете категориите продукти, за които сумата от продажбите надвишава 500 лева.
SELECT category, SUM(p.price*od.quantity) 
FROM Products as p
JOIN OrderDetails as od
ON p.id_product=od.product_id
GROUP BY category
HAVING SUM(p.price*od.quantity)>500

--3. Покажете клиентите, които са похарчили общо над 1000 лева в магазина.
SELECT name_customer, SUM(od.quantity*p.price)
FROM Customers as c
JOIN Orders as ord
ON c.id_customer=ord.customer_id
JOIN OrderDetails as od
ON ord.id_order=od.order_id
JOIN Products as p
ON p.id_product=od.product_id
GROUP BY name_customer
HAVING SUM(od.quantity*p.price)>1000

--4. Намерете продукти, които са били поръчани повече от 2 пъти.
SELECT name_product, res.[брой поръчвани пъти] FROM Products as p
JOIN 
(SELECT product_id, COUNT(product_id) as [брой поръчвани пъти]
FROM OrderDetails
GROUP BY product_id
HAVING COUNT(product_id)>=2) as res
ON p.id_product=res.product_id

--5. Изведете датите, на които са направени повече от една поръчка.
SELECT order_date, COUNT(order_date) as br 
FROM Orders
GROUP BY order_date
HAVING COUNT(order_date)>1

--6. Покажете всички клиенти заедно с броя на техните поръчки.
SELECT name_customer, COUNT(id_order)
FROM Customers as c
JOIN Orders as o
ON c.id_customer=o.customer_id
GROUP BY name_customer

--7. Изведете списък с продуктите, които никога не са били поръчани.
SELECT name_product, order_id
FROM Products
FULL JOIN OrderDetails
ON OrderDetails.product_id=Products.id_product
WHERE order_id IS NULL

--8. Намерете най-скъпия продукт, който е бил поръчан.
SELECT Top 1 name_product, MAX(price)
FROM Products
GROUP BY name_product
ORDER BY MAX(price) DESC

--9. Покажете средната стойност на поръчката за всеки клиент.
SELECT name_customer, AVG(p.price*od.quantity)
FROM Customers as c
JOIN Orders as o
ON c.id_customer=o.customer_id
JOIN OrderDetails as od
ON o.id_order=od.order_id
JOIN Products as p
ON od.product_id=p.id_product
GROUP BY name_customer

--10. Изведете продуктите, които са били поръчани в най-голямо количество.
SELECT TOP 1 name_product, quantity
FROM Products 
JOIN OrderDetails as od
ON Products.id_product=od.product_id
ORDER BY quantity DESC

--11. Покажете общите приходи от всички поръчки
SELECT SUM(p.price*od.quantity)
FROM OrderDetails od
JOIN Products as p
ON p.id_product=od.product_id