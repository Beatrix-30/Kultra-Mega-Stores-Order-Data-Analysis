create database Kultra_Mega_Stores

--------------------- Product category with the highest sales-------------
select top 1 Product_category, sum(sales) as [Highest sales]
from [dbo].[KMS Sql Case Study]
group by Product_category
order by [Highest sales] desc

---------------------  Top 3 and Bottom 3 regions in terms of sales--------------

-- Top 3 regions

select top 3 Region, SUM(Sales) as [Total sales]
from [dbo].[KMS Sql Case Study]
group by Region
order by [Total Sales] desc


-- Bottom 3 regions
select top 3 Region, SUM(Sales) as [Total sales]
from [dbo].[KMS Sql Case Study]
group by Region
order by [Total Sales] asc

-------------- Top and bottom 3 regions in terms of sales on a single table------------------

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

---------------------------------------Total sales of appliances in Ontario--------------
select sum(sales) as [Total appliance sales in Ontario]
from [dbo].[KMS Sql Case Study]
where 
product_sub_category = 'appliances'
and
Region = 'ontario'

------------------------- Revenue of bottom 10 customers -------------------------------
select top 10 [Customer_Name],sum(Unit_Price * Order_Quantity) as [Total Revenue]
from [dbo].[KMS Sql Case Study]
group by [Customer_Name]
order by [Total Revenue] asc


----------------------------- Shipping Method that incurred the most Shipping Cost-------------
select top 1 [Ship_Mode], sum([Shipping_Cost]) as Total_Shipping_Cost
from [dbo].[KMS Sql Case Study]
group by  [Ship_Mode]
order by Total_Shipping_Cost desc 


------------------------- Who are the most valuable customers, and what products or services do they typically purchase? ---------------

select top 10 [Customer_Name], [Product_Name], SUM(Sales) AS Total_Sales
from [dbo].[KMS Sql Case Study]
group by [Customer_Name], [Product_Name]
order by Total_Sales desc;

------------------- Most valuable customers based on Product Category-----------------
with customer_sales as (
    select [customer_name] as customer_name,
        sum([sales]) as total_sales
    from [dbo].[kms sql case study]
    group by [customer_name]
),

top_customers as (
    select top 10 customer_name, total_sales
    from customer_sales
    order by total_sales desc
),

customer_category_sales as (
    select 
        o.[customer_name] as customer_name, 
        o.[product_category],
        sum(o.[sales]) as category_sales
    from [dbo].[kms sql case study] as o
    join top_customers as tc
        on o.[customer_name] = tc.customer_name
    group by o.[customer_name], o.[product_category]
)

select 
    ccs.customer_name,
    ccs.product_category,
    ccs.category_sales
   
   from customer_category_sales as ccs
order by ccs.category_sales desc;



----------------------------------  Small business customer with the highest sale-----------------
select top 1 [Customer_Name], sum(Sales) AS Total_Sales
from [dbo].[KMS Sql Case Study]
where [Customer_Segment] = 'small business'
group by [Customer_Name]
order by  Total_Sales desc;

-------------------------------- Corporate Customer with the highest orders between 2009 – 2012------------------

select top 1  [Customer_Name], count([Order_ID]) as Order_Count
from [dbo].[KMS Sql Case Study]
where [Order_Date] BETWEEN '2009-01-01' and '2012-12-31' 
  and [Customer_Segment] = 'Corporate'
group by [Customer_Name]
order by Order_Count desc;

------------------------- Most profitable Consumer Customer ----------------------------
select top 1 [Customer_Name], sum(Profit) as Total_Profit
from [dbo].[KMS Sql Case Study]
where [Customer_Segment] = 'Consumer'
group by [Customer_Name]
order by Total_Profit desc;

--------------------------------- Segment of Customer Returned Items ------------------------------

select distinct t.customer_name, t.customer_segment
from 
 [dbo].[KMS Sql Case Study]  t 
 JOIN 
 [dbo].[Order_Status]  o 
on 
  t.order_id = o.order_id
where 
  o.status = 'Returned';

--------------------------- Was shipping costs based on the Order Priority?------
Select (order_priority),(ship_mode),count(*) as number_of_orders,
sum(shipping_cost) as total_shipping_cost,
avg(shipping_cost) as avg_shipping_cost
from [dbo].[KMS Sql Case Study]
group by (order_priority), (ship_mode)
order by case (order_priority)
        when 'critical' then 1
        when 'high' then 2
        when 'medium' then 3
        when 'low' then 4
        else 5
    end


  
