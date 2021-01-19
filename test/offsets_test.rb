require './test/test_helper'

class OffsetsTest < Minitest::Test

  def setup
    @date = Offsets.new
  end

  def test_it_exists
    assert_instance_of Offsets, @date
  end

  def test_date_generate
    assert_instance_of String, @date.date
    assert_equal 6, @date.date.length
  end

  def test_square
    assert_equal 4, @date.square.length
  end

  def test_offset_a_b_c_d
    assert_equal 1, @date.offset_a.to_s.length
    assert_equal 1, @date.offset_b.to_s.length
    assert_equal 1, @date.offset_c.to_s.length
    assert_equal 1, @date.offset_d.to_s.length
  end

end
