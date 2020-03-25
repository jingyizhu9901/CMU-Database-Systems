/*  List the longest title of each type along with the runtime minutes. */
/*  Details: Find the titles which are the longest by runtime minutes.
    There might be cases where there is a tie for the longest titles - in that
    case return all of them.
    Display the types, primary titles and runtime minutes,
    and order it according to type (ascending) and use primary titles (ascending) as tie-breaker. */



SELECT type, primary_title, runtime_minutes
FROM titles
WHERE (type, runtime_minutes) IN (
    SELECT type, max(runtime_minutes)
    FROM titles
    GROUP BY type
)
ORDER BY type asc, primary_title asc;


/* Solution

WITH types(type, runtime_minutes) AS (
  SELECT type, MAX(runtime_minutes)
    FROM titles
    GROUP BY type
)
SELECT titles.type, titles.primary_title, titles.runtime_minutes
  FROM titles
  JOIN types
  ON titles.runtime_minutes == types.runtime_minutes AND titles.type == types.type
  ORDER BY titles.type, titles.primary_title
;

 */