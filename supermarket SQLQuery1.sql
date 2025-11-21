select * from supermarket;

SELECT 
    Customer_type,
    COUNT(*) AS total_transactions,
    SUM(Total) AS total_revenue,
    ROUND(AVG(Total), 2) AS avg_spending
FROM supermarket
GROUP BY Customer_type
ORDER BY total_revenue DESC;

SELECT Date, SUM(Total) AS daily_revenue
FROM supermarket
GROUP BY Date
ORDER BY Date;



SELECT 
    Product_line,
    SUM(Total) AS total_revenue,
    SUM(Quantity) AS total_quantity_sold,
    ROUND(AVG(Rating),2) AS avg_customer_rating
FROM supermarket
GROUP BY Product_line
ORDER BY total_revenue DESC;

SELECT 
    Payment,
    COUNT(*) AS transactions,
    SUM(Total) AS total_revenue,
    ROUND(AVG(Rating),2) AS avg_rating
FROM supermarket
GROUP BY Payment
ORDER BY total_revenue DESC;

SELECT 
    Branch, City,
    SUM(Total) AS total_revenue,
    COUNT(*) AS total_sales,
    ROUND(AVG(Total),2) AS avg_transaction_value
FROM supermarket
GROUP BY Branch, City
ORDER BY total_revenue DESC;

SELECT 
    Customer_type,
    SUM(Total) AS total_revenue,
    ROUND(SUM(Total) / (SELECT SUM(Total) FROM supermarket) * 100, 2) AS percentage_share
FROM supermarket
GROUP BY Customer_type;

SELECT 
    Product_line,
    SUM(gross_income) AS total_profit,
    ROUND(SUM(gross_income) / SUM(Total) * 100, 2) AS profit_margin_percentage
FROM supermarket
GROUP BY Product_line
ORDER BY total_profit DESC;

SELECT 
    SUM(gross_income) AS total_gross_income,
    ROUND(AVG(gross_margin_percentage), 2) AS avg_gross_margin_percentage
FROM supermarket;

SELECT 
    Branch,
    Product_line,
    ROUND(AVG(Rating),2) AS avg_rating,
    COUNT(*) AS total_reviews
FROM supermarket
GROUP BY Branch, Product_line
ORDER BY avg_rating DESC;


SELECT 
    Customer_type, Payment, Product_line,
    ROUND(AVG(Rating),2) AS avg_rating
FROM supermarket
GROUP BY Customer_type, Payment, Product_line
ORDER BY avg_rating DESC;






