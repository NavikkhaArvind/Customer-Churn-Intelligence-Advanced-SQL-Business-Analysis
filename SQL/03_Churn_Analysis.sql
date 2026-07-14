USE customer_churn;

-- =========================================================
-- CHURN ANALYSIS
-- =========================================================

-- Q1. Overall Churn Rate
SELECT
    Churn,
    COUNT(*) AS Customers,
    ROUND(COUNT(*) * 100.0 /
    (SELECT COUNT(*) FROM customer_churn_data),2) AS Percentage
FROM customer_churn_data
GROUP BY Churn;

-- Q2. Churn by Gender
SELECT
    Gender,
    Churn,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY Gender, Churn
ORDER BY Gender;

-- Q3. Churn by Age Group
SELECT
CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+'
END AS Age_Group,
Churn,
COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY Age_Group, Churn
ORDER BY Age_Group;

-- Q4. Churn by Contract Type
SELECT
    Contract,
    Churn,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY Contract, Churn
ORDER BY Contract;

-- Q5. Churn by Payment Method
SELECT
    PaymentMethod,
    Churn,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY PaymentMethod, Churn
ORDER BY PaymentMethod;

-- Q6. Churn by Internet Service
SELECT
    InternetService,
    Churn,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY InternetService, Churn
ORDER BY InternetService;

-- Q7. Churn by State
SELECT
    State,
    Churn,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY State, Churn
ORDER BY State;

-- Q8. Average Monthly Charges by Churn
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges
FROM customer_churn_data
GROUP BY Churn;

-- Q9. Average Tenure by Churn
SELECT
    Churn,
    ROUND(AVG(TenureMonths),2) AS Avg_Tenure
FROM customer_churn_data
GROUP BY Churn;

-- Q10. Top 10 High-Risk Customers
SELECT
    CustomerID,
    MonthlyCharges,
    TenureMonths,
    SatisfactionScore,
    Churn
FROM customer_churn_data
WHERE Churn='Yes'
ORDER BY MonthlyCharges DESC
LIMIT 10;
