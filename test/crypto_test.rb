require 'test_helper'
require 'arbo/crypto'

class CryptoTest < Test::Unit::TestCase

  def setup
    @plain = 'This is some test text that will be encrypted'
    @password = 'SuperSecretPassword'
    @crypto = Crypto.new @password
    @encrypted = @crypto.encrypt @plain
  end

  def teardown
  end

  def test_encrypt_produces_different_text
    assert_not_equal @encrypted, @plain
  end

  def test_encrypted_text_can_be_decrypted_with_the_same_password
    decrypted = @crypto.decrypt @encrypted
    assert_equal @plain, decrypted
  end

  def test_encrypted_text_cannot_be_decrypted_with_a_different_password
    wrong_crypto = Crypto.new 'IncorrectPassword'
    decrypted = wrong_crypto.decrypt @encrypted
    assert_not_equal @plain, decrypted
  end
end
