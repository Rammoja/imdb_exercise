require_relative('models/casting')
require_relative('models/movie')
require_relative('models/star')

require('pry')

Star.delete_all()
Movie.delete_all()
Casting.delete_all()

star1 = Star.new({'first_name' => 'Harrison', 'last_name' => 'Ford'})
star1.save()
star2 = Star.new({'first_name' => 'Carrie', 'last_name' => 'Fisher'})
star2.save()
star3 = Star.new({'first_name' => 'Liam', 'last_name' => 'Neeson'})
star3.save()

movie1 = Movie.new({ 'title' => 'Star Wars: The Last Jedi', 'genre' => 'SciFi', 'rating' => 4})
movie1.save()
movie2 = Movie.new({ 'title' => 'Star Wars: Empire Strikes Back', 'genre' => 'SciFi', 'rating' => 3})
movie2.save()
movie3 = Movie.new({ 'title' => 'Taken', 'genre' => 'Action', 'rating' => 2})
movie3.save()

casting1 = Casting.new({'star_id' => star1.id, 'movie_id' => movie1.id})
casting1.save()


binding.pry
nil
