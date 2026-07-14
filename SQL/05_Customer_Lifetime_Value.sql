USE customer_churn;

-- =========================================================
-- CUSTOMER LIFETIME VALUE (CLV) ANALYSIS
-- =========================================================

-- Q1. Calculate Customer Lifetime Value (CLV)
SELECT
    CustomerID,
    ROUND(MonthlyCharges * TenureMonths,2) AS Customer_Lifetime_Value
FROM customer_churn_data
ORDER BY Customer_Lifetime_Value DESC;

-- Q2. Top 10 Customers by CLV
SELECT
    CustomerID,
    ROUND(MonthlyCharges * TenureMonths,2) AS Customer_Lifetime_Value
FROM customer_churn_data
ORDER BY Customer_Lifetime_Value DESC
LIMIT 10;

-- Q3. Average CLV by Contract Type
SELECT
    Contract,
    ROUND(AVG(MonthlyCharges * TenureMonths),2) AS Avg_CLV
FROM customer_churn_data
GROUP BY Contract
ORDER BY Avg_CLV DESC;

-- Q4. Average CLV by Internet Service
SELECT
    InternetService,
    ROUND(AVG(MonthlyCharges * TenureMonths),2) AS Avg_CLV
FROM customer_churn_data
GROUP BY InternetService
ORDER BY Avg_CLV DESC;

-- Q5. Average CLV by Payment Method
SELECT
    PaymentMethod,
    ROUND(AVG(MonthlyCharges * TenureMonths),2) AS Avg_CLV
FROM customer_churn_data
GROUP BY PaymentMethod
ORDER BY Avg_CLV DESC;

-- Q6. Average CLV by State
SELECT
    State,
    ROUND(AVG(MonthlyCharges * TenureMonths),2) AS Avg_CLV
FROM customer_churn_data
GROUP BY State
ORDER BY Avg_CLV DESC;

-- Q7. Average CLV of Churned vs Retained Customers
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges * TenureMonths),2) AS Avg_CLV
FROM customer_churn_data
GROUP BY Churn;

-- Q8. High Value Customers (CLV > 5000)
SELECT
    CustomerID,
    State,
    Contract,
    ROUND(MonthlyCharges * TenureMonths,2) AS CLV
FROM customer_churn_data
WHERE (MonthlyCharges * TenureMonths) > 5000
ORDER BY CLV DESC;

-- Q9. Top 5 States by Average CLV
SELECT
    State,
    ROUND(AVG(MonthlyCharges * TenureMonths),2) AS Avg_CLV
FROM customer_churn_data
GROUP BY State
ORDER BY Avg_CLV DESC
LIMIT 5;

-- Q10. Top 5 Contract Types by Average CLV
SELECT
    Contract,
    ROUND(AVG(MonthlyCharges * TenureMonths),2) AS Avg_CLV
FROM customer_churn_data
GROUP BY Contract
ORDER BY Avg_CLV DESC
LIMIT 5;
