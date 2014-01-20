require 'securerandom'

class Generator

  def initialize(length=24)
    @length = length
  end

  def generate
    SecureRandom.base64 @length
  end
end
