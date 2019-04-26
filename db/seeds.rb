require_relative( "../models/publisher.rb" )
require("pry-byebug")


publisher1 = Publisher.new({
  "name" => "Blizzard"
  })

publisher1.save()

  binding.pry
  nil
