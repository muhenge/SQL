SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia');

SELECT name,continent
FROM world
WHERE continent IN (
  SELECT continent
  FROM world
  WHERE name IN ('Australia','Argentina'))
ORDER BY name;

SELECT name,population FROM world
WHERE population BETWEEN
(SELECT population+1 FROM world WHERE name='Canada')
AND
(SELECT population-1 FROM world WHERE name='Poland')
;

SELECT name,
   CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name='Germany')),'%')
FROM world
WHERE continent='Europe'

SELECT name FROM world 
WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe' AND gdp IS NOT NULL);

SELECT continent, name, area FROM world x WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent AND area > 0 )

SELECT continent,name FROM world x WHERE x.name <= ALL (SELECT name FROM world y
WHERE x.continent=y.continent);

SELECT name,continent,population FROM world x WHERE 25000000 >= ALL (SELECT population FROM world y WHERE x.continent=y.continent AND y.population>0)

SELECT name, continent FROM world x WHERE population > ALL (SELECT population*3 FROM world y WHERE y.continent = x.continent AND y.name != x.name);