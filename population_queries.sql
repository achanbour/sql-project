-- How many entries in the database are from Africa?
SELECT COUNT(*) AS 'African countries'
FROM countries
WHERE continent LIKE "%Africa%";

-- What was the total population of Oceania in 2005?
WITH combined_table1 AS (
  SELECT countries.id, countries.name, countries.continent, population_years.population, population_years.year
  FROM countries
  JOIN population_years
    ON countries.id = population_years.country_id
  WHERE countries.continent = 'Oceania' AND population_years.year = 2005
)
SELECT SUM(population) AS "Total population in Oceania in year 2005"
FROM combined_table1;

-- What is the average population of countries in South America in 2003?
SELECT AVG(population) FROM population_years
INNER JOIN countries ON
countries.id = population_years.country_id
WHERE year = 2003
AND continent = 'South America';

-- What country had the smallest population in 2007?
SELECT MIN(population), name FROM population_years
INNER JOIN countries ON
countries.id = population_years.country_id
WHERE year = 2007;

-- What is the average population of Poland during the time period covered by this dataset?
SELECT AVG(population) FROM population_years
INNER JOIN countries ON
countries.id = population_years.country_id
WHERE name = 'Poland';

-- How many countries have the word "The" in their name?
SELECT COUNT(*) AS "Countries with THE"
FROM countries
WHERE name LIKE "%The%";

-- What was the total population of each continent in 2010?
WITH combined_table5 AS (
  SELECT countries.continent, population_years.population, population_years.year
  FROM countries
  JOIN population_years
    ON countries.id = population_years.country_id
  WHERE population_years.year = 2010
)
SELECT continent, SUM(population) AS "Total population in 2010"
FROM combined_table5
GROUP BY continent
ORDER BY 2 DESC;




