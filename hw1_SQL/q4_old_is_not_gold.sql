/*  Which decades saw the most number of titles getting premiered?
    List the number of titles in every decade. Like 2010s|2789741.

    Details:
    Print all decades and the number of titles.
    Print the relevant decade in a fancier format by constructing a string that
    looks like this: 2010s.
    Sort the decades in decreasing order with respect to the number of titles.
    Remember to exclude titles which have not been premiered (i.e. where
    premiered is NULL)
*/

SELECT CAST(premiered /10 * 10 AS TEXT) || 's' AS decade, COUNT(*)
FROM titles
WHERE premiered is not null
GROUP BY decade
ORDER BY COUNT(*) DESC;

/* SOLUTION

SELECT
  CAST(premiered/10*10 AS TEXT) || 's' AS decade,
  COUNT(*) AS num_movies
  FROM titles
  WHERE premiered is not null
  GROUP BY decade
  ORDER BY num_movies DESC
  ;

*/