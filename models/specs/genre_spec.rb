require('minitest/autorun')
require('minitest/rg')
require_relative('../genre')

class TestGenre < MiniTest::Test

def setup()
  @genre1 = Genre.new({'name' => 'RPG'})
end

def test_genre_has_name()
  assert_equal('RPG',@genre1.name)
end

end
