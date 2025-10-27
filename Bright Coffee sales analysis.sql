
SELECT*
FROM casestudy.bright.coffee_shop
LIMIT 10;

----Categorical columns 
SELECT DISTINCT store_location
FROM casestudy.bright.coffee_shop;

-----Product category
 SELECT DISTINCT Product_category
 FROM casestudy.bright.coffee_shop;


 
 -----------

  SELECT MIN (TRANSACTION_DATE) AS first_operating_date
  FROM casestudy.bright.coffee_shop;
 
  SELECT MAX (TRANSACTION_DATE) AS Last_operating_date
  FROM casestudy.bright.coffee_shop;


  SELECT MIN (transaction_time) AS Opening_hour
  FROM casestudy.bright.coffee_shop;
  
SELECT MAX (TRANSACTION_TIME) AS closing_hour
  FROM casestudy.bright.coffee_shop;


  
  SELECT transaction_date,
         DAYNAME(transaction_date) AS Day_name,
         CASE
          WHEN day_name IN ('Sun','Sat') THEN 'Weekend'
          ELSE 'Weekday'
          END AS Day_classification,
         MONTHNAME(transaction_date) AS month_name,

         ---transaction_time,

         CASE
          WHEN TRANSACTION_TIME between '06:00:00' and '11:59:59' then 'Morning'
           WHEN TRANSACTION_TIME between '12:00:00' and '16:59:59' then 'Afternoon'
            WHEN TRANSACTION_TIME >= '17:00:00'  then 'Evening'
            END AS time_classification,
            
            HOUR(transaction_time) AS hour_of_day,

            ---categorical data
            store_location,
            product_category,
            product_detail,
            product_type,
----ID'S
COUNT(DISTINCT transaction_id)AS number_of_sales,

---REVENUE
SUM(TRANSACTION_QTY*UNIT_PRICE) AS revenue

      
   FROM casestudy.bright.coffee_shop
   GROUP BY ALL;
   
   
