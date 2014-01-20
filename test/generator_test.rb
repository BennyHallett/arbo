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
end
