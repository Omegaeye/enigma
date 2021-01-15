require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt
    expect = @enigma.encrypt("hhhhhhhhh", nil, nil)
    assert_instance_of String, expect[:encryption]
    p expect
  end

  def test_key_generate
    assert_instance_of String, @enigma.key_generate
    assert_equal 5, @enigma.key_generate.length
  end

  def test_date_generate
    assert_instance_of String, @enigma.date_generate
    assert_equal 6, @enigma.date_generate.length
  end
end
