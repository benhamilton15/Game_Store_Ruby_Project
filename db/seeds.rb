require_relative( "../models/publisher.rb" )
require_relative( "../models/game.rb" )
require_relative( "../models/genre.rb" )
require("pry-byebug")

Game.delete_all()
Publisher.delete_all()
Genre.delete_all()

genre1 = Genre.new({'name' => 'RPG'})
genre2 = Genre.new({'name' => 'FPS'})
genre3 = Genre.new({'name' => 'Adventure'})
genre4 = Genre.new({'name' => 'Action'})

genre1.save()
genre2.save()
genre3.save()
genre4.save()

publisher1 = Publisher.new({
  "name" => "Blizzard"
  })

  publisher1.save()

  publisher2 = Publisher.new(
    {
      "name" => "Nintendo"
    }
  )

  publisher2.save()

  game1 = Game.new(
    {
      "title" => "Overwatch",
      "stock" => 100,
      "genre_id" => genre2.id,
      "publisher_id" => publisher1.id
    }
  )

  game1.save()

  game2 = Game.new(
    {
      "title" => "The Legend of Zelda",
      "stock" => 1000,
      "genre_id" => genre3.id,
      "publisher_id" => publisher2.id
    }
  )

  game2.save()




  binding.pry
  nil
