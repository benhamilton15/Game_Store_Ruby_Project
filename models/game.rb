require_relative('../db/sql_runner')

class Game

attr_reader :id, :publisher_id
attr_accessor :title

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @stock = options['stock'].to_i
  @publisher_id = options['publisher_id'].to_i
end

def save()
  sql = "INSERT INTO games
  (
    title,
    stock,
    publisher_id
  )
  VALUES
  (
    $1, $2, $3
  )
  RETURNING id"
  values = [@title, @stock, @publisher_id]
  results = SqlRunner.run(sql,values)
  @id = results.first['id'].to_i
end

def self.all()
  sql = "SELECT * FROM games"
  games_data = SqlRunner.run( sql )
  games = map_items(games_data)
  return games
end

def self.delete_all()
  sql = "DELETE FROM games"
  SqlRunner.run( sql )
end

def self.map_items(games_data)
  return games_data.map { |game| Game.new(game) }
end


end
