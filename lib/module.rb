module Methods

  def punctuation(chr)
      !@alphabet.include?(chr.downcase)
  end

  def old_index(chr)
    @alphabet.index(chr)
  end

  def encrypt_shift(encryption, key, date)
    string = ""
    position = 0
    encryption.downcase.each_char do |chr|
      if punctuation(chr)
         string += chr
      else
        position += 1; position = 1 if position > 4
        new_index = (old_index(chr) + @key.shift_a(key) + Offsets.new(date).offset_a) % @alphabet.count if position == 1
        new_index = (old_index(chr)+ @key.shift_b(key) + Offsets.new(date).offset_b) % @alphabet.count if position == 2
        new_index = (old_index(chr) + @key.shift_c(key) + Offsets.new(date).offset_c) % @alphabet.count if position == 3
        new_index = (old_index(chr) + @key.shift_d(key) + Offsets.new(date).offset_d) % @alphabet.count if position == 4
        string += @alphabet[new_index]
      end
    end
     string
  end

  def encrypt_hash (encryption, key, date)
    hash = Hash.new
      hash[:encryption] = encrypt_shift(encryption, key, date)
      hash[:key] = key.to_s
      hash[:date] = date.to_s
    hash
  end

  def decrypt_shift(decryption, key, date)
    string = ""
    position = 0
    decryption.downcase.each_char do |chr|
      if punctuation(chr)
         string += chr
      else
        position += 1; position = 1 if position > 4
        new_index = (old_index(chr) - @key.shift_a(key) - Offsets.new(date).offset_a) % @alphabet.count if position == 1
        new_index = (old_index(chr) - @key.shift_b(key) - Offsets.new(date).offset_b) % @alphabet.count if position == 2
        new_index = (old_index(chr) - @key.shift_c(key) - Offsets.new(date).offset_c) % @alphabet.count if position == 3
        new_index = (old_index(chr) - @key.shift_d(key) - Offsets.new(date).offset_d) % @alphabet.count if position == 4
        string += @alphabet[new_index]
      end
    end
    string
  end

  def decrypt_hash (decryption, key, date)
    hash = Hash.new
      hash[:decryption] = decrypt_shift(decryption, key, date)
      hash[:key] = key.to_s
      hash[:date] = date.to_s
    hash
  end
end
