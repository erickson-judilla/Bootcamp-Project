USE world;
SELECT country.Continent AS continent, count(country.Continent) AS total_country, country.LifeExpectancy as life_expectancy FROM country 
WHERE LifeExpectancy > 70 
GROUP BY Continent;

USE world;
SELECT country.Continent AS continent, count(country.Continent) AS total_country, country.LifeExpectancy as life_expectancy FROM country 
WHERE LifeExpectancy > 60 AND LifeExpectancy < 70
GROUP BY Continent;

USE world;
SELECT country.Name AS country, country.LifeExpectancy as life_expectancy FROM country 
WHERE LifeExpectancy > 75;

USE world;
SELECT country.Name AS country, country.LifeExpectancy as life_expectancy FROM country 
WHERE LifeExpectancy < 40;

USE world;
SELECT country.Name AS country, country.Population as population FROM country 
ORDER BY Population DESC LIMIT 10;

USE world;
SELECT sum(country.Population) AS world_population FROM country;

USE world;
SELECT country.Continent AS continent, sum(country.Population) AS total_population FROM country
GROUP BY continent
HAVING total_population > 500000000;

USE world;
SELECT country.Continent AS continent, count(country.Name) AS total_country, SUM(country.Population) AS total_population, AVG(country.LifeExpectancy) AS average_life_expectancy FROM country
GROUP BY continent
HAVING average_life_expectancy < 71;

USE world;
SELECT country.Name AS country, count(city.Name) AS number_of_cities FROM country
LEFT JOIN city ON country.Code = city.CountryCode
GROUP BY country;

USE world;
SELECT countrylanguage.Language AS language, COUNT(country.Name) AS number_of_countries FROM countrylanguage
LEFT JOIN country ON countrylanguage.CountryCode = country.Code
GROUP BY language;

USE world;
SELECT countrylanguage.Language AS language, COUNT(country.Name) AS number_of_countries, countrylanguage.IsOfficial FROM countrylanguage
LEFT JOIN country ON countrylanguage.CountryCode = country.Code
WHERE countrylanguage.IsOfficial = 'T'
GROUP BY language;

USE world;
SELECT country.Continent as continent, COUNT(city.Name) AS number_of_cities, AVG(city.Population) AS average_cities_population FROM country 
LEFT JOIN city ON country.Code = city.CountryCode
GROUP BY continent;

USE world;
SELECT countrylanguage.Language, SUM(country.Population*countrylanguage.Percentage)/100 AS total_population from countrylanguage 
LEFT JOIN country ON country.Code = countrylanguage.CountryCode
GROUP BY Language
ORDER BY total_population DESC;
