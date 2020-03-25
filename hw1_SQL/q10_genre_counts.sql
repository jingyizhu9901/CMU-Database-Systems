/*

List all distinct genres and the number of titles associated with them.
Details: The titles table contains the titles with their genres.
Each title is associated with zero or more genres stored in the genres column as
comma-separated values (like "Documentary,Short").
Count the number of titles associated with each genre, and list the genres and
the counts, and order it according to the counts (greatest to least).
Don't forget to filter empty genres (where genres is blank).

*/

/* 不太会 抄答案 */

WITH RECURSIVE split(genre, rest) AS (
  SELECT '', genres || ',' FROM titles WHERE genres != "\N"
   UNION ALL
  SELECT substr(rest, 0, instr(rest, ',')),
         substr(rest, instr(rest, ',')+1)
    FROM split
   WHERE rest != ''
)
SELECT genre, count(*) as genre_count
  FROM split
 WHERE genre != ''
 GROUP BY genre
 ORDER BY genre_count DESC;