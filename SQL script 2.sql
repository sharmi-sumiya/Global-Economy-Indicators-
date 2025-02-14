--Calculate total exports of goods and services by each country: 

SELECT Country, SUM(Exports_of_goods_and_services) AS TotalExports
FROM indicators
GROUP BY Country  -- Important: Group by Country to get sums per country
ORDER BY TotalExports;

-- show countries construction year:
SELECT Country,Year,Construction_ISIC_F
FROM indicators
ORDER BY Country,Year;

-- show Population growth for countries for last 50 years:

SELECT c1.Country,
       c1.Year,
       c1.Population,
       (c1.Population - c2.Population) * 100.0 / c2.Population AS PopulationGrowthPercentage
FROM indicators c1  -- Alias the table for easier referencing
JOIN indicators c2 ON c1.Country = c2.Country AND c2.Year = (c1.Year - 1)  -- Join with the previous year's data
WHERE c1.Year BETWEEN (SELECT MAX(Year) - 49 FROM indicators) AND (SELECT MAX(Year) FROM indicators) -- Last 50 years
ORDER BY c1.Country, c1.Year;



