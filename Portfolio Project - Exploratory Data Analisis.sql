-- Exploratory Data Analysis (EDA) - Layoffs Dataset


SELECT * 
FROM world_layoffs.layoffs_staging2;


-- 1. Maximum Number of Employees Laid Off
-- Find the highest single layoff recorded in the dataset

SELECT MAX(total_laid_off)
FROM world_layoffs.layoffs_staging2;



-- 2. Maximum and Minimum Layoff Percentage
-- Analyze the largest and smallest layoff percentages

SELECT MAX(percentage_laid_off), MIN(percentage_laid_off)
FROM world_layoffs.layoffs_staging2
WHERE percentage_laid_off IS NOT NULL;



-- 3. Companies with 100% Layoffs
-- Identify companies that laid off all employees

SELECT *
FROM world_layoffs.layoffs_staging2
WHERE percentage_laid_off = 1;



-- 4. Companies with 100% Layoffs Ordered by Funding
-- See which fully closed companies had the highest funding

SELECT *
FROM world_layoffs.layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;



-- 5. Top 5 Biggest Single Layoffs
-- Find companies with the largest layoffs in a single event

SELECT company, total_laid_off
FROM world_layoffs.layoffs_staging
ORDER BY 2 DESC
LIMIT 5;



-- 6. Companies with the Highest Total Layoffs
-- Calculate total layoffs by company

SELECT company, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;



-- 7. Locations with the Highest Total Layoffs
-- Analyze layoffs based on location

SELECT location, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;



-- 8. Total Layoffs by Country
-- Identify countries with the highest layoffs

SELECT country, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;



-- 9. Total Layoffs by Year
-- Analyze yearly layoff trends

SELECT YEAR(date), SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY YEAR(date)
ORDER BY 1 ASC;



-- 10. Total Layoffs by Industry
-- Determine which industries were most affected

SELECT industry, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;



-- 11. Total Layoffs by Company Stage
-- Analyze layoffs based on company business stage

SELECT stage, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;



-- 12. Top 3 Companies with Highest Layoffs Per Year
-- Rank companies by total layoffs each year using CTE and DENSE_RANK

WITH Company_Year AS 
(
    SELECT company,
           YEAR(date) AS years,
           SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY company, YEAR(date)
),

Company_Year_Rank AS
(
    SELECT company,
           years,
           total_laid_off,
           DENSE_RANK() OVER (
               PARTITION BY years
               ORDER BY total_laid_off DESC
           ) AS ranking
    FROM Company_Year
)

SELECT company,
       years,
       total_laid_off,
       ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;



-- 13. Monthly Total Layoffs
-- Calculate total layoffs for each month

SELECT SUBSTRING(date,1,7) AS dates,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC;



-- 14. Rolling Total of Monthly Layoffs
-- Calculate cumulative layoffs over time using window function

WITH DATE_CTE AS
(
    SELECT SUBSTRING(date,1,7) AS dates,
           SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY dates
    ORDER BY dates ASC
)

SELECT dates,
       SUM(total_laid_off) OVER (
           ORDER BY dates ASC
       ) AS rolling_total_layoffs
FROM DATE_CTE
ORDER BY dates ASC;



