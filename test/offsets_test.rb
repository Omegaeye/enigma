require './test/test_helper'

class OffsetsTest < Minitest::Test

  def setup
    @date = Offsets.new
  end

  def test_it_exists
    assert_instance_of Offsets, @date
  end

  def test_date_generate
    assert_instance_of String, @date.date_generate
    assert_equal 6, @date.date_generate.length
  end

  def offset_shift
    assert_instance_of Integer, @date.offset_shift
    assert_equal 2, @date.offset_shift.to_s.length
  end


end
