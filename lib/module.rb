module Methods

  def punctuation(chr)
      !@alphabet.include?(chr.downcase)
  end

  def old_index(chr)
    @alphabet.index(chr)
  end

  def encrypt_shift_a(chr, key, date)
    (old_index(chr) + @key.shift_a(key) + Offsets.new(date).offset_a) % @alphabet.count
  end

  def encrypt_shift_b(chr, key, date)
    (old_index(chr) + @key.shift_b(key) + Offsets.new(date).offset_b) % @alphabet.count
  end

  def encrypt_shift_c(chr, key, date)
    (old_index(chr) + @key.shift_c(key) + Offsets.new(date).offset_c) % @alphabet.count
  end

  def encrypt_shift_d(chr, key, date)
    (old_index(chr) + @key.shift_d(key) + Offsets.new(date).offset_d) % @alphabet.count
  end

  def encrypt_hash (encryption, key, date)
    hash = Hash.new
      hash[:encryption] = encrypt_shift(encryption, key, date)
      hash[:key]        = key.to_s
      hash[:date]       = date.to_s
    hash
  end

  def decrypt_shift_a(chr, key, date)
    (old_index(chr) - @key.shift_a(key) - Offsets.new(date).offset_a) % @alphabet.count
  end

  def decrypt_shift_b(chr, key, date)
    (old_index(chr) - @key.shift_b(key) - Offsets.new(date).offset_b) % @alphabet.count
  end

  def decrypt_shift_c(chr, key, date)
    (old_index(chr) - @key.shift_c(key) - Offsets.new(date).offset_c) % @alphabet.count
  end

  def decrypt_shift_d(chr, key, date)
    (old_index(chr) - @key.shift_d(key) - Offsets.new(date).offset_d) % @alphabet.count
  end

  def decrypt_hash (decryption, key, date)
    hash = Hash.new
      hash[:decryption] = decrypt_shift(decryption, key, date)
      hash[:key]        = key.to_s
      hash[:date]       = date.to_s
    hash
  end
end
