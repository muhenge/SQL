SELECT name, continent, population FROM world

SELECT name FROM world WHERE population >= 200000000

SELECT name, gdp/population FROM world WHERE population >= 200000000

SELECT name,population/1000000 FROM world WHERE continent='South America'

SELECT name,population FROM world WHERE name = 'France' OR name = 'Germany' OR name = 'Italy'

SELECT name FROM world WHERE name LIKE '%United%'

SELECT name,population,area FROM world WHERE area > 3000000 OR population > 250000000

SELECT name, population,area FROM world WHERE name > 3000000 XOR population > 250000000

SELECT name, ROUND(gdp/population,-3) FROM world WHERE gdp>1000000000000

SELECT name, capital FROM world WHERE LEFT(name,1) = LEFT(capital,1) AND capital <> name

SELECT name FROM world 
WHERE name LIKE '%a%' AND 
name  LIKE '%e%' AND 
name  LIKE '%i%' AND 
name  LIKE '%o%' AND 
name  LIKE '%u%' AND 
name NOT LIKE '% %'