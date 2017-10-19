def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  # movies = Movie.includes(:actors)
  #
  # those_actors.each do |actor|
  Movie
    .select(:id, :title)
    .joins(:actors)
    .where('actors.name IN (?)', those_actors)
    .group(:id)
    .having('COUNT(actors.id) > ?', those_actors.length-1)
end

# SELECT COUNT(movies.id) AS no_of_movies FROM movies INNER JOIN castings ON movies.id = castings.movie_id
# JOIN actors ON castings.actor_id = actors.id
# WHERE actors.name IN ('Ben Affleck','Matt Damon')
# GROUP BY movies.id, actors.name HAVING (COUNT(actors.id) > 1)

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .select('(yr/10)*10 AS decade')
    .group('decade')
    .order('AVG(score) DESC')
    .first
    .decade
end

# SELECT (yr/10)*10 AS decade
# FROM movies
# GROUP BY decade
# HAVING AVG(score) > 0
# ORDER BY AVG(score) DESC
# LIMIT 1

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
