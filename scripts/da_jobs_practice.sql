-- 1. How many rows are in the data_analyst_jobs table?
-- 1793 rows
SELECT COUNT(title)
FROM data_analyst_jobs;

-- 2. Write a query to look at just the first 10 rows.
-- 		What company is associated with the job posting on the 10th row?
-- ExxonMobil
SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- 3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
-- TN: 17 postings
-- TN or KY: 21 postings
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'TN' 
OR location = 'KY';

-- 4. How many postings in Tennessee have a star rating above 4?
-- 3 postings
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;

-- 5. How many postings in the dataset have a review count between 500 and 1000?
-- 108 postings

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- 6. 







