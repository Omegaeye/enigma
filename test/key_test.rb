require './test/test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_can_generate_5_digits
    assert_instance_of String, @key.generate
    assert_equal 5, @key.generate.length
  end
end
