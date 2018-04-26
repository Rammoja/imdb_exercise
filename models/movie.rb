require_relative('../db/sql_runner')

class Movie
  attr_reader :id
  attr_accessor :title, :genre, :rating

  def initialize( options )
    @id = options ['id'].to_i if options['id']
    @title = options ['title']
    @genre = options ['genre']
    @rating = options ['rating']
  end

  def save()
      sql = "INSERT INTO movies
      (
       title,
       genre,
       rating
      )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING id"
      values = [@title, @genre, @rating]
      movie = SqlRunner.run(sql, values).first
      @id = movie['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM movies"
    movies_hashes = SqlRunner.run(sql)
    return Movie.map_items(movies_hashes)
  end

end
