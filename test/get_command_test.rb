require 'test_helper'
require 'json'
require 'mocha/setup'
require 'arbo/get'
require 'fileutils'

class GetCommandTest < Test::Unit::TestCase

  def setup
    @get = GetCommand.new
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

  def test_attempt_to_get_without_crypto_fails
    assert_raise RuntimeError do
      @get.process Hash.new, Hash.new, Array.new, nil
    end
  end

  def test_attempt_to_get_without_key_fails
    assert_raise RuntimeError do
      @get.process Hash.new, Hash.new, Array.new, @crypto
    end
  end

  def test_get_blog_password_copies_secret_to_clipboard
    @crypto.expects(:decrypt).returns(@passwords.to_json)
    Clipboard.expects(:copy).with('secret')
    @get.process @globals, Hash.new, ['blog'], @crypto
  end
end
