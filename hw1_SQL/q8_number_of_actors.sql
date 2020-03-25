/*

    List the number of actors / actresses who have appeared in any title with
    Mark Hamill (born in 1951).
    Details: Print only the total number of actors and actresses.
    The answer should include Mark Hamill himself.

*/

WITH markHamill AS (
    SELECT DISTINCT(crew.title_id)
    FROM crew
    INNER JOIN people
    ON crew.person_id = people.person_id
    WHERE people.name = "Mark Hamill" AND people.born = 1951
)
SELECT COUNT(DISTINCT(crew.person_id))
FROM crew
WHERE (crew.category == "actor" OR crew.category == "actress")
AND crew.title_id in markHamill;