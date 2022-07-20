USE world;
SELECT * FROM country WHERE continent = 'Europe';

USE world;
SELECT * FROM country WHERE continent IN('North America', 'Africa');

USE world;
SELECT country.Code AS country_code, country.Name AS country_name, country.continent, country.Population AS country_population, city.Name as city FROM country 
LEFT JOIN city ON country.Code = city.CountryCode
WHERE country.Population > 100000000
ORDER BY country.Name;

USE world;
SELECT country.Name, countrylanguage.Language AS language FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'Spanish';

USE world;
SELECT country.Name, countrylanguage.Language AS language, countrylanguage.IsOfficial FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'Spanish' AND countrylanguage.IsOfficial = 'T';

USE world;
SELECT country.Name, countrylanguage.Language AS language, countrylanguage.IsOfficial FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language IN('Spanish','English') AND countrylanguage.IsOfficial = 'T';

USE world;
SELECT country.Name, countrylanguage.Language AS language, countrylanguage.IsOfficial language, countrylanguage.Percentage FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'Arabic' AND countrylanguage.Percentage>30 AND countrylanguage.IsOfficial = 'F';

USE world;
SELECT country.Name, countrylanguage.Language AS language, countrylanguage.IsOfficial, countrylanguage.Percentage FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.Percentage<50 AND countrylanguage.IsOfficial = 'T';

USE world;
SELECT country.Name, countrylanguage.Language AS language, countrylanguage.IsOfficial FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T'
ORDER BY countrylanguage.Language;

/*Get the top 100 cities with the most population. Display the city's full country name also as well as their official language.*/
USE world;
SELECT country.Name, city.Name AS city, countrylanguage.Language AS language, countrylanguage.IsOfficial FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
LEFT JOIN city ON country.Code = city.CountryCode
WHERE countrylanguage.IsOfficial = 'T'
ORDER BY city.Population DESC LIMIT 100;

/*Get the top 100 cities with the most population where the life_expectancy for the country is less than 40.*/
USE world;
SELECT country.Name AS country, country.LifeExpectancy, city.Name AS city, city.Population FROM country
LEFT JOIN city ON country.Code = city.CountryCode
WHERE country.LifeExpectancy < 40
ORDER BY city.Population DESC LIMIT 100;

USE world;
SELECT country.Name AS country, city.Name AS city, country.LifeExpectancy FROM country
LEFT JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
LEFT JOIN city ON country.Code = city.CountryCode
WHERE countrylanguage.Language = 'English'
ORDER BY country.LifeExpectancy DESC LIMIT 100;
