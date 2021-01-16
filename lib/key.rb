class Key

  attr_reader :digits

  def initialize
  end

  def shift_a(key)
    key.chars[0..1].join.to_i
  end

  def shift_b (key)
    key.chars[1..2].join.to_i
  end

  def shift_c(key)
    key.chars[2..3].join.to_i
  end

  def shift_d(key)
    key.chars[3..4].join.to_i
  end

  def key_generate
    key = rand(0..99_999)
    if key.to_s.length < 5
      "%05d" % key
    else
      key
    end.to_s
  end

end
