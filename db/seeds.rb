require_relative( "../models/publisher.rb" )
require_relative( "../models/game.rb" )
require("pry-byebug")

Game.delete_all()
Publisher.delete_all()

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
      "publisher_id" => publisher1.id
    }
  )

  game1.save()

  game2 = Game.new(
    {
      "title" => "The Legend of Zelda",
      "stock" => 1000,
      "publisher_id" => publisher2.id
    }
  )

  game2.save()




  binding.pry
  nil
