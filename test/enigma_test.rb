require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt
    expect = @enigma.encrypt("hello world", "02715", "040895")
    assert_instance_of String, expect[:encryption]
  end

  def test_date_generate
    assert_instance_of String, @enigma.date_generate
    assert_equal 6, @enigma.date_generate.length
  end

  def test_decrypt
    expect = @enigma.decrypt("keder ohulw", "02715", "040895")
    assert_instance_of String, expect[:decryption]
  end
end
