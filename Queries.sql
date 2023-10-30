CREATE DATABASE economicfreedom

SELECT *
FROM population

SELECT * 
FROM income_group

SELECT * 
FROM region

SELECT *
FROM freedom_scores

SELECT *
FROM gdp_capita

SELECT * 
FROM gdp

-- Getting the population fo each country
SELECT
r.CountryName,
region,
Population
FROM region as r
JOIN population as p on p.CountryCode = r.CountryCode


-- Calculation population by region
SELECT
region,
SUM(Population) AS Regional_pop
FROM region as r
JOIN population as p on p.CountryCode = r.CountryCode
GROUP BY region
ORDER BY Regional_pop DESC

-- Counting countries by region
SELECT
COUNT(*)
FROM region

-- Exploring freedom scores
SELECT *
FROM freedom_scores
WHERE `Index Year` = 2022

-- Changing column name for consistency
ALTER TABLE `economicfreedom`.`freedom_scores` 
CHANGE COLUMN `Name` `CountryName` TEXT NULL DEFAULT NULL;


SELECT
	fs.CountryName,
	Region,
	`Government Integrity`,
	`Business Freedom`,
	`Index Year`
FROM freedom_scores AS fs
JOIN region AS r on r.countryName = fs.CountryName
WHERE `Index Year` = 2022

-- Nigeria's government integrity and business freedom
SELECT
	fs.CountryName,
	Region,
	`Government Integrity`,
	`Business Freedom`,
	`Index Year`
FROM freedom_scores AS fs
JOIN region AS r on r.countryName = fs.CountryName
WHERE `Index Year` IN (2020,2021,2022,2023) AND fs.CountryName = 'Nigeria'

-- Income group
WITH Nigeria_score AS (
SELECT
	fs.CountryName,
	Region,
	`Government Integrity`,
	`Business Freedom`,
	`Index Year`
FROM freedom_scores AS fs
JOIN region AS r on r.countryName = fs.CountryName
WHERE `Index Year` IN (2020,2021,2022,2023) AND fs.CountryName = 'Nigeria'
)
SELECT
	ng.CountryName,
    Region,
    `Government Integrity`,
    `Business Freedom`,
    `Index Year`,
    population,
    Incomegroup
FROM Nigeria_score AS ng
JOIN income_group AS ig ON ig.CountryName = ng.CountryName

-- Sub-saharan countries
WITH subsaharan_africa AS (
SELECT
r.CountryName,
Region,
Incomegroup
FROM region AS r
JOIN income_group AS ig on ig.CountryName = r.CountryName
WHERE Region = 'Sub-Saharan Africa'
)
SELECT
sa.CountryName,
Incomegroup,
`Government Integrity`,
`Business Freedom`,
`Financial Freedom`,
`Property Rights`,
`Tax Burden`
FROM subsaharan_africa as sa
JOIN freedom_scores as fs on fs.CountryName = sa.CountryName
WHERE `Tax Burden` > 80
ORDER BY `Tax Burden` DESC



