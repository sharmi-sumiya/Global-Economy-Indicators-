-- show country by gross national income in USD and imports goods and services for year 2020: 
SELECT Country, Gross_National_Income_GNI_in_USD, Imports_of_goods_and_services
FROM indicators
where year IN (2020)
ORDER BY Country;


-- show max GDP for last 50 years per country:
SELECT Country, MAX(Gross_Domestic_Product_GDP) AS MaxGDP
FROM indicators  
WHERE Year >= (SELECT MAX(Year) - 49 FROM indicators)
GROUP BY Country
ORDER BY MaxGDP DESC  
