class Enigma

  def initialize

  end

  def encrypt(encryption, key = nil, date = nil)
    if date == nil
      code = (date_generate.to_i ** 2).digits[0..3].reverse
      off_set_a = code[0]
      off_set_b = code[1]
      off_set_c = code[2]
      off_set_d = code[3]
    else
      code = (date.to_i ** 2).digits[0..3].reverse
      off_set_a = code[0]
      off_set_b = code[1]
      off_set_c = code[2]
      off_set_d = code[3]
    end

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

    alphabet = ("a".."z").to_a << " "
    ceasar = ""
    position = 0

    encryption.downcase.each_char do |chr|
      if !alphabet.include?(chr.downcase)
         ceasar += chr
      else
        old_index = alphabet.index(chr)
        position += 1; position = 1 if position > 4
        new_index = ((old_index + shift_a + off_set_a) % alphabet.count) if position == 1
        new_index = ((old_index + shift_b + off_set_b) % alphabet.count) if position == 2
        new_index = (old_index + shift_c + off_set_c) % alphabet.count if position == 3
        new_index = (old_index + shift_d + off_set_d) % alphabet.count if position == 4
        ceasar += alphabet[new_index]
      end
      ceasar
    end
    hash = Hash.new
      hash[:encryption] = ceasar
      if hash[:key] = key.to_s.length == 0
         hash[:key] = key_generate
      else
         hash[:key] = key.to_s
      end

      if hash[:date] = date.to_s.length == 0
         hash[:date] = date_generate
      else
         hash[:date] = date.to_s
      end
    hash
  end

  def key_generate
    key = rand(0..99_999)
    if key.to_s.length < 5
      "%05d" % key
    else
      key
    end.to_s
  end

  def date_generate
    date = Time.now.strftime("%d%m%y")
  end

  def decrypt(decryption, key, date)
    if date == nil
      code = (date_generate.to_i ** 2).digits[0..3].reverse
      off_set_a = code[0]
      off_set_b = code[1]
      off_set_c = code[2]
      off_set_d = code[3]
    else
      code = (date.to_i ** 2).digits[0..3].reverse
      off_set_a = code[0]
      off_set_b = code[1]
      off_set_c = code[2]
      off_set_d = code[3]
    end

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
    alphabet = ("a".."z").to_a << " "
    ceasar = ""
    position = 0

    decryption.downcase.each_char do |chr|
      if !alphabet.include?(chr.downcase)
         ceasar += chr
      else
        old_index = alphabet.index(chr)
        position += 1; position = 1 if position > 4
        new_index = (old_index - shift_a - off_set_a) % alphabet.count if position == 1
        new_index = (old_index - shift_b - off_set_b) % alphabet.count if position == 2
        new_index = (old_index - shift_c - off_set_c) % alphabet.count if position == 3
        new_index = (old_index - shift_d - off_set_d) % alphabet.count if position == 4
        ceasar += alphabet[new_index]
      end
      ceasar
    end
    hash = Hash.new
      hash[:decryption] = ceasar
      if hash[:key] = key.to_s.length == 0
         hash[:key] = key_generate
      else
         hash[:key] = key.to_s
      end

      if hash[:date] = date.to_s.length == 0
         hash[:date] = date_generate
      else
         hash[:date] = date.to_s
      end
    hash
  end


end
