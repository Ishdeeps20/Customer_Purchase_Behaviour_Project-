show databases;
use mydatabase;  
select * from mytable limit 20;

select gender, sum(purchase_amount) from mytable group by gender;

select customer_id, purchase_amount from mytable where discount_applied = "Yes" and purchase_amount >= (select avg(purchase_amount) from mytable);

# Which are the top 5 products with the highest average review rating?
 Select item_purchased as Products, round(avg(review_rating),2) as "Product Review Ratings" from mytable group by item_purchased 
 order by avg(review_rating) desc limit 5;
 
 # Compare the average purchase amounts between standard and express shipping
 select shipping_type, avg(purchase_amount) as "Average Purchase Amounts" from mytable where shipping_type in ("Express", "Standard") group by shipping_type;
 
 #Do subscribed customer spend more? Compare average spend and total revenue between subscribers and non-subscribers.
 select subscription_status, count(customer_id) as total_customers, round(avg(purchase_amount),2) 
as average_spend, sum(purchase_amount) as total_revenue from mytable group by subscription_status order by average_spend desc, total_revenue desc;

#Calculate what percentage of total revenue comes from each subscription category.
select
 subscription_status,
 round(sum(purchase_amount),2) as total_revenue, 
 round(sum((purchase_amount)*100/(select sum(purchase_amount) from mytable)),2) as percentage_revenue
 from mytable group by subscription_status;
 
 # Which 5 products have the highest percentage of purchases with discount applied?
 select 
	item_purchased as "Top 5 Products", 
	round(sum(discount_applied = "Yes")*100/count(*),2) as Discount_rate
    from mytable group by item_purchased order by Discount_rate desc limit 5;
  
  # or
  
 select 
	item_purchased as "Top 5 Products", 
	round(sum(Case when discount_applied = "Yes" then 1 else 0 end)*100/count(*),2) as Discount_rate
    from mytable group by item_purchased order by Discount_rate desc limit 5;
    
    #Segment customers into New, eturning, and loyal based on their total number of previous purchases, and show the count of each segment.
     with customer_type as (
     select customer_id, previous_purchases,
     Case 
		when previous_purchases = 1 then "New"
        when previous_purchases between 2 and 10 then "Returning"
        else "Loyal"
	 end as customer_segment 
     from mytable
     )
     select customer_segment, count(*) as "Number of Customers"
     from customer_type group by customer_segment;
     
     
     
	#What are the top 3 most purchased products within each category?
 with item_count as (select category, item_purchased, count(customer_id) as Total_Orders, 
 row_number() over (partition by category order by count(customer_id) desc) as item_rank 
 from mytable group by category, item_purchased)
 select item_rank, category, item_purchased, Total_Orders from item_count
 where item_rank <= 3;
 

 # Are customers who are repeat buyers (more than 5 previous purchases) also likely to subscribe?
 Select subscription_status, count(customer_id) as repeat_buyers from mytable 
 where previous_purchases > 5 group by subscription_status;
 
 
 # What is the revenue contribution of each age group?
 Select sum(purchase_amount) as Total_Revenue, age_group from mytable group by age_group order by Total_Revenue Desc;
 
 Select round(sum(purchase_amount)*100/(select sum(purchase_amount) from mytable),2) as Revenue_percentage, age_group from mytable group by age_group order by Revenue_percentage Desc;
 
 
 
