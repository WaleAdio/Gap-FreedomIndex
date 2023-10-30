-- What is the average freedom score for all countries?
SELECT * 
FROM freedom_scores
WHERE `Index Year` = 2022

SELECT
	CountryName,
	AVG(`Overall Score`) AS AvgFreedomscore
FROM freedom_scores
WHERE `Index Year` = 2022
GROUP BY CountryName

SELECT
ROUND(AVG(`Overall Score`),2) AS AvgFreedomscore
FROM freedom_scores

-- What is the average freedom index for all countries?
SELECT * 
FROM freedom_index22

SELECT 
ROUND(AVG(`Overall Score`),3) AS AvgScore
FROM freedom_index22
-- Average score is 59.998

-- Which countries have a freedom index above a certain threshold?
SELECT
	CountryName,
	`Overall Score`
FROM freedom_index22
WHERE `Overall Score` >= 60
ORDER BY `Overall Score` DESC

SELECT
	CountryName,
	`Property Rights`,
	`Government Integrity`
FROM freedom_index22
WHERE `Property Rights` <= 50 AND `Government Integrity` <= 50
ORDER BY `Property Rights` DESC

-- Which countries have the highest and lowest freedom scores?
SELECT
	CountryName,
	`Overall Score`
FROM freedom_index22
ORDER BY `Overall Score` DESC
LIMIT 5

SELECT
	CountryName,
	`Overall Score`
FROM freedom_index22
WHERE `Overall Score` IS NOT NULL
ORDER BY `Overall Score` ASC
LIMIT 5

-- Is there a correlation between GDP per capita and freedom scores?
SELECT
	g.CountryName,
	`GDP Per Capita`,
	`Overall Score`,
    `Property Rights`,
    `Government Integrity`,
    `Business Freedom`,
    `Tax Burden`
FROM gdp_capita AS g
JOIN freedom_index22 AS fi ON fi.CountryName = g.CountryName

-- Is there a correlation between GDP and freedom scores?
SELECT
	g.CountryName,
    `GDP (Billions)`,
    `Overall Score`,
	`Property Rights`,
    `Government Integrity`,
    `Business Freedom`,
    `Tax Burden`
FROM gdp AS g
JOIN freedom_index22 AS fi ON fi.CountryName = g.CountryName


-- Correlation to be run on Rstudio






