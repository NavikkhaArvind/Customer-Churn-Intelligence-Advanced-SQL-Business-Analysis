USE customer_churn;

-- =========================================================
-- REVENUE ANALYSIS
-- =========================================================

-- Q1. Total Revenue
SELECT
    ROUND(SUM(TotalCharges),2) AS Total_Revenue
FROM customer_churn_data;

-- Q2. Average Monthly Charges
SELECT
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charge
FROM customer_churn_data;

-- Q3. Average Total Charges
SELECT
    ROUND(AVG(TotalCharges),2) AS Avg_Total_Charges
FROM customer_churn_data;

-- Q4. Revenue by Contract Type
SELECT
    Contract,
    ROUND(SUM(TotalCharges),2) AS Revenue
FROM customer_churn_data
GROUP BY Contract
ORDER BY Revenue DESC;

-- Q5. Revenue by State
SELECT
    State,
    ROUND(SUM(TotalCharges),2) AS Revenue
FROM customer_churn_data
GROUP BY State
ORDER BY Revenue DESC;

-- Q6. Revenue by Internet Service
SELECT
    InternetService,
    ROUND(SUM(TotalCharges),2) AS Revenue
FROM customer_churn_data
GROUP BY InternetService
ORDER BY Revenue DESC;

-- Q7. Revenue by Payment Method
SELECT
    PaymentMethod,
    ROUND(SUM(TotalCharges),2) AS Revenue
FROM customer_churn_data
GROUP BY PaymentMethod
ORDER BY Revenue DESC;

-- Q8. Revenue Lost Due to Churn
SELECT
    ROUND(SUM(TotalCharges),2) AS Revenue_Lost
FROM customer_churn_data
WHERE Churn='Yes';

-- Q9. Top 10 Highest Revenue Customers
SELECT
    CustomerID,
    TotalCharges
FROM customer_churn_data
ORDER BY TotalCharges DESC
LIMIT 10;

-- Q10. Top 5 States by Revenue
SELECT
    State,
    ROUND(SUM(TotalCharges),2) AS Revenue
FROM customer_churn_data
GROUP BY State
ORDER BY Revenue DESC
LIMIT 5;
