require('minitest/autorun')
require('minitest/rg')
require_relative('../publisher')

class TestPublisher < MiniTest::Test

def setup()
  @publisher1 = Publisher.new({
    "name" => "Blizzard"
    })
end

def test_publisher_has_name()
  assert_equal('Blizzard', @publisher1.name)
end

end
