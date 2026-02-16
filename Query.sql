-- Count Cities in USA
SELECT COUNT(*) AS Total_US_Cities
FROM city
WHERE CountryCode = 'USA';
-- Country with highest life expectancy
SELECT Name, LifeExpectancy
FROM world.country
ORDER BY LifeExpectancy DESC
LIMIT 1;
-- Cities with New in it
SELECT Name AS City_Name
FROM city
WHERE Name LIKE '%New%';
-- Display columns with limited rows
SELECT Name, Population
FROM world.city
ORDER BY Population DESC
LIMIT 10;
-- Cities with population larger than 2M
SELECT Name, CountryCode, Population
FROM world.city
WHERE Population > 2000000
ORDER BY Population DESC;
-- Cities beginning with BE
SELECT 
     Name AS Cities_starting_with_be,
     CountryCode,
     District
FROM world.city
WHERE Name LIKE "BE%"
ORDER BY Name ASC;
-- Cities with Population Between 500,000-1,000,000
SELECT
     city.Name AS Mid_seized_cities,
     country.Name AS Country
FROM world.city
JOIN world.country ON city.CountryCode = country.Code
WHERE city.Population BETWEEN 500000 AND 1000000;
-- Cities Sorted by Name in Ascending Order
SELECT Name AS City_Name
FROM world.city
ORDER BY Name ASC;
-- Most Populated City
SELECT 
    city.Name AS 'Most Populated City',
    country.Name AS 'Country',
    city.Population
FROM world.city
JOIN world.country ON city.CountryCode = country.Code
ORDER BY city.Population DESC
LIMIT 1;
-- City Name Frequency Analysis
SELECT
     Name AS unique_city_name,
     COUNT(*) AS occirrence_count
FROM world.city
GROUP BY Name
ORDER BY Name ASC;
-- City with the lowest population
SELECT 
     city.Name AS "City_with_lowest_population",
     country.Name AS "Country",
     city.Population
FROM world.city
JOIN world.country ON city.CountryCode = country.Code
ORDER BY city.Population ASC
LIMIT 1;
-- Country with largest population
SELECT
     city.Name AS "City_with_largest_population",
     country.Name AS "Country",
     city.Population
FROM world.city
JOIN world.country ON city.CountryCode = country.Code
ORDER BY city.Population DESC
LIMIT 1;
-- Info about an specific country
SELECT *
FROM world.country
WHERE Name = "Spain";
-- Info about Europe
SELECT
    city.Name AS City,
    country.Name AS Country
FROM world.city
JOIN world.country ON city.CountryCode =country.Code
WHERE country.Continent = "Europe"
ORDER BY city.Name ASC;
-- Average Population by Country
SELECT
    country.Name,
    AVG(city.Population)
FROM world.city
JOIN world.country ON city.CountryCode = country.Code
GROUP BY country.Name;
-- Capital Cities Population Comparison 
SELECT
    country.Name AS Country,
    city.Name AS Capital_City,
    city.Population AS Capital_Pop,
    country.Population AS Total_Country_Pop
FROM world.country
JOIN world.city ON country.Capital = city.ID
ORDER BY country.Population DESC;
-- Countries with low population density
SELECT
    Name,
    Population,
    SurfaceArea,
    (Population/SurfaceArea) AS Density
 FROM world.country
 WHERE Population >0
 ORDER BY Density ASC;
 -- Cities with high GDP per Capita
SELECT
      city.Name AS City,
      country.Name AS Country,
      (country.GNP / country.Population) AS GNP_Per_Capita
FROM world.city
JOIN world.country ON city.CountryCode = country.Code
WHERE (country.GNP / country.Population)> (
        SELECT AVG(GNP/Population)
        FROM world.country
        WHERE Population >0
)
ORDER BY GNP_Per_Capita DESC;
-- Display Columns with Limit (Rows 31-40)
SELECT Name, Population
FROM world.city
ORDER BY Population DESC
LIMIT 10 OFFSET 30;
-- 