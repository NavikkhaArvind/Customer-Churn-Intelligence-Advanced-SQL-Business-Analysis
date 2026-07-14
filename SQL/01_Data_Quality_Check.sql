USE customer_churn;

-- Total Records
SELECT COUNT(*) AS Total_Records
FROM customer_churn_data;

-- Duplicate Customer IDs
SELECT CustomerID,
COUNT(*) AS Duplicate_Count
FROM customer_churn_data
GROUP BY CustomerID
HAVING COUNT(*) > 1;

-- Missing Values Summary
SELECT
SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS CustomerID_Nulls,
SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Nulls,
SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Nulls,
SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS MonthlyCharges_Nulls,
SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS TotalCharges_Nulls,
SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS Churn_Nulls
FROM customer_churn_data;

-- Invalid Age
SELECT *
FROM customer_churn_data
WHERE Age < 18 OR Age > 100;

-- Invalid Monthly Charges
SELECT *
FROM customer_churn_data
WHERE MonthlyCharges <= 0;

-- Invalid Total Charges
SELECT *
FROM customer_churn_data
WHERE TotalCharges < 0;

-- Invalid Tenure
SELECT *
FROM customer_churn_data
WHERE TenureMonths < 0;

-- Available Contract Types
SELECT DISTINCT Contract
FROM customer_churn_data;

-- Available Payment Methods
SELECT DISTINCT PaymentMethod
FROM customer_churn_data;

-- Available Churn Values
SELECT DISTINCT Churn
FROM customer_churn_data;
