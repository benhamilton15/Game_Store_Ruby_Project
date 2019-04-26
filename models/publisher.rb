require_relative('../db/sql_runner')

class Publisher

  attr_reader :name, :id

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

  def self.map_items(publishers_data)
    return publishers_data.map { |publisher| Publisher.new(publisher) }
  end


end
