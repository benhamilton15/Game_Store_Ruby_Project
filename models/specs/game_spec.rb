require('minitest/autorun')
require('minitest/rg')
require_relative('../game')

class TestGame < MiniTest::Test


def setup
@game1 = Game.new({
  "title" => "Overwatch",
  "stock" => 1000,
  "genre_id" => 1,
  "publisher_id" => 1
}
)
@game2 = Game.new({
  "title" => "Overwatch",
  "stock" => 100,
  "genre_id" => 1,
  "publisher_id" => 1
}
)
@game3 = Game.new({
  "title" => "Overwatch",
  "stock" => 10,
  "genre_id" => 1,
  "publisher_id" => 1
}
)
@game4 = Game.new({
  "title" => "Overwatch",
  "stock" => 0,
  "genre_id" => 1,
  "publisher_id" => 1
}
)
end

def test_stock_level__high
  assert_equal('High', @game1.stock_level)
end

def test_stock_level__medium
  assert_equal('Medium', @game2.stock_level)
end

def test_stock_level__low
  assert_equal('Low', @game3.stock_level)
end

def test_stock_level__out_of_stock
  assert_equal('OUT OF STOCK', @game4.stock_level)
end





end
