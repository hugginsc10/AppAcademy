def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
<<<<<<< HEAD

=======
  Movie
    .select(:title, :id)
    .joins(:actors)
    .where(actors: {name: those_actors})
    .group(:id)
    .having('COUNT(actors.id) >= ?', those_actors.length)
>>>>>>> c54c60549355d22aa7913dbd708c3357aabb0a0d
end

def golden_age
  # Find the decade with the highest average movie score.
<<<<<<< HEAD

=======
  Movie
    .select('AVG(score), (yr/10) * 10 as decade')
    .group('decade')
    .order('AVG(score) DESC')
    .first
    .decade
>>>>>>> c54c60549355d22aa7913dbd708c3357aabb0a0d
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
<<<<<<< HEAD
=======
  subquery = Movie.select(:id).joins(:actors).where(actors: {name: name})

  Movie
    .joins(:actors)
    .where(movies: {id: subquery})
    .where.not(actors: {name: name})
    .distinct
    .pluck(:name)
    
>>>>>>> c54c60549355d22aa7913dbd708c3357aabb0a0d

end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
<<<<<<< HEAD

=======
  Actor
    .select(:name)
    .joins('LEFT OUTER JOIN castings ON actors.id = castings.actor_id')
    .where(castings: {movie_id: nil})
    .count
>>>>>>> c54c60549355d22aa7913dbd708c3357aabb0a0d
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
<<<<<<< HEAD

=======
  name = "%#{whazzername.split(//).join('%')}%"  #must use double parenthesis not single
  Movie
    .joins(:actors)
    .where('UPPER(actors.name) LIKE UPPER(?)', name)
>>>>>>> c54c60549355d22aa7913dbd708c3357aabb0a0d
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
<<<<<<< HEAD

=======
  Actor
    .select(:name, :id, 'MAX(movies.yr) - MIN(movies.yr) as career')
    .joins(:movies)
    .group(:id)
    .order('career DESC, name')
    .limit(3)
>>>>>>> c54c60549355d22aa7913dbd708c3357aabb0a0d
end
