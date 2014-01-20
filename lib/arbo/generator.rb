require 'securerandom'

class Generator

  def generate(length=32)
    n = length / 4 * 3
    SecureRandom.base64 n
  end
end
