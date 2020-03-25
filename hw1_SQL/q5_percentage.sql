/*  List the decades and the percentage of titles which premiered in the
    corresponding decade.
    Display like : 2010s|45.7042

    Details:
    The percentage of titles for a decade is the number of titles which premiered
    that decade divided by the total number of titles.
    For the total number of titles, count all titles including ones that have not
    been premiered.
    Round the percentage to four decimal places using ROUND().
*/

SELECT
    CAST(premiered /10 * 10 AS TEXT) || 's' AS decade,
    ROUND(CAST(COUNT(*) AS REAL) / (
        SELECT COUNT(*)
        FROM titles) * 100.0, 4) as percentage
    FROM titles
    WHERE premiered is not null
    GROUP BY decade;

/* SOLUTION

SELECT
  CAST(premiered/10*10 AS TEXT) || 's' AS decade,
  ROUND(CAST(COUNT(*) AS REAL) / (SELECT COUNT(*) FROM titles) * 100.0, 4) as percentage
  FROM titles
  WHERE premiered is not null
  GROUP BY decade
  ORDER BY percentage DESC, decade ASC
  ;

*/