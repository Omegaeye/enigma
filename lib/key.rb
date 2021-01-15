class Key

  def initialize (string = nil)
    @key ||= key_generate
  end

  def key_shift (key = nil)
    if key == nil
      shift_a = key_generate.chars[0..1].join.to_i
      shift_b = key_generate.chars[1..2].join.to_i
      shift_c = key_generate.chars[2..3].join.to_i
      shift_d = key_generate.chars[3..4].join.to_i
    else
      shift_a = key.chars[0..1].join.to_i
      shift_b = key.chars[1..2].join.to_i
      shift_c = key.chars[2..3].join.to_i
      shift_d = key.chars[3..4].join.to_i
    end
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
