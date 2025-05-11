CREATE DATABASE walmart;

use walmart;

CREATE TABLE walmart_data (
    invoice_id INT,
    branch VARCHAR(255),
    City VARCHAR(255),
    category VARCHAR(255),
    unit_price FLOAT,
    quantity FLOAT,
    date DATE,
    time TIME,
    payment_method VARCHAR(255),
    rating FLOAT,
    profit_margin FLOAT,
    total FLOAT
);


select * from walmart_data;

select count(*) from walmart_data;

--- 1. What are the different payment methods, and how many transactions and items were sold with each method?

SELECT payment_method, count(*) as transactions, sum(quantity) as items_sold from walmart_data 
GROUP BY payment_method;

--- 2. What are the unique product categories available?

SELECT DISTINCT category from walmart_data;

--- 3. What is the average rating for each category?

SELECT category, AVG(rating) AS avg_rating FROM walmart_data GROUP BY category ORDER BY avg_rating DESC;

--- 4. Which day of the week has the highest revenue?

SELECT DAYNAME(date) AS day_name, SUM(total) AS revenue
FROM walmart_data
GROUP BY day_name
ORDER BY revenue DESC;

--- 5. What are the top 3 branch received the highest average rating?

SELECT branch, AVG(rating) AS avg_rating 
FROM walmart_data 
GROUP BY branch 
ORDER BY avg_rating DESC 
LIMIT 3;

--- 6. Which city has the highest total sales?

SELECT city, SUM(total) AS total_sales FROM walmart_data
GROUP BY city 
ORDER BY total_sales DESC 
limit 1;

--- 7. What time of day generates the most revenue?

SELECT HOUR(time) AS hour, SUM(total) AS revenue 
FROM walmart_data 
GROUP BY hour 
ORDER BY revenue DESC;

--- 8. Which branch received the LOWEST average rating?

SELECT branch, AVG(rating) AS avg_rating 
FROM walmart_data 
GROUP BY branch ORDER BY avg_rating ASC 
LIMIT 1;

--- 9. What is the average quantity sold per transaction, per category?

SELECT category, AVG(quantity) AS avg_qty
FROM walmart_data 
GROUP BY category;

--- 10. What are the different cities where transactions took place?

SELECT DISTINCT city FROM walmart_data;



