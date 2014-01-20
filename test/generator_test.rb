require 'test_helper'
require 'arbo/generator'

class GeneratorTest < Test::Unit::TestCase

  def setup
    @generator = Generator.new
  end

  def teardown
  end

  def test_generator_returns_32_character_password_by_default
    pw = @generator.generate
    assert_equal 32, pw.length
  end

  def test_generator_with_64_char_password_length
    pw = @generator.generate 64
    assert_equal 64, pw.length
  end

  def test_generator_with_16_char_password_length
    pw = @generator.generate 16
    assert_equal 16, pw.length
  end
end
