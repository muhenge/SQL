SELECT id, title FROM movie WHERE yr=1962

SELECT yr FROM movie WHERE title LIKE 'Citizen Kane';

SELECT id,title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr

SELECT id FROM actor WHERE name LIKE 'Glenn Close';

SELECT id FROM movie WHERE title LIKE 'Casablanca';

SELECT name FROM casting, actor
WHERE movieid=(SELECT id 
             FROM movie 
             WHERE title='Casablanca')
    AND actorid=actor.id


SELECT name
FROM movie, casting, actor
WHERE title='Alien'
AND movieid=movie.id
AND actorid=actor.id


SELECT title
  FROM movie, casting, actor
 WHERE name LIKE'Harrison Ford'
    AND movieid=movie.id
    AND actorid=actor.id


SELECT title
  FROM movie, casting, actor
 WHERE name LIKE'Harrison Ford'
    AND movieid=movie.id
    AND actorid=actor.id
  AND ord<>1
;


SELECT title, name
  FROM movie, casting, actor
 WHERE yr=1962
    AND movieid=movie.id
    AND actorid=actor.id
    AND ord=1
;

SELECT yr, COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr, COUNT(title) AS c FROM
movie JOIN casting ON movie.id=movieid 
JOIN actor   ON actorid=actor.id
 WHERE name='Rock Hudson'
 GROUP BY yr) AS t
)

SELECT name
    FROM casting JOIN actor
      ON  actorid = actor.id
    WHERE ord=1
    GROUP BY name
    HAVING COUNT(movieid)>=15
;

SELECT title, COUNT(actorid)
  FROM casting,movie                
  WHERE yr=1978
        AND movieid=movie.id
  GROUP BY title
  ORDER BY 2 DESC
;

SELECT DISTINCT d.name
FROM actor d JOIN casting a ON (a.actorid=d.id)
   JOIN casting b ON (a.movieid=b.movieid)
   JOIN actor c ON (b.actorid=c.id 
                AND c.name='Art Garfunkel')
  WHERE d.id!=c.id
;

