require_relative('../db/sql_runner')

class Game

attr_reader :title, :id, :publisher_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @publisher_id = options['publisher_id'].to_i
  @stock = options['stock'].to_i
end


end
