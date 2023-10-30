-- Compare the GDP per capita of countries in different income groups or regions.
-- Income Group
SELECT
IncomeGroup,
ROUND(AVG(`GDP Per Capita`),2) AS AvgGdp_Percapita
FROM gdp_capita AS gp
JOIN income_group AS ig ON ig.CountryName = gp.CountryName
GROUP BY IncomeGroup
ORDER BY AvgGdp_Percapita DESC

-- Region
SELECT
Region,
ROUND(AVG(`GDP Per Capita`),2) AS AvgGdp_Percapita
FROM gdp_capita AS gp
JOIN region AS r ON r.CountryName = gp.CountryName
GROUP BY Region
ORDER BY AvgGdp_Percapita DESC

-- Compare the average freedom scores of countries in different regions.
SELECT
Region,
ROUND(AVG(`Overall Score`), 2) AS Avgoverall_score,
ROUND(AVG(`Property Rights`), 2) AS AvgProperty_rights,
ROUND(AVG(`Government Integrity`), 2) AS AvgGovernment_integrity,
ROUND(AVG(`Tax Burden`), 2) AS AvgTax_burden
FROM freedom_index22 AS fi
JOIN region AS r ON r.CountryName = fi.CountryName
GROUP BY Region
ORDER BY Avgoverall_score DESC

-- Calculate the GDP growth rate for each country over a specified period.


-- Identify countries with a high GDP but low population.
WITH Gdp_Level AS (
SELECT
	CountryName,
	`GDP (Billions)`,
	CASE
		WHEN `GDP (Billions)` > 500 THEN 'High Gdp'
        WHEN `GDP (Billions)` > 250 THEN 'Medium Gdp'
        ELSE 'Low Gdp'
	END AS GDP_Level
FROm gdp
ORDER BY GDP_Level
)
SELECT
	gl.CountryName,
	p.Population,
	gl.`GDP (Billions)`,
	gl.GDP_Level
FROM Gdp_Level AS gl
JOIN population AS p ON p.CountryName = gl.CountryName
WHERE GDP_Level = 'High Gdp' 
	AND Population < 20000000