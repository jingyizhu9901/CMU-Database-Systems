/*

    List the IMDB Top 250 movies along with its weighted rating.

    Details: The weighted rating of a movie is calculated according to the
    following formula:

    Weighted rating (WR) = (v/(v+m)) * R + (m/(v+m)) * C

    - R = average rating for the movie (mean), i.e. ratings.rating
    - v = number of votes for the movie, i.e. ratings.votes
    - m = minimum votes required to be listed in the Top 250 (current 25000)
    - C = weighted average rating of all movies

    Print the movie name along with its weighted rating.
    For example: The Shawshank Redemption|9.27408375213064.
*/


/* no idea QAQ so here is the solution:

WITH
  av(average_rating) AS (
    SELECT SUM(rating * votes) / SUM(votes)
      FROM ratings
      JOIN titles
      ON titles.title_id == ratings.title_id AND titles.type == "movie"
  ),
  mn(min_rating) AS (SELECT 25000.0)
SELECT
  primary_title,
  (votes / (votes + min_rating)) * rating + (min_rating / (votes + min_rating)) * average_rating as weighed_rating
  FROM ratings, av, mn
  JOIN titles
  ON titles.title_id == ratings.title_id and titles.type == "movie"
  ORDER BY weighed_rating DESC
  LIMIT 250
  ;

*/