Create database Wallmart;


use Wallmart
Select * from [WalmartSalesData.csv]

--1. List all unique cities.
Select distinct(City) as 'Unique Citys' from [WalmartSalesData.csv]

--2. Show all records from Branch “A”.
Select * from [WalmartSalesData.csv]
Where Branch = 'A'

--3. Count total sales transactions.
Select Count(*) as 'Total Sales' from [WalmartSalesData.csv]

--4. Find unique payment methods used.
Select Distinct(Payment) as 'Payment Method' from [WalmartSalesData.csv]

--5. Display top 10 invoices with highest total amount.
Select Top(10) * from [WalmartSalesData.csv]
Order by Total desc;

--6. Find the total sales per city.
Select City, ROUND(SUM(Total),2) as 'Total Amount' from [WalmartSalesData.csv]
Group by City;

--7. Average rating by product line.
Select Product_line, round(avg(Rating),2) as 'Avg_Rating' from [WalmartSalesData.csv]
Group by Product_line
order by Avg_Rating desc;

--8. Find which branch made the highest gross income.
Select top(1) Branch, round(sum(gross_income),2) as 'Sum of Gross Income' from [WalmartSalesData.csv]
Group by Branch
order by [Sum of Gross Income] desc;

--9. Total number of male vs female customers.
Select Gender, Count(Gender) as 'Total_Gender' from [WalmartSalesData.csv]
Group by Gender;

--10. Average total Gross_income by payment method.
Select Payment, ROUND(Avg(Gross_income),1) as 'Avg Gross Income' from [WalmartSalesData.csv]
Group by Payment;

--11. Find the busiest hour of the day (most transactions).
SELECT 
  FORMAT(CAST(Time AS DATETIME), 'hh tt') AS [Hour],
  COUNT(Quantity) AS [Sold Quantity]
FROM 
  [WalmartSalesData.csv]
GROUP BY 
  FORMAT(CAST(Time AS DATETIME), 'hh tt')
ORDER BY [Sold Quantity] desc;

--12. Find daily sales trend.
Select Date, Floor(Sum(Quantity)) * Floor(sum(Unit_price)) as 'Total Sales Amount' from [WalmartSalesData.csv]
Group by Date
Order by Date asc;

--13. Find which product line generates the highest tax.
Select Product_line,Floor(Sum(Tax_5)) as 'Total_Tax_Generate' from [WalmartSalesData.csv]
Group by Product_line
Order by Total_Tax_Generate desc;

--14. Average sales per customer type in each city.
Select	City, Avg( from [WalmartSalesData.csv]

--Rank all transactions by total amount within each branch.
select
Branch,
Floor(Sum(Total)) as 'Total Amount',
Row_Number()
over 
(Order by Floor(Sum(Total)) desc) as 'Rank'
from [WalmartSalesData.csv]
Group by Branch;

--Find the top 5 customers (by total purchase amount).
Select Top (5) Invoice_ID, Floor(sum(Total)) as 'Total Amount' from [WalmartSalesData.csv]
Group by Invoice_ID
Order by  [Total Amount] desc;

--Determine the most common payment method per branch.


--Calculate the percentage contribution of each product line to total sales.
Select Product_line, Round(Sum(Total)* 100.0/ (select sum(total) from [WalmartSalesData.csv]),2) as 'percentage' from [WalmartSalesData.csv]
Group by Product_line
Order by percentage desc;

--Find the city with the highest average rating.
Select Top(1) City,Round(Avg(Rating),1) as'Avg_Rating' from [WalmartSalesData.csv]
Group by City;

--For each branch, find the day that had the highest sales.
Select Top(3) Branch,Date, Floor(SUM(Total)) as 'Total Amount' from [WalmartSalesData.csv]
Group by Branch, Date;

--Calculate the cumulative revenue per branch over time.

--Compare average gross income between “Member” and “Normal” customers.
Select Customer_type, Round(Avg(gross_income),2) as 'Avg_Gross_Income' from [WalmartSalesData.csv]
Group by Customer_type;

--Find the correlation between rating and total amount spent (using SQL approximation).


--Find the product line with the most sales during weekends.
Select * from [WalmartSalesData.csv]

--Extract month name and find monthly sales trends.
--Incorrenct Currently 
Select 
Year(Convert(date,date,103)) as 'Year',
Datename(Month, Convert(Date,Date,103)) as 'Month',
Sum(Total) as 'Total Amount' from [WalmartSalesData.csv]
Group by
Year(Convert(date,date,103)), 
Datename(Month, Convert(Date, Date,103));

SELECT 
    YEAR(CONVERT(DATE, Date, 103)) AS 'Year',
    DATENAME(MONTH, CONVERT(DATE, Date, 103)) AS 'Month_Name',
    SUM(Total) AS 'Total_Amount'
FROM [WalmartSalesData.csv]
GROUP BY 
    YEAR(CONVERT(DATE, Date, 103)),
    DATENAME(MONTH, CONVERT(DATE, Date, 103));


--Classify transactions as “Morning,” “Afternoon,” or “Evening” based on time.
SELECT 
    Time,
    CASE 
        WHEN CAST(Time AS TIME) BETWEEN '13:00:00' AND '18:00:00' THEN 'Evening'
        WHEN CAST(Time AS TIME) BETWEEN '01:00:00' AND '12:00:00' THEN 'Morning'
        ELSE 'Night'
    END AS 'Routen', Floor(SUM(Total)) as 'Total Amount'
FROM [WalmartSalesData.csv]
Group by Time
Order by Routen asc;

--Count how many transactions happened in each time-of-day category.
Select Time, Count(Total) as 'Total Transactions' from [WalmartSalesData.csv]
Group by Time;

--Find which month had the highest gross income.
Select  
DATENAME(Month,Convert(Date, Date, 103)) as 'Month',
Sum(gross_income) as 'Total_Gross_Income'
from [WalmartSalesData.csv]
Group by DATENAME(Month,Convert(Date, Date, 103)) 
Order by  Total_Gross_Income DESC;

--Calculate average by product_line
Select Product_line, floor(sum(total))/count(product_line) as 'Avg_Sales' from [WalmartSalesData.csv]
Group by Product_line;

--Get the range of dates in the database
Select min(date) as 'Min Date', MAX(DATE) AS 'Max Date' from [WalmartSalesData.csv]


--Find number of unique product lines
Select Distinct(Product_line) as 'Unique_Product_line' from [WalmartSalesData.csv]

--Total sales by city
Select City, Sum(Total) as 'Total Amount' from [WalmartSalesData.csv]
Group by city
Order by [Total Amount] desc;

--Total sales by product line
Select Product_line, FLOOR(SUM(TOTAL)) AS 'Total_amount' from [WalmartSalesData.csv]
Group by Product_line
Order by Total_amount desc;

--Top 5 highest product lines by Total
Select top 5 Product_line, Floor(Total) as Total from [WalmartSalesData.csv]
Order by Total desc;

--Find which branch made the most sales
Select Branch, Floor(Sum(Total)) as 'Total_Amount' from [WalmartSalesData.csv]
Group by Branch;

--Count customers by gender
Select Gender, Count(Gender) as 'Total_Gender' from [WalmartSalesData.csv]
Group by Gender;

--Average sales by customer type
Select Customer_type, Round(Avg(total),2) as 'Avg Sales' from [WalmartSalesData.csv]
Group by Customer_type;

--Which customer type gives more gross income?
Select top(1) Customer_type, Floor(Sum(Total)) as 'Total_Amount' from [WalmartSalesData.csv]
Group by Customer_type
Order by Total_Amount DESC;

--Which customer type uses more payment methods?
Select Customer_type, Count(Payment) as 'Count_Payment' from [WalmartSalesData.csv]
Group by Customer_type;

--Most used payment method
Select top(1) Payment, Count(Payment) 'Common use Payment' from [WalmartSalesData.csv]
Group by Payment
Order by [Common use Payment];

--Gross income by city
Select City, floor(Sum(gross_income)) from [WalmartSalesData.csv]
group by City;

--Rank cities by total revenue
Select city, floor(sum(total)) [Total Revenue],
rank()
over
(order by sum(total) desc) [Sales_Rank]
from [WalmartSalesData.csv]
Group by city;

--Find city with highest average rating
Select city, round(avg(Rating),2) as 'Avg_Rating' from [WalmartSalesData.csv]
Group by city
order by Avg_Rating desc;