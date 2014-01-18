require 'test_helper'
require 'json'
require 'mocha/setup'
require 'arbo/delete'
require 'fileutils'

class DeleteCommandTest < Test::Unit::TestCase

  def setup
    @delete = DeleteCommand.new
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

  def test_attempt_to_delete_without_crypto_fails
    assert_raise RuntimeError do
      @delete.process Hash.new, Hash.new, Array.new, nil
    end
  end

  def test_set_command_fails_with_no_args
    assert_raise RuntimeError do
      @delete.process @globals, Hash.new, Array.new, @crypto
    end
  end

  def test_set_command_fails_with_more_than_one_argument
    assert_raise RuntimeError do
      @delete.process @globals, Hash.new, [@key, @key], @crypto
    end
  end

  def test_set_command_removes_it_to_the_db
    @crypto.expects(:decrypt).returns({ @key => 'test-password' }.to_json)
    @crypto.expects(:encrypt).with(Hash.new.to_json)
    @delete.process @globals, Hash.new, [@key], @crypto
  end
end
