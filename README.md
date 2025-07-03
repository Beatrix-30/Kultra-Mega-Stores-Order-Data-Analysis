# Kultra-Mega-Stores-Order-Data-Analysis
This repository contains SQL queries and analyses conducted on the order data for Kultra Mega Stores (KMS), a leading provider of office supplies and furniture based in Lagos, Nigeria. The data spans from 2009 to 2012 and focuses on various customer segments, including individual consumers, small retail businesses, and large corporate clients.

## Data source
- KMS SQL CASE STUDY.CSV [Download Here](https://canvas.instructure.com/files/302721273/download?download_frd=1)
- Order_Status.CSV [Download Here](https://canvas.instructure.com/files/302963135/download?download_frd=1)

## Tools used
- SQL Server Management Studio (SSMS): for querying and data analysis [Download Here](https://learn.microsoft.com/en-us/ssms/sql-server-management-studio-ssms) 

## Analysis for Case Scenario I
```
create database Kultra_Mega_Stores
```
1. Which product category had the highest sales?
```
select top 1 Product_category, sum(sales) as [Highest sales]
from [dbo].[KMS Sql Case Study ]
group by Product_category
order by [Highest sales] desc
```
2. What are the Top 3 and Bottom 3 regions in terms of sales?
   
```
-- Top 3 regions

select top 3 Region, SUM(Sales) as [Total sales]
from[dbo].[KMS Sql Case Study ]
group by Region
order by [Total Sales] desc
```

```
-- Bottom 3 regions
select top 3 Region, SUM(Sales) as [Total sales]
FROM [dbo].[KMS Sql Case Study ]
group by Region
order by [Total Sales] asc
```
-------------- Top and bottom 3 regions in terms of sales on a single table------------------
```
With Rankedregions as (
  select region, sum(sales) as [Total sales],
         row_number() over (order by sum(sales) desc) as [Top rank],
         row_number() over (order by sum(sales) asc) as [Bottom rank]
  from [dbo].[kms sql case study]
  group by region
),
Top3 as (
  select region, [Total sales], row_number() over (order by [Total sales] desc) as rownum
  from rankedregions
  where [Top rank] <= 3
),
Bottom3 as (
  select region, [Total sales], row_number() over (order by [Total sales] asc) as rownum
  from rankedregions
  where [Bottom rank] <= 3
)
select 
  t.region as [Top region], t.[Total sales] as [Top sales],
  b.region as [Bottom region], b.[Total sales] as [Bottom sales]
from Top3 t
full outer join Bottom3 b
on t.rownum = b.rownum;
```
3. What were the total sales of appliances in Ontario?
```
select sum(sales) as [Total appliance sales in Ontario]
from [dbo].[KMS Sql Case Study ]
where 
product_sub_category = 'appliances'
and
Region = 'ontario'
```
4. Revenue of bottom 10 customers 
```
select top 10 [Customer_Name],sum(Unit_Price * Order_Quantity) as [Total Revenue]
from [dbo].[KMS Sql Case Study ]
group by [Customer_Name]
order by [Total Revenue] asc
```
5. KMS incurred the most shipping cost using which shipping method?
----------------------------- Shipping Method that incurred the most Shipping Cost-------------
```
select top 1 [Ship_Mode], sum([Shipping_Cost]) as Total_Shipping_Cost
from [dbo].[KMS Sql Case Study ]
group by  [Ship_Mode]
order by Total_Shipping_Cost desc 
```
## Analysis for Case Scenario II

6. Who are the most valuable customers, and what products or services do they typically 
purchase? 
```
SELECT TOP 10 [Customer_Name], [Product_Name], SUM(Sales) AS Total_Sales
FROM [dbo].[KMS Sql Case Study ]
GROUP BY [Customer_Name], [Product_Name]
ORDER BY Total_Sales DESC;
```
7. Which small business customer had the highest sales?
```
select top 1 [Customer_Name], sum(Sales) AS Total_Sales
from [dbo].[KMS Sql Case Study ]
where [Customer_Segment] = 'small business'
group by [Customer_Name]
order by  Total_Sales desc;
```
8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
   
```
select top 1  [Customer_Name], count([Order_ID]) as Order_Count
from [dbo].[KMS Sql Case Study ]
where [Order_Date] BETWEEN '2009-01-01' and '2012-12-31' 
  and [Customer_Segment] = 'Corporate'
group by [Customer_Name]
order by Order_Count desc;
```
9. Which consumer customer was the most profitable one?
```
select top 1 [Customer_Name], SUM(Profit) AS Total_Profit
from [dbo].[KMS Sql Case Study ]
where [Customer_Segment] = 'Consumer'
group by [Customer_Name]
order by Total_Profit desc;
```
10. Which customer returned items, and what segment do they belong to?
```
select distinct [Order_ID], [Customer_Segment]
from [dbo].[KMS Sql Case Study ]
where [Order_Quantity] < 0;
```
