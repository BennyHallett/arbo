require 'test_helper'
require 'json'
require 'mocha/setup'
require 'arbo/generate'
require 'fileutils'

class GenerateCommandTest < Test::Unit::TestCase

  def setup
    @generate = GenerateCommand.new
    @crypto = mock('object')
    @generator = mock('object')
    @file = '/tmp/tmpdb'
    FileUtils.touch @file
    @globals = { :file => @file, 'file' => @file, :f => @file, 'f' => @file }
    @key = 'testkey'
  end

  def teardown
    if File.exist? @file
      FileUtils.rm @file
    end
  end

  def test_attempt_to_generate_without_crypto_fails
    assert_raise RuntimeError do
      @generate.process Hash.new, Hash.new, Array.new, nil, @generator
    end
  end

  def test_attempt_to_generate_without_generator_fails
    assert_raise RuntimeError do
      @generate.process Hash.new, Hash.new, Array.new, @crypto, nil
    end
  end

  def test_cannot_generate_when_no_key_is_given
    assert_raise RuntimeError do
      @generate.process Hash.new, Hash.new, Array.new, @crypto, @generator
    end
  end
end
