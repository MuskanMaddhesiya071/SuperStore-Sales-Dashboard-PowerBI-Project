create database Superstore_Database
use Superstore_Database

-- Retrieve all the records from superstore data
select * from [dbo].[Superstore sales]

-- Number of rows
select count(*) from [dbo].[Superstore sales]

-- get the unique ship Mode
select distinct(Ship_Mode) from [dbo].[Superstore sales]

-- count how many orders were placed
select count(distinct(Order_ID)) from [dbo].[Superstore sales]

-- Show total sales per category
select Category, round(sum(Sales),2) as 'Total Sales'
from [dbo].[Superstore sales]
group by Category

-- List all customers from California
select distinct(Customer_Name) from [dbo].[Superstore sales]
where State='California'

 -- Find the total no of unique customers
 select count(distinct('Customer_ID'))
 from [dbo].[Superstore sales]

 -- what is the total profit for the 'Chairs' sub-category
select Sub_Category ,round(sum(profit),2) 'Total Profit' from [dbo].[Superstore sales]
group by Sub_Category
having Sub_Category='Chairs'

-- or
SELECT SUM(Profit) AS total_profit 
FROM [dbo].[Superstore sales] WHERE Sub_Category = 'Chairs';

-- Show top 5 products by sales.
select Top 5 Product_Name, round(sum(Sales),2) as Total_Sales
from [dbo].[Superstore sales]
group by Product_Name
order by Total_Sales desc

-- or by using CTE and window function
with ProductSales as(
                    select product_name,sum(sales) as total_sales from [dbo].[Superstore sales]
					group by product_name),
RankedProduct as(
select Product_Name,total_sales, ROW_NUMBER() over(order by total_sales desc) as rn
from ProductSales)

select Product_Name,total_sales
from RankedProduct
where rn<=5

-- Find the earliest and latest order date
select min(Order_Date) as 'Earliest Order', 
         MAX(Order_Date) as 'Latest Order'
		 from [dbo].[Superstore sales]

-- Average discount per region
select Region, AVG(Discount) as Avg_Discount
from [dbo].[Superstore sales]
group by Region

-- state with highest total sales
select Top 1 State, sum(Sales) as Total_Sales
from [dbo].[Superstore sales]
group by State
order by Total_Sales desc

-- or by using cte and window function
with RegionSales as(
                    select State,sum(Sales) as Total_Sales
					from [dbo].[Superstore sales]
					group by State),
RankedRegion as(
               select State,Total_Sales, DENSE_RANK() over(order by Total_Sales desc) as rn
			   from RegionSales)
select State,Total_Sales
from RankedRegion
where rn=1

-- Total quantity of products sold per sub-category
select Sub_Category,sum(Quantity) as Total_Quantity
from [dbo].[Superstore sales]
group by Sub_Category

-- List customers with more than 2 order
select Customer_Name, Count(Order_ID) as Total_Orders
from [dbo].[Superstore sales]
group by Customer_Name
having Count(Order_ID)>2
order by Total_Orders


-- Number of orders shipped using `Second Class`
select Ship_Mode, count(*) as total_orders
from [dbo].[Superstore sales]
group by Ship_Mode
having Ship_Mode='Second Class'

-- Top 3 sub categories by profit in each category
	with SubCategoryProfit as(
							  select Category, Sub_Category, sum(Profit) as Total_Profit
							  from [dbo].[Superstore sales]
							  group by Category, Sub_Category),
	RankedSubCategory as(
						  select Category, Sub_Category,Total_Profit,
						  ROW_NUMBER() over(Partition by Category Order by Total_Profit desc) as rn
						  from SubCategoryProfit)

	select Category, Sub_Category, Total_Profit
	from RankedSubCategory
	where rn>=3


-- Find orders with negative profit
	select Order_ID, Product_Name, Profit
	from [dbo].[Superstore sales]
	where Profit<0

-- Cities where more than 10000 of sales happened
select City,sum(Sales) as Total_Sales from [dbo].[Superstore sales]
group by City
having sum(Sales)>10000 

-- Find the products with zero profit but non zero sales
select Product_Name, Sales,Profit
from [dbo].[Superstore sales]
where Profit=0 and Sales>0

 -- Sub-categories where discount was always 0.
 select Sub_Category
 from [dbo].[Superstore sales]
 group by Sub_Category
 having max(Discount)=0 and min(Discount)=0

 -- Rank customers by Profit in each region
 select * from (
                select Region, Customer_Name,  sum(Profit) as total_profit,
				ROW_NUMBER() over(partition by Region order by sum(Profit) desc) as Customer_Rank
				from [dbo].[Superstore sales]
				group by Region, Customer_Name) as RankRegion

-- Which states have the lowest average sales per order?
select state, avg(sales_order) as avg_sales
from (
     select State, Order_ID, sum(Sales) AS sales_order
     from [dbo].[Superstore sales]
     group by State, Order_ID) as state_sales
group by state
order by avg_sales

-- Write a CTE to find most profitable product in each sub-category.
with cte1 as (
              select Sub_Category, Product_Name,sum(Profit) as Total_Profit,
			 row_number() over(partition by Sub_Category order by sum(Profit) desc) as rn
			  from [dbo].[Superstore sales]
			  group by Sub_Category, Product_Name)
select * from cte1 
where rn=1





