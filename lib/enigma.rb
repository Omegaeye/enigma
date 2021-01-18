require './lib/key'
require './lib/offsets'
require './lib/module'
class Enigma
include Methods
  def initialize
    @key = Key.new
    @date = Offsets.new
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(encryption, key = @key.key_generate, date = Time.now.strftime("%d%m%y"))
    encrypt_shift(encryption, key, date)
    encrypt_hash(encryption, key, date)
  end

  def decrypt(decryption, key, date = Time.now.strftime("%d%m%y"))
    decrypt_shift(decryption, key, date)
    decrypt_hash(decryption, key, date)
  end

  def encrypt_shift(encryption, key, date)
    string = ""
    position = 0
    encryption.downcase.each_char do |chr|
      if punctuation(chr)
         string += chr
      else
        position += 1; position = 1 if position > 4
        new_index = encrypt_shift_a(chr, key, date) if position == 1
        new_index = encrypt_shift_b(chr, key, date) if position == 2
        new_index = encrypt_shift_c(chr, key, date) if position == 3
        new_index = encrypt_shift_d(chr, key, date) if position == 4
        string += @alphabet[new_index]
      end
    end
     string
  end

  def decrypt_shift(decryption, key, date)
    string = ""
    position = 0
    decryption.downcase.each_char do |chr|
      if punctuation(chr)
         string += chr
      else
        position += 1; position = 1 if position > 4
        new_index = decrypt_shift_a(chr, key, date) if position == 1
        new_index = decrypt_shift_b(chr, key, date) if position == 2
        new_index = decrypt_shift_c(chr, key, date) if position == 3
        new_index = decrypt_shift_d(chr, key, date) if position == 4
        string += @alphabet[new_index]
      end
    end
    string
  end
end
