USE customer_churn;

-- =========================================================
-- CUSTOMER PROFILE ANALYSIS
-- =========================================================

-- Q1. Total Number of Customers
SELECT COUNT(*) AS Total_Customers
FROM customer_churn_data;

-- Q2. Customer Distribution by Gender
SELECT
    Gender,
    COUNT(*) AS Total_Customers
FROM customer_churn_data
GROUP BY Gender
ORDER BY Total_Customers DESC;

-- Q3. Customer Distribution by Age Group
SELECT
CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+'
END AS Age_Group,
COUNT(*) AS Total_Customers
FROM customer_churn_data
GROUP BY Age_Group
ORDER BY Total_Customers DESC;

-- Q4. Senior Citizen Distribution
SELECT
    SeniorCitizen,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY SeniorCitizen;

-- Q5. Customers by Partner Status
SELECT
    Partner,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY Partner;

-- Q6. Customers by Dependents
SELECT
    Dependents,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY Dependents;

-- Q7. Customers by State
SELECT
    State,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY State
ORDER BY Customers DESC;

-- Q8. Top 10 Cities by Customer Count
SELECT
    City,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY City
ORDER BY Customers DESC
LIMIT 10;

-- Q9. Contract Type Distribution
SELECT
    Contract,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY Contract
ORDER BY Customers DESC;

-- Q10. Internet Service Distribution
SELECT
    InternetService,
    COUNT(*) AS Customers
FROM customer_churn_data
GROUP BY InternetService
ORDER BY Customers DESC;
