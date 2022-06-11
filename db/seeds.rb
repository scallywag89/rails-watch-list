require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(URI.open(url).read)

movies["results"].each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}"
  )
end
