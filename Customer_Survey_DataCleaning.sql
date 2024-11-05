-- Data Cleaning
-- Check for missing values
-- Identify and handle duplicates
-- Standardize Data
-- Check for correct Typos and Inconsistent Entries

-- DISPLAY THE COMPLETE DATASETS
SELECT * 
FROM customer_survey_dirty;

-- CHECKING FOR MISSING VALUES AND HANDLING THEM

SELECT *
FROM customer_survey_dirty
WHERE customer_id IS NULL;

-- Drop Rows where customer ID is Null
DELETE
FROM customer_survey_dirty
WHERE customer_id IS NULL;

-- Drop column order_id
ALTER TABLE customer_survey_dirty
DROP COLUMN order_id;

SELECT *
FROM customer_survey_dirty
WHERE delivery_rating = 'N/A';

-- delete rows where delivery_rating is = N/A
DELETE
FROM customer_survey_dirty
WHERE delivery_rating = 'N/A';

-- delete rows where food_quality_rating is null
DELETE
FROM customer_survey_dirty
WHERE food_quality_rating IS NULL;

-- Checking distinct responses for the field 'delivery_time_satisfaction'
SELECT DISTINCT(delivery_time_satisfaction)
FROM customer_survey_dirty;

-- Checking distinct responses for the field 'suggestions_for_improvement'
SELECT DISTINCT(suggestions_for_improvement)
FROM customer_survey_dirty;

-- Setting MISSING or NULL values in the field 'suggestions_for_improvement to No suggestions'
UPDATE customer_survey_dirty
SET suggestions_for_improvement = 'No suggestions'
WHERE suggestions_for_improvement IS NULL;

-- Correcting wrong spelling in the field 'suggestions_for_improvement'
UPDATE customer_survey_dirty
SET suggestions_for_improvement = 'More payment options'
WHERE suggestions_for_improvement LIKE 'More%';

-- Checking distinct responses for the field 'would_recommend'
SELECT DISTINCT(would_recommend)
FROM customer_survey_dirty;

-- Set NULL OR MISSING values in the field would_recommend to 'No'
UPDATE customer_survey_dirty
SET would_recommend = 'No'
WHERE would_recommend IS NULL;

-- Dropping rows where order_frequency is NULL
DELETE
FROM customer_survey_dirty
WHERE order_frequency IS NULL;


-- STANDARDIZING THE DATA FOR EACH COLUMN

DESCRIBE customer_survey_dirty;

-- standardizing data for customer_id
UPDATE customer_survey_dirty
SET customer_id = CONCAT('CUST',
SUBSTRING(CAST(customer_id AS CHAR), 9))
WHERE customer_id LIKE 'customer%';

-- checking to see if the changes where affected
SELECT *
FROM customer_survey_dirty
WHERE customer_id LIKE 'customer%';

-- Standardizing the 'delivery_time_satisfaction' column
SELECT DISTINCT(delivery_time_satisfaction)
FROM customer_survey_dirty;

UPDATE customer_survey_dirty
SET delivery_time_satisfaction = 'Very dissatisfied'
WHERE delivery_time_satisfaction LIKE '%dissatisfied';

UPDATE customer_survey_dirty
SET delivery_time_satisfaction = 'Dissatisfied'
WHERE delivery_time_satisfaction = 'Disastisfied';

-- checking for inconsistencies in 'suggestions_for_improvement'
SELECT DISTINCT(suggestions_for_improvement)
FROM customer_survey_dirty;

-- checking for inconsistencies in 'order_frequency'
SELECT DISTINCT(order_frequency)
FROM customer_survey_dirty;

-- standardizing 'order_frequency' columns
UPDATE customer_survey_dirty
SET order_frequency = 'Daily'
WHERE order_frequency LIKE 'DAI%';

-- Viewing Full Dataset
SELECT *
FROM customer_survey_dirty;

