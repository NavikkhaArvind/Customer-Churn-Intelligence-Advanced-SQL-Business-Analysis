USE customer_churn;

-- 1. Which state has the highest churn?
SELECT
    State,
    COUNT(*) AS Churned_Customers
FROM customer_churn_data
WHERE Churn = 'Yes'
GROUP BY State
ORDER BY Churned_Customers DESC;

-- 2. Which contract type has the highest churn?
SELECT
    Contract,
    COUNT(*) AS Churned_Customers
FROM customer_churn_data
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY Churned_Customers DESC;

-- 3. Which payment method has the highest churn?
SELECT
    PaymentMethod,
    COUNT(*) AS Churned_Customers
FROM customer_churn_data
WHERE Churn = 'Yes'
GROUP BY PaymentMethod
ORDER BY Churned_Customers DESC;

-- 4. Which internet service has the highest churn?
SELECT
    InternetService,
    COUNT(*) AS Churned_Customers
FROM customer_churn_data
WHERE Churn = 'Yes'
GROUP BY InternetService
ORDER BY Churned_Customers DESC;

-- 5. Average satisfaction score of churned customers
SELECT
    ROUND(AVG(SatisfactionScore),2) AS Avg_Satisfaction
FROM customer_churn_data
WHERE Churn='Yes';

-- 6. Average support tickets by churn status
SELECT
    Churn,
    ROUND(AVG(SupportTickets),2) AS Avg_Support_Tickets
FROM customer_churn_data
GROUP BY Churn;

-- 7. Average complaints by churn status
SELECT
    Churn,
    ROUND(AVG(Complaints),2) AS Avg_Complaints
FROM customer_churn_data
GROUP BY Churn;

-- 8. Top 10 customers with highest total charges
SELECT
    CustomerID,
    TotalCharges
FROM customer_churn_data
ORDER BY TotalCharges DESC
LIMIT 10;

-- 9. Customers who accepted offers but still churned
SELECT
    COUNT(*) AS Customers
FROM customer_churn_data
WHERE OfferAccepted='Yes'
AND Churn='Yes';

-- 10. Customers who did not accept offers and churned
SELECT
    COUNT(*) AS Customers
FROM customer_churn_data
WHERE OfferAccepted='No'
AND Churn='Yes';
