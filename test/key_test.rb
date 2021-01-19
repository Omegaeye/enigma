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

  def test_shift_a_b_c_d
    actual = @key.shift_a("02715")
    assert_instance_of Integer, actual
    assert_equal 1, actual.to_s.length
    assert_equal 2, actual

    actual = @key.shift_b("02715")
    assert_instance_of Integer, actual
    assert_equal 2, actual.to_s.length
    assert_equal 27, actual


    actual = @key.shift_c("02715")
    assert_instance_of Integer, actual
    assert_equal 2, actual.to_s.length
    assert_equal 71, actual


    actual = @key.shift_d("02715")
    assert_instance_of Integer, actual
    assert_equal 2, actual.to_s.length
    assert_equal 15, actual

  end
end
