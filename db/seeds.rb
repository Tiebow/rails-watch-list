# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = URI.open('http://tmdb.lewagon.com/movie/top_rated').read
api = JSON.parse(url)
# count = 0
# api.each do |json|
#   Movie.create(title: json['results'][count]['title'],
#                overview: json['results'][count += 1]['overview'],
#                poster_url: "https://image.tmdb.org/t/p/w500#{json['results'][count]['poster_path']}",
#                rating: json['results'][count]['vote_average'].to_f)
#   count += 1
# end
Movie.destroy_all
results = api['results']
results.each do |movie|
  Movie.create(title: movie['title'],
               overview: movie['overview'],
               poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
               rating: movie['vote_average'])
end
