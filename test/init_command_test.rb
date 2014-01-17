require 'test_helper'
require 'json'
require 'mocha/setup'
require 'arbo/init'
require 'fileutils'

class InitCommandTest < Test::Unit::TestCase

  def setup
    @init = InitCommand.new
    @crypto = mock('object')
    @file = '/tmp/tmpdb'
    @globals = { :file => @file, 'file' => @file, :f => @file, 'f' => @file }
  end

  def teardown
    if File.exist? @file
      FileUtils.rm @file
    end
  end

  def test_attempt_to_init_without_crypto_fails
    assert_raise RuntimeError do
      @init.process Hash.new, Hash.new, Array.new, nil
    end
  end

  def test_init_calls_encrypt
    @crypto.expects(:encrypt).with(Hash.new.to_json)
    @init.process @globals, Hash.new, Array.new, @crypto
  end
end
