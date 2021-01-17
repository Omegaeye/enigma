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
  
end
