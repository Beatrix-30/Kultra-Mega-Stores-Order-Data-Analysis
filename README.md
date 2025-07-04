# Kultra-Mega-Stores-Order-Data-Analysis

## Outline
- [Project Overview](#project-overview)
- [Data source](#data-source)
- [Tools used](#tools-used)
- [Data Analysis for Case Scenario I](#data-analysis-for-case-scenario-I)
- [Data Analysis for Case Scenario II](#data-analysis-for-case-scenario-II)
- [Result from the Analysis ](#result-from-the-analysis )


## Project Overview
This repository contains SQL queries and analyses conducted on the order data for Kultra Mega Stores (KMS), a leading provider of office supplies and furniture based in Lagos, Nigeria. The data spans from 2009 to 2012 and focuses on various customer segments, including individual consumers, small retail businesses, and large corporate clients.

## 📁 Data source
The source of data used are below and can be downloaded through the link:
- KMS SQL CASE STUDY.CSV [Download Here](https://canvas.instructure.com/files/302721273/download?download_frd=1)
- Order_Status.CSV [Download Here](https://canvas.instructure.com/files/302963135/download?download_frd=1)

## 🧰 Tools used
- SQL Server Management Studio (SSMS): for querying and data analysis [Download Here](https://learn.microsoft.com/en-us/ssms/sql-server-management-studio-ssms) 

## 🧠 Business Questions from Case study
📌 **Case Scenarion 1**:
     1. Which product category had the highest sales?
     2. What are the Top 3 and Bottom 3 regions in terms of sales?
     3. What were the total sales of appliances in Ontario?
     4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
     5. KMS incurred the most shipping cost using which shipping method?
     
📌 **Case Scenario 2 ** – Customer Value & Segment Insights
Most valuable customers and products they purchase
Highest-spending small business customer
Corporate customer with most orders (2009–2012)
Most profitable consumer customer
Customers who returned products and their segments
Was shipping cost aligned with order priority?


🧠 Data Analysis for Case Scenario I


## Result from the Analysis 
1. **Which product category had the highest sales?**
  The product category with the highest sales is Technology with total sales of $5,984,248.50.
2. **What are the Top 3 and Bottom 3 regions in terms of sales?**
   - Top 3 Regions by Sales:
     - West: $3,597,549.41
     - Ontario: $3,063,212.60
     - Prairie: $2,837,304.60
   - Bottom 3 Regions by Sales:
     - Nunavut: $116,376.47
     - Northwest Territories: $800,847.35
     - Yukon: $975,867.39
3. **What were the total sales of appliances in Ontario?**
The total sales of appliances in Ontario were $202,346.84.

4. **Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers.**
These customers (Jeremy Fany, Natalie DeChemey, Nicole Fjeld, Katrina Edelman, Dorothy Dickinson, Christine Kargatis, Eric Murdock, Chris McAfee, Anne McFarland, Rick Huthwaite) are the ones generating the least revenue among the observed group.
To increase revenue from these bottom 10 customers, KMS management should consider the following strategies:
  - **Targeted Promotions and Discounts:** Offer personalized discounts or promotions on products these customers previously viewed or purchased, or on related items that might interest them.
  - **Customer Relationship Management (CRM):** Implement a robust CRM system to track their past purchases, preferences, and interactions. 
  - Feedback Collection: Reach out to these customers to understand their needs, reasons for their low engagement, complaints about the products or services or other concerns. feedbacks can be collected through surveys, or direct calls.
  - **Improved Customer Service:** Ensure that these customers receive excellent customer service. Positive experiences can encourage them to make more purchases.
  - **Product Recommendations:** Use data analytics to suggest products they are more likely to buy, based on their Browse history or similar customer profiles.
   
5. **KMS incurred the most shipping cost using which shipping method?**
KMS incurred the most shipping cost using Delivery Truck with a total shipping cost of $51,971.94.

6. **Who are the most valuable customers, and what products or services do they typically purchase?**
   - Top Customer by Total Sales:
     - Emily Phan purchased "Polycom ViewStation ISDN Videoconferencing Unit" with total sales of $89,061.05.
     - Jasper Cacioppo purchased "Polycom ViewStation ISDN Videoconferencing Unit" with total sales of $45,923.76.
     - Craig Carreira purchased Polycom ViewStation ISDN Videoconferencing Unit with total sales of $41,343.21
     - Clytie Kelty purchased Canon PC940 Copier with total sales of $40,780.52
     - Dennis Kane purchased Canon imageCLASS 2200 Advanced Copierwith total sales $33,367.85
     - Karen Carlisle purchased Canon Image Class D660 Copier with total sales of $29,884.60
     - Steve Chapman purchased Riverside Palais Royal Lawyers Bookcase with total sales of $29,345.27
     - Nick Crebassa purchased Hewlett-Packard Business Color Inkjet 3000 [N, DTN] Series Printers with total sales of $29,186.49
     - Parhena Norris purchased Canon imageCLASS 2200 Advanced Copier with total sales of $28,761.52
     - Deborah Brumfield purchased Hewlett Packard LaserJet 3310 Copier with total sales of $28,664.52

7. **Which small business customer had the highest sales?**
The small business customer who had the highest sales was Dennis Kane with total sales of $75,967.59.

8. **Which Corporate Customer placed the most number of orders in 2009 – 2012?**
The corporate customer who placed the most number of orders in 2009 – 2012 was Adam Hart with 27 orders.

9. **Which consumer customer was the most profitable one?**
The most profitable consumer customer was Emily Phan with a total profit of $34,005.44.

10. **Which customer returned items, and what segment do they belong to?**
    The total number of items returned were 872 based on the order ID. However customers that returned distinct items based on the segments were 419 ranging from Consumer, Small Business, Corporate, Home Office.
    
11. **If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer.**

**Shipping Methods Costs:**
 - **Delivery Truck:**
   - Average Shipping Cost: $45.35
   - Sum of Shipping Cost: $51,971.94
   - Total Orders: 28,764
- **Express Air:**
  - Average Shipping Cost: $7.99
  - Sum of Shipping Cost: $7,850.91
  - Total Orders: 25,353
- **Regular Air:**
  - Average Shipping Cost: $7.66
  - Sum of Shipping Cost: $48,008.19
  - Total Orders: 160,660

**Order Priorities:**
- Critical:
  - Delivery Truck: $47.30 (high cost)
  - Express Air: $8.71
  - Regular Air: $7.28
- High:
  - Delivery Truck: $45.19
  - Express Air: $6.86
  - Regular Air: $7.65
- Medium:
  - Delivery Truck: $46.15
  - Express Air: $8.13
  - Regular Air: $7.69
- Low:
  - Delivery Truck: $44.53
  - Express Air: $8.17
  - Regular Air: $8.02

**Analysis: Cost vs. Priority:**
For Critical orders, using the Delivery Truck is not justified due to its high cost compared to Express Air and Regular Air, which offer faster delivery at lower costs.
For High and Medium orders, the Delivery Truck again is significantly more expensive compared to the other options. Even for Low priority orders, while the Delivery Truck is the least expensive among the shipping methods, it still represents a higher cost compared to Regular Air.

The company did not appropriately allocate shipping costs based on order priorities. Critical and High Orders should prioritize speed and cost-effectiveness, favoring Express Air or Regular Air over the Delivery Truck. Regular Air or Express Air would be more suitable for medium orrders. While less urgent, Regular Air remains a better choice financially.

**Recommendation**
The company should reassess its shipping strategy to align costs with order priorities better. Specifically, for critical orders, using faster yet more economical options like Express Air or Regular Air would optimize both cost and delivery efficiency. Overall, a strategic review of shipping methods based on urgency and cost-effectiveness is necessary to ensure better financial management.


