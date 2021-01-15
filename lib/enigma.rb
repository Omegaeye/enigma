require './lib/key'

class Enigma

  def initialize
    @key = Key.new
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
    alphabet = ("a".."z").to_a << " "
    ceasar = ""
    position = 0

    encryption.downcase.each_char do |chr|
      if !alphabet.include?(chr.downcase)
         ceasar += chr
      else
        old_index = alphabet.index(chr)
        position += 1; position = 1 if position > 4
        new_index = ((old_index + @key.key_shift(key = nil) + off_set_a) % alphabet.count) if position == 1
        new_index = ((old_index + @key.key_shift(key = nil) + off_set_b) % alphabet.count) if position == 2
        new_index = (old_index + @key.key_shift(key = nil) + off_set_c) % alphabet.count if position == 3
        new_index = (old_index + @key.key_shift(key = nil) + off_set_d) % alphabet.count if position == 4
        ceasar += alphabet[new_index]
      end
      ceasar
    end
    hash = Hash.new
      hash[:encryption] = ceasar
      if hash[:key] = key.to_s.length == 0
         hash[:key] = @key.key_generate
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

    alphabet = ("a".."z").to_a << " "
    ceasar = ""
    position = 0

    decryption.downcase.each_char do |chr|
      if !alphabet.include?(chr.downcase)
         ceasar += chr
      else
        old_index = alphabet.index(chr)
        position += 1; position = 1 if position > 4
        new_index = (old_index - @key.key_shift(key = nil)- off_set_a) % alphabet.count if position == 1
        new_index = (old_index - @key.key_shift(key = nil) - off_set_b) % alphabet.count if position == 2
        new_index = (old_index - @key.key_shift(key = nil) - off_set_c) % alphabet.count if position == 3
        new_index = (old_index - @key.key_shift(key = nil)- off_set_d) % alphabet.count if position == 4
        ceasar += alphabet[new_index]
      end
      ceasar
    end
    hash = Hash.new
      hash[:decryption] = ceasar
      if hash[:key] = key.to_s.length == 0
         hash[:key] = @key.key_generate
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
