require 'test_helper'
require 'json'
require 'mocha/setup'
require 'arbo/list'
require 'fileutils'

class ListCommandTest < Test::Unit::TestCase

  def setup
    @list = ListCommand.new
    @crypto = mock('object')
    @file = '/tmp/tmpdb'
    FileUtils.touch @file
    @globals = { :file => @file, 'file' => @file, :f => @file, 'f' => @file }
    @passwords = { 'blog' => 'secret', 'repo' => 'abcdef', 'social' => 'friendly-face' }
  end

  def teardown
    if File.exist? @file
      FileUtils.rm @file
    end
  end

  def test_attempt_to_init_without_crypto_fails
    assert_raise RuntimeError do
      @list.process Hash.new, Hash.new, Array.new, nil
    end
  end

  def test_list_command_lists_all_keys
    @crypto.expects(:decrypt).returns(@passwords.to_json)
    list = @list.process @globals, Hash.new, Array.new, @crypto
    assert list.include? 'blog'
    assert list.include? 'repo'
    assert list.include? 'social'
  end
end
