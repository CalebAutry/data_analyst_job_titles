--#1 1793 titles
SELECT COUNT(title)
FROM data_analyst_jobs;

--#2 ExxonMobil on 10th row
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--#3 TN 21 jobs, TN or KY 27 jobs
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN'
OR location = 'KY';

--#4 TN >4stars 3 jobs
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating >4;

--#5 151 postings between 500 and 1000 review count
SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--#6 State with highest AVG rating?
--NE avg_rating 4.200
SELECT location AS state, ROUND(AVG(star_rating):: numeric, 3) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;

--#7 #unique job titles?
--881 unique job titles
SELECT COUNT(DISTINCT title) AS unique_titles_count
FROM data_analyst_jobs;

--#8 #unique job titles for California companies?
--230 unique title CA jobs
SELECT COUNT(DISTINCT title) AS unique_titles_count
FROM data_analyst_jobs
WHERE location = 'CA';

--#9 #company with >5k reviews across all locations?
-- 41 companies
SELECT company, ROUND(AVG(star_rating), 3) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > '5000'
GROUP BY company
ORDER BY avg_rating DESC;

--#10 company with more than 5000 reviews across all locations with highest star rating? star rating?
--General Motors, Unilever, Microsoft, Nike, American Express, and Kaiser Permanente all have 4.200
SELECT company, ROUND(AVG(star_rating), 3) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > '5000'
GROUP BY company
ORDER BY avg_rating DESC;

--#11 jobs w/ "Analyst", how many different jobs?
--774 different job titles with "analyst"
SELECT COUNT(DISTINCT title) AS analyst_titles
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';

--dajobs cols: title, skill, company, review_count, star_rating, days_since_posting, location, company_size, domain
--#12 # different job titles w/o "analyst" or "analytics"? these have in common?
--4 jobs, Tableau is common between theses 4 titles
SELECT DISTINCT title AS analyst_titles
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%'
AND title NOT ILIKE '%analytics%';

--Bonus 
--Valencia's code
SELECT DISTINCT(domain) AS industry,
COUNT(title) AS num_of_hard_to_fill_jobs,
MAX(skill) AS skill,
AVG(days_since_posting) AS days_since_posting
FROM data_analyst_jobs
WHERE domain IS NOT NULL
AND skill LIKE '%SQL%'
AND days_since_posting > 21
GROUP BY domain
ORDER BY num_of_hard_to_fill_jobs DESC;

--Mahesh's code
SELECT domain, COUNT(title) AS job_count
FROM data_analyst_jobs
WHERE UPPER(skill) LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY job_count DESC;