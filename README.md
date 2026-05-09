# Exploratory Data Analysis of Global Layoffs Using SQL

## Project Overview
This project performs Exploratory Data Analysis (EDA) on a global layoffs dataset using MySQL to uncover trends, patterns, and insights related to workforce reductions across different companies, industries, countries, and business stages.

The analysis focuses on understanding how layoffs evolved over time, identifying companies with the highest layoffs, and determining which industries and regions were most impacted. The project also examines companies that laid off 100% of their employees and analyzes the relationship between company funding and layoffs.

The project applies various SQL techniques such as:

- Aggregate Functions
- GROUP BY
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
- Rolling Totals

## Dataset Information
The dataset contains information about company layoffs across various industries and countries.

- company → Name of the company that conducted layoffs
- location → City or region where the company is based
- industry → Industry sector of the company (e.g., Tech, Finance, Crypto)
- total_laid_off → Total number of employees laid off
- percentage_laid_off → Percentage of employees laid off (relative to company size)
- date → Date when the layoff occurred
- stage → Business stage of the company (e.g., Startup, Post-IPO)
- country → Country where the company operates
- funds_raised_millions → Total funding raised by the company (in millions USD)

Source: https://www.kaggle.com/datasets/swaptr/layoffs-2022 

## Tools Used
- SQL
- MySQL Workbench

## Steps of Exploratory Data Analysis
### 1. Exploring the Dataset

The first step was checking the entire dataset to understand the structure, columns, and available data.

- SQL Concepts Used:

  - SELECT

  - FROM

- Objective  → To get an overview of the dataset before starting the analysis.

### 2. Finding the Largest Layoffs

The analysis identified the maximum number of employees laid off in a single event.

- SQL Concepts Used

  - MAX()

- Objective To determine the biggest layoff event recorded in the dataset.

### 3. Analyzing Layoff Percentages

The project analyzed the highest and lowest layoff percentages.

- SQL Concepts Used

  - MAX()

  - MIN()

  - WHERE

- Objective To understand the scale of layoffs experienced by companies.

### 4. Identifying Companies with 100% Layoffs

The analysis filtered companies that laid off all employees.

- SQL Concepts Used

  - WHERE clause

- Objective To identify companies that completely shut down operations.

### 5. Analyzing Funding of Fully Closed Companies

Companies with 100% layoffs were sorted by funding raised.

- SQL Concepts Used

  - ORDER BY

- Objective To analyze whether highly funded companies were still vulnerable to failure.

### 6. Finding Companies with the Biggest Single Layoffs

The project identified companies with the largest layoffs in one event.

- SQL Concepts Used

  - ORDER BY

  - LIMIT

- Objective To identify the most significant layoff announcements.

### 7. Calculating Total Layoffs by Company

The analysis calculated cumulative layoffs for each company.

- SQL Concepts Used

  - SUM()

  - GROUP BY

- Objective To determine which companies had the highest total layoffs.

### 8. Analyzing Layoffs by Location and Country

Layoff totals were analyzed based on cities and countries.

- SQL Concepts Used

  - GROUP BY

  - SUM()

- Objective To identify regions most affected by layoffs.

### 9. Analyzing Layoffs by Year

The project grouped layoffs by year to observe yearly trends.

- SQL Concepts Used

  - YEAR()

  -GROUP BY

- Objective To analyze how layoffs changed over time.

### 10. Analyzing Layoffs by Industry

The analysis grouped layoffs by industry sector.

- SQL Concepts Used

  - GROUP BY

  - SUM()

- Objective To determine which industries experienced the highest layoffs.

### 11. Analyzing Layoffs by Company Stage

Layoffs were analyzed based on business stages such as Startup, Series A, and Post-IPO.

- SQL Concepts Used

  - GROUP BY

- Objective To understand which business stages were most impacted.

### 12. Ranking Top Companies with Highest Layoffs Per Year

This analysis used CTEs and window functions to rank companies with the highest layoffs annually.

- SQL Concepts Used

  - CTE (WITH)

  - DENSE_RANK()

  - PARTITION BY

  - Window Functions

-Objective To identify the top companies with the largest layoffs each year.

### 13. Monthly Layoff Trend Analysis

The project grouped layoffs by month using the SUBSTRING() function.

- SQL Concepts Used

  - SUBSTRING()

  - GROUP BY

- Objective To analyze monthly layoff trends over time.

### 14. Calculating Rolling Total Layoffs

A rolling cumulative total of layoffs was created using window functions.

- SQL Concepts Used

  - CTE

  - SUM() OVER()

  - Window Functions

- Objective To visualize the growth of layoffs over time.


## Key Insights
1. Several companies laid off 100% of their workforce, indicating business shutdowns.
2. The technology industry experienced some of the largest layoffs.
3. Layoffs increased significantly during certain years and months.
4. Some highly funded companies still experienced major layoffs.
5. Layoff trends varied across industries, countries, and business stages.


## SQL Skills Demonstrated
- Data Exploration
- Data Aggregation
- Data Filtering
- Data Grouping
- Window Functions
- Common Table Expressions (CTEs)
- Ranking Functions
- Time-Series Analysis
- Business Insight Analysis
