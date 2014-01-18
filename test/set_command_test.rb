require 'test_helper'
require 'json'
require 'mocha/setup'
require 'arbo/set'
require 'fileutils'

class SetCommandTest < Test::Unit::TestCase

  def setup
    @set = SetCommand.new
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
      @set.process Hash.new, Hash.new, Array.new, nil
    end
  end
end
