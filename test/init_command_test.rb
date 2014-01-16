require 'test_helper'
require 'mocha/setup'
require 'arbo/init'

class InitCommandTest < Test::Unit::TestCase

  def setup
    @init = InitCommand.new
  end

  def teardown
  end

  def test_attempt_to_init_without_crypto_fails
    assert_raise RuntimeError do
      @init.process Array.new, Array.new, Array.new, nil
    end
  end
end
