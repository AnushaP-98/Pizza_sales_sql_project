## PIZZA SALES SQL QUERIES

1.	SELECT SUM(total_price) AS Total_Revenue 
    FROM `pizza-sales-446307.pizza_sales.sales` 
         
2.	SELECT SUM(total_price)/COUNT(DISTINCT order_id) as Avg_order_value
    FROM `pizza-sales-446307.pizza_sales.sales`
 
3.	SELECT SUM(quantity) as Total_pizza_sold
    FROM pizza-sales-446307.pizza_sales.sales
 
4.	SELECT COUNT(DISTINCT order_id) as Total_orders
    FROM pizza-sales-446307.pizza_sales.sales

5.	SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_pizza_per_order
    FROM pizza_sales
        
##  DAILY TREND

6.	SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) as total_orders
    FROM pizza_sales
    GROUP BY DATENAME(DW, order_date)

## HOURLY TREND

7.	SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
    FROM pizza_sales
    GROUP BY DATEPART(HOUR, order_time)
    ORDER BY DATEPART(HOUR, order_time) 
  
8.	SELECT pizza_category, SUM(total_price) AS total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales WHERE MONTH(order_date) = 1) AS PCT
    FROM pizza_sales
    WHERE MONTH(order_date) = 1
    GROUP BY pizza_category
            
9.	SELECT pizza_size, SUM(total_price) AS total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS PCT
    FROM pizza_sales
    GROUP BY pizza_size
    ORDER BY PCT DESC

10.	SELECT pizza_size, SUM(total_price) AS total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales WHERE DATEPART(quarter, order_date) = 1) AS PCT
    FROM pizza_sales
    WHERE DATEPART(quarter, order_date) = 1
    GROUP BY pizza_size
    ORDER BY PCT DESC

11.	SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
    FROM pizza_sales
    GROUP BY pizza_category

12.	SELECT TOP 5 pizza_name, SUM(quantity) AS Total_pizzas_sold
    FROM pizza_sales
    GROUP BY pizza_name
    ORDER BY SUM(quantity) DESC

13.	SELECT TOP 5 pizza_name, SUM(quantity) AS Total_pizzas_sold
    FROM pizza_sales
    GROUP BY pizza_name
    ORDER BY SUM(quantity)

 



