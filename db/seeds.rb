require_relative( "../models/publisher.rb" )
require("pry-byebug")

Publisher.delete_all()

publisher1 = Publisher.new({
  "name" => "Blizzard"
  })

publisher1.save()

  binding.pry
  nil
