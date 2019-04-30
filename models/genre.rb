require_relative('../db/sql_runner')


class Genre


  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO genres
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.find(id)
    sql = "SELECT * FROM genres
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    genre = Genre.new(result)
    return house
  end

  def self.all()
    sql = "SELECT * FROM genres"
    genre_data = SqlRunner.run(sql)
    genres = map_items(genre_data)
    return genres
  end

  def self.delete_all()
    sql = "DELETE FROM genres"
    SqlRunner.run( sql )
  end

  def self.map_items(genre_data)
    return genre_data.map { |genre| Genre.new(genre) }
  end

end
