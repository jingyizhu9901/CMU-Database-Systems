/*  List the top 10 dubbed titles with the number of dubs.

    Details:
    Count the number of titles in akas for each title in the titles table, and
    list only the top ten.
    Print the primary title and the number of corresponding dubbed movies.
*/

SELECT primary_title, COUNT(*) AS num
FROM titles
LEFT OUTER JOIN akas
ON titles.title_id = akas.title_id
GROUP BY titles.title_id
ORDER BY num DESC
LIMIT 10;


/* SOLUTION

WITH translations AS (
  SELECT title_id, count(*) as num_translations
    FROM akas
    GROUP BY title_id
    ORDER BY num_translations DESC, title_id
    LIMIT 10
)
SELECT titles.primary_title, translations.num_translations
  FROM translations
  JOIN titles
  ON titles.title_id == translations.title_id
  ORDER BY translations.num_translations DESC
  ;

*/