require './lib/key'
require './lib/offsets'
class Enigma

  def initialize
    @key = Key.new
    @date = Offsets.new
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt_and_shift(encryption, key, date)
    ceasar = ""
    position = 0
    encryption.downcase.each_char do |chr|
      if !@alphabet.include?(chr.downcase)
         ceasar += chr
      else
        old_index = @alphabet.index(chr)
        position += 1; position = 1 if position > 4
        new_index = (old_index + @key.shift_a(key) + Offsets.new(date).offset_a) % @alphabet.count if position == 1
        new_index = (old_index + @key.shift_b(key) + Offsets.new(date).offset_b) % @alphabet.count if position == 2
        new_index = (old_index + @key.shift_c(key) + Offsets.new(date).offset_c) % @alphabet.count if position == 3
        new_index = (old_index + @key.shift_d(key) + Offsets.new(date).offset_d) % @alphabet.count if position == 4
        ceasar += @alphabet[new_index]
      end
    end
     ceasar
  end



  def encrypt(encryption, key = @key.key_generate, date = nil)
    encrypt_and_shift(encryption, key, date)
    hash = Hash.new
      hash[:encryption] = encrypt_and_shift(encryption, key, date)
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

  def decrypt_and_shift(decryption, key, date)
    ceasar = ""
    position = 0
    decryption.downcase.each_char do |chr|
      if !@alphabet.include?(chr.downcase)
         ceasar += chr
      else
        old_index = @alphabet.index(chr)
        position += 1; position = 1 if position > 4
        new_index = (old_index - @key.shift_a(key) - Offsets.new(date).offset_a) % @alphabet.count if position == 1
        new_index = (old_index - @key.shift_b(key) - Offsets.new(date).offset_b) % @alphabet.count if position == 2
        new_index = (old_index - @key.shift_c(key) - Offsets.new(date).offset_c) % @alphabet.count if position == 3
        new_index = (old_index - @key.shift_d(key) - Offsets.new(date).offset_d) % @alphabet.count if position == 4
        ceasar += @alphabet[new_index]
      end
    end
    ceasar
  end

  def decrypt(decryption, key, date = @date.date_generate)
    decrypt_and_shift(decryption, key, date)
    hash = Hash.new
      hash[:decryption] = decrypt_and_shift(decryption, key, date)
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
