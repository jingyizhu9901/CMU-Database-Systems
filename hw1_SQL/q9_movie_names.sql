/*

    List the movies in alphabetical order which cast both Mark Hamill (born in
    1951) and George Lucas (born in 1944).

    Details: Print only the names of the movies in alphabetical order.

*/

WITH markHamil_title_id AS (
    SELECT crew.title_id
    FROM crew
    INNER JOIN person
    ON crew.person_id = person.person_id
    WHERE (person.name = "Mark Hamill" AND person.born = 1951)
)
WITH georgeLucas_title_id AS (
    SELECT crew.title_id
    FROM crew
    INNER JOIN person
    ON crew.person_id = person.person_id
    WHERE person.name = "George Lucas" AND person.born = 1944
)
SELECT titles.primary_title
FROM titles
WHERE titles.title_id IN markHamil_title_id
AND titles.title_id IN georgeLucas_title_id
AND titles.type == "movie"
ORDER BY titles.primary_title;

/* 不能写两个WITH...

WITH hamill_movies(title_id) AS (
  SELECT crew.title_id
    FROM crew
    JOIN people
    ON crew.person_id == people.person_id AND people.name == "Mark Hamill" AND people.born == 1951
)
SELECT titles.primary_title
  FROM crew
  JOIN people
  ON crew.person_id == people.person_id AND people.name == "George Lucas" AND people.born == 1944 AND crew.title_id IN hamill_movies
  JOIN titles
  ON crew.title_id == titles.title_id AND titles.type == "movie"
  ORDER BY titles.primary_title
;

*/