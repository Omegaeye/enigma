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

    expect =  {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
       }
    assert_equal expect, @enigma.encrypt("hello world", "02715", "040895")

    expect =  {
      encryption: "keder!!!",
      key: "02715",
      date: "040895"
       }
    assert_equal expect, @enigma.encrypt("hello!!!", "02715", "040895")

    expect =  {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
       }
      assert_instance_of String, @enigma.encrypt("hello!!!")[:encryption]
  end

  def test_decrypt
    expect = @enigma.decrypt("keder ohulw", "02715", "040895")
    assert_instance_of String, expect[:decryption]

    expect =  {
      decryption: "hello world",
      key: "02715",
      date: "040895"
       }
    assert_equal expect, @enigma.decrypt("keder ohulw", "02715", "040895")

    expect =  {
      decryption: "hello!!!",
      key: "02715",
      date: "040895"
       }
    assert_equal expect, @enigma.decrypt("keder!!!", "02715", "040895")
    assert_equal 6, expect[:date].length
  end
end
