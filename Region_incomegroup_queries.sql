-- List all regions in the database
SELECT
	DISTINCT(Region)
FROM region

-- List all income groups in the database
SELECT
	DISTINCT(incomegroup)
FROM income_group

-- Which region has the highest total GDP?
SELECT
	Region,
	ROUND(SUM(`GDP (Billions)`),2) AS 'Total_gdp(Billions)'
FROM region AS r
JOIN gdp AS g on g.CountryName = r.CountryName
GROUP BY Region
ORDER BY 'Total_gdp(Billions)' DESC

-- Which income group has the highest average GDP per capita?
SELECT
	Incomegroup,
	ROUND(AVG(`GDP Per Capita`),2) AS AvgGDP_Percapita
FROM income_group AS ig
JOIN gdp_capita AS gc ON gc.CountryName = ig.CountryName
GROUP BY IncomeGroup
ORDER BY AvgGDP_Percapita DESC

-- Which region has the highest average GDP per capita?
SELECT
Region,
ROUND(AVG(`GDP Per Capita`),2) AS AvgGDP_Percapita
FROM region AS r
JOIN gdp_capita AS gc ON gc.CountryName = r.CountryName
GROUP BY Region
ORDER BY AvgGDP_Percapita DESC

-- Which countries belong to a specific region or income group?
SELECT
	r.CountryName,
	Region,
	Incomegroup
FROM region AS r
JOIN income_group AS ig ON ig.CountryName = r.CountryName
WHERE Region = 'Europe & Central Asia'
ORDER BY CountryName
