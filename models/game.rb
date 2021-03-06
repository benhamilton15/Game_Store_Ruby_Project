require_relative('../db/sql_runner')
require_relative('./genre')

class Game

  attr_reader :id, :publisher_id, :stock, :genre_id
  attr_accessor :title

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @stock = options['stock'].to_i
    @publisher_id = options['publisher_id'].to_i
    @genre_id = options['genre_id'].to_i
  end

  def save()
    sql = "INSERT INTO games
    (
      title,
      stock,
      genre_id,
      publisher_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@title, @stock, @genre_id, @publisher_id]
    results = SqlRunner.run(sql,values)
    @id = results.first['id'].to_i
  end

  def update()
    sql = "UPDATE games
    SET
    (
      title,
      stock,
      genre_id,
      publisher_id
    )
    =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@title, @stock, @genre_id, @publisher_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM games
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def publisher()
    sql = "Select * FROM publishers
    WHERE id = $1"
    values = [@publisher_id]
    publisher_data = SqlRunner.run(sql,values).first
    publisher = Publisher.new(publisher_data)
    return publisher
  end

  def genre()
    sql = "Select * FROM genres
    WHERE id = $1"
    values = [@genre_id]
    genre_data = SqlRunner.run(sql,values).first
    genre = Genre.new(genre_data)
    return genre
  end

  def stock_level()
    if (@stock < 50 && @stock > 0)
      return 'Low'
    elsif (@stock >= 50 && @stock <= 300)
      return 'Medium'
    elsif @stock > 300
      return 'High'
    else
      return 'OUT OF STOCK'
    end

  end


  def self.all()
    sql = "SELECT * FROM games"
    games_data = SqlRunner.run( sql )
    games = map_items(games_data)
    return games
  end

  def self.find(id)
    sql = "SELECT * FROM games
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    game = Game.new(result)
    return game
  end

  def self.delete_all()
    sql = "DELETE FROM games"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM games
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(games_data)
    return games_data.map { |game| Game.new(game) }
  end


end
