-- Basic information queries

-- 1. What are the names of all the countries in the database?
SELECT
CountryName
FROM region

-- 2. How many countries are included in the database?
SELECT
COUNT(*) AS Country_count
FROM region

-- 3. What is the total GDP and Population in the database?
SELECT
ROUND(SUM(`GDP (Billions)`),2) AS TotalGDP,
SUM(Population) AS TotalPopulation
FROM gdp AS g
JOIN population AS p on p.CountryName = g.CountryName
