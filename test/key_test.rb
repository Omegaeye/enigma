require './test/test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_can_generate_5_digits
    assert_instance_of String, @key.key_generate
    assert_equal 5, @key.key_generate.length
  end

  def test_key_shift
    actual = @key.key_shift("02715")
    assert_instance_of Integer, actual
    assert_equal 2, actual.to_s.length
    actual = @key.key_shift()
    assert_instance_of Integer, actual
    assert_equal 2, actual.to_s.length
  end
end
