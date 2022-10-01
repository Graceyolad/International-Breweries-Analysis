--Write an SQL query to fetch “SALES_REP” from breweries  table using the alias name as WORKER_NAME--

SELECT DISTINCT sales_rep AS WORKER_NAME
FROM breweries;

--Write an SQL query to fetch “BRANDS” from breweries table in upper case--

SELECT DISTINCT UPPER (brands)
FROM breweries;

/*Write an SQL query to print all details from the breweries table;
sort the QUANTITY column in Ascending order and the COSTS column in Descending order*/

SELECT sales_id, sales_rep, emails, brands, plant_cost, unit_price, quantity, costs, profit, countries, region, months, years
FROM breweries
ORDER BY quantity ;

SELECT sales_id, sales_rep, emails, brands, plant_cost, unit_price, quantity, costs, profit, countries, region, months, years
FROM breweries
AND ORDER BY costs DESC;

--Write an SQL query to print the profit made from two BRANDS, “trophy” and “eagle” in the first quarter of 2019--

SELECT brands, SUM(profit)
FROM breweries
WHERE brands IN ('trophy', 'eagle lager')
AND months IN ('January','February','March')
AND years =2019
GROUP BY 1
ORDER BY 2;

--Write a query that reduces the cost of the trophy brand by 2%--

SELECT SUM(costs), ROUND((SUM(costs)-(0.02*SUM(costs))),0) AS costs_reduction_trophy
FROM breweries
WHERE brands = 'trophy';


--Which sales rep made the highest profit in Ghana in the year 2017?--
SELECT sales_rep, SUM(profit)
FROM breweries
WHERE countries ='Ghana'
AND years=2017
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;


--What region recorded the lowest quantity of goods in the last quarter of every year?

SELECT region, SUM(quantity)
FROM breweries
WHERE months IN ('October','November', 'December')
GROUP BY 1
ORDER BY 2;

--The Breweries company has a yearly tradition of promoting the sales_rep who makes the highest profit in the year. Who deserves this promotion in 2019?

SELECT sales_rep, SUM(profit)
FROM breweries
WHERE years=2019
GROUP BY 1
ORDER BY 2 DESC;


--Regions with quantities of trophy which are less than 60000, need to be restocked. What regions do we restock with the trophy brand?
SELECT region, SUM(quantity)
FROM breweries
WHERE brands ='trophy'
GROUP BY 1
HAVING SUM(quantity) < 60000
ORDER BY 2;