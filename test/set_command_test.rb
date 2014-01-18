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
    FileUtils.touch @file
    @globals = { :file => @file, 'file' => @file, :f => @file, 'f' => @file }
    @key = 'testkey'
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

  def test_set_command_fails_with_no_args
    assert_raise RuntimeError do
      @set.process @globals, Hash.new, Array.new, @crypto
    end
  end

  def test_set_command_fails_with_more_than_one_argument
    assert_raise RuntimeError do
      @set.process @globals, Hash.new, [@key, @key], @crypto
    end
  end

  def test_set_command_asks_for_password_and_adds_it_to_the_db
    $stdout.expects(:puts).with("Please enter the password for #{@key}.")
    $stdin.expects(:gets).returns('secret')
    @crypto.expects(:decrypt).returns(Hash.new.to_json)
    @crypto.expects(:encrypt)
    @set.process @globals, Hash.new, [@key], @crypto
  end
end
