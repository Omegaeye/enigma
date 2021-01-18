class Key

  attr_reader :digits

  def initialize(digits = key_generate)
    @digits = digits
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
    rand.to_s[2..6]
  end
end
