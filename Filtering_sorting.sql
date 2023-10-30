-- List countries with a GDP per capita between a specific range
SELECT * 
FROM gdp_capita
WHERE `GDP Per Capita` BETWEEN 15000 AND 30000
ORDER BY `GDP Per Capita` DESC


SELECT
	CountryName,
	`GDP Per Capita`,
CASE
	WHEN `GDP Per Capita` > 25000 THEN 'High Per Capita'
    WHEN `GDP Per Capita` > 10000 THEN 'Mid Per Capita'
    ELSE 'Low Per Capita'
END AS 'PerCapita_Level'
FROM gdp_capita

-- Sort countries by GDP in descending order.
SELECT *
FROM gdp
ORDER BY `GDP (Billions)` DESC

-- Sort countries by freedom scores in ascending order.
SELECT
CountryName,
`Overall Score`,
`Property Rights`,
`Government Integrity`
FROM freedom_index22
ORDER BY `Property Rights` ASC
