-- Which country has the highest GDP?
SELECT *
FROM gdp
ORDER BY `GDP (Billions)` DESC
LIMIT 10

-- WHich country has the lowest GDP?
SELECT *
FROM gdp
ORDER BY `GDP (Billions)` ASC
LIMIT 15

-- What is the GDP per capita across all countries?
WITH Calculation AS (
SELECT
	g.CountryName,
	g.`GDP (Billions)`,
	p.Population,
	g.`GDP (Billions)` * 1000000000 AS GDPBil
FROM gdp AS g
JOIN population AS p ON p.CountryName = g.CountryName
)
SELECT
	CountryName,
    `GDP (Billions)`,
    Population,
    ROUND(GDPBil/Population,2) AS "GDP per Capita"
FROM Calculation

-- What is the avergage GDP per capita across all countries
SELECT
ROUND(AVG(`GDP Per Capita`),2) AS Averagegdp_percapita
FROM gdp_capita

-- Which country has the highest population?
SELECT
	CountryName,
    Population
FROM population
ORDER BY population DESC
LIMIT 5

-- Which country has the lowest population?
SELECT
	CountryName,
    Population
FROM population
ORDER BY population ASC
LIMIT 5

-- What is the average population for all countries?
SELECT
ROUND(AVG(Population),2) AS Average_population
FROM population

-- What is the GDP per capita of a specific country (Nigeria)?
SELECT *
FROM gdp_capita
WHERE CountryName = 'Nigeria'

WITH Calculation AS (
SELECT
	g.CountryName,
	g.`GDP (Billions)`,
	p.Population,
	g.`GDP (Billions)` * 1000000000 AS GDPBil
FROM gdp AS g
JOIN population AS p ON p.CountryName = g.CountryName
)
SELECT
	CountryName,
    `GDP (Billions)`,
    Population,
    ROUND(GDPBil/Population,2) AS "GDP per Capita"
FROM Calculation
WHERE CountryName = 'Nigeria'
