require_relative('../db/sql_runner')

class Publisher

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO publishers
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql,values)
    @id = results.first['id'].to_i
  end

  def update()
    sql = "UPDATE publishers
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM publishers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def games()
    sql = "SELECT * FROM games
    WHERE publisher_id = $1"
    values = [@id]
    games_data = SqlRunner.run(sql, values)
    games = games_data.map { |game| Game.new(game)  }
    return games
  end

  def self.all()
    sql = "SELECT * FROM publishers"
    publishers_data = SqlRunner.run( sql )
    publishers = map_items(publishers_data)
    return publishers
  end

  def self.find(id)
    sql = "SELECT * FROM publishers
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    publisher = Publisher.new(result)
    return publisher
  end

  def self.delete_all()
    sql = "DELETE FROM publishers"
    SqlRunner.run( sql )
  end

  def self.delete(id)
    sql = "DELETE FROM publishers
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(publishers_data)
    return publishers_data.map { |publisher| Publisher.new(publisher) }
  end


end
