require 'crypt/blowfish'

class Crypto

  def initialize(password)
    @bf = Crypt::Blowfish.new(password)
  end

  def encrypt(text)
    @bf.encrypt_string text
  end

  def decrypt(text)
    @bf.decrypt_string text
  end
  
end
