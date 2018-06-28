require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
      binding.pry
  character_hash = JSON.parse(all_characters)
  
  found = character_hash["results"].find{|right_hash| right_hash["name"] == character}
  all_films = found["films"]
  film_objects = []
  all_films.each do |url|
    request = RestClient.get("#{url}")
    film_objects << JSON.parse(request)
  end
  film_objects
  
  
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
    films_hash.each_with_index do |film, index|
      puts "#{index + 1}. #{film["title"]}"
    end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
