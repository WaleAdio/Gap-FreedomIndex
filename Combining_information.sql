-- What is the GDP per capita for countries in a specific region?
SELECT
	gc.CountryName,
	Region,
	ROUND(`GDP Per Capita`,2)
FROM gdp_capita AS gc
JOIN region AS r ON r.CountryName = gc.CountryName
WHERE Region = 'Europe & Central Asia'

-- How does the income group of a country relate to its GDP?
SELECT
	g.CountryName,
	ROUND(`GDP (Billions)`,2),
	Incomegroup
FROM gdp AS g
JOIN income_group AS ig ON ig.CountryName = g.CountryName

-- Are there any countries with high GDP but low freedom scores?
WITH GDP_Level AS (
SELECT
	CountryName,
	`GDP (Billions)`,
	CASE
		WHEN `GDP (Billions)` > 1000 THEN 'High Gdp'
        WHEN `GDP (Billions)` > 250 THEN 'Medium Gdp'
        ELSE 'Low Gdp'
	END AS GDP_Level
FROm gdp
ORDER BY GDP_Level
)
SELECT
	fi.CountryName,
	`Overall Score`,
	`GDP (Billions)`,
	GDP_Level
FROM freedom_index22 AS fi
JOIN GDP_Level AS gl ON gl.CountryName = fi.CountryName
WHERE `Overall Score` < 60
	AND GDP_Level = 'High Gdp'
