SELECT * FROM customer_data.customer;
drop table customer;
use customer_data;
create table customer (order_id int, order_date date, product_id int, product_category varchar(50),price decimal(10,2) ,discount_percent int ,
qty_sold int,customer_region varchar(50),payment_method varchar(50),ratings decimal(2,1),review_count int, 
discounted_price decimal(10,2),total_revenue decimal(10,2),profit decimal(10,3));

use customer_data;
select sum(total_revenue) from customer; #total revenue

select product_category, sum(total_revenue) as revenue from customer group by product_category order by revenue desc limit 10;  #top 10 products

 select customer_region ,sum(qty_sold) as total_qty from customer group by customer_region having total_qty >0;  #region wise sales
 
 select sum(profit) as total_profit , monthname(order_date) as m from customer group by m order by total_profit desc;  #monthly trends 
 
 select sum(profit) as total_profit , payment_method from customer group by payment_method having total_profit >0 ;  #payment method 
 
 select product_category , max(ratings) as max_ratings from customer group by product_category order by max_ratings desc limit 3 ; #top 3 products and their max ratings
 
 