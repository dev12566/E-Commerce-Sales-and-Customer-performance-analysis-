-- Table: superstore
SELECT SUM(Sales) AS total_sales, SUM(Profit) AS total_profit,
COUNT(DISTINCT Order_ID) AS total_orders,
COUNT(DISTINCT Customer_ID) AS total_customers FROM superstore;

SELECT EXTRACT(YEAR FROM Order_Date) AS year, EXTRACT(MONTH FROM Order_Date) AS month,
SUM(Sales) AS sales, SUM(Profit) AS profit, COUNT(DISTINCT Order_ID) AS orders
FROM superstore GROUP BY 1,2 ORDER BY 1,2;

SELECT Category,SUM(Sales) sales,SUM(Profit) profit,
SUM(Profit)/NULLIF(SUM(Sales),0)*100 profit_margin_pct
FROM superstore GROUP BY Category ORDER BY sales DESC;

SELECT Category,Sub_Category,SUM(Sales) sales,SUM(Profit) profit
FROM superstore GROUP BY Category,Sub_Category ORDER BY profit DESC;

SELECT Region,SUM(Sales) sales,SUM(Profit) profit,COUNT(DISTINCT Order_ID) orders
FROM superstore GROUP BY Region ORDER BY sales DESC;

SELECT Customer_ID,Customer_Name,SUM(Sales) sales,SUM(Profit) profit,
COUNT(DISTINCT Order_ID) orders FROM superstore
GROUP BY Customer_ID,Customer_Name ORDER BY sales DESC LIMIT 10;

SELECT Product_ID,Product_Name,SUM(Sales) sales,SUM(Profit) profit
FROM superstore GROUP BY Product_ID,Product_Name ORDER BY profit DESC LIMIT 10;

SELECT Product_ID,Product_Name,SUM(Sales) sales,SUM(Profit) profit
FROM superstore GROUP BY Product_ID,Product_Name ORDER BY profit ASC LIMIT 10;

SELECT Discount,SUM(Sales) sales,SUM(Profit) profit,AVG(Profit) avg_profit
FROM superstore GROUP BY Discount ORDER BY Discount;

SELECT Ship_Mode,COUNT(DISTINCT Order_ID) orders,AVG(Shipping_Days) avg_shipping_days,
SUM(Sales) sales,SUM(Profit) profit FROM superstore GROUP BY Ship_Mode;

SELECT State,SUM(Sales) sales,SUM(Profit) profit FROM superstore GROUP BY State ORDER BY profit DESC;

SELECT Category,Sub_Category,SUM(Sales) sales,SUM(Profit) profit
FROM superstore GROUP BY Category,Sub_Category HAVING SUM(Profit)<0 ORDER BY profit;

SELECT AVG(order_sales) average_order_value FROM
(SELECT Order_ID,SUM(Sales) order_sales FROM superstore GROUP BY Order_ID) t;
