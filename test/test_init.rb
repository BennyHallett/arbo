require 'test/unit'
require 'arbo/init'
require 'fakefs/safe'

class InitCommandTests < Test::Unit::TestCase


  def setup
    @db = File.expand_path(File.join(Dir.home, '.arbodb'))
    FakeFS.activate!
    FileUtils.mkdir_p(Dir.home)
    @init = InitCommand.new Hash.new
  end

  def teardown
    if File.file?(@db)
      FileUtils.rm(@db)
    end
    FakeFS.deactivate!
  end

  def test_error_message_if_password_not_supplied
    assert_raise RuntimeError do
      @init.execute nil
    end
  end

  def test_error_message_if_password_it_empty_string
    assert_raise RuntimeError do
      @init.execute ''
    end
  end

  def test_db_file_was_created
    @init.execute 'SamplePassword'
    assert File.file?(@db), "DB File wasn't created"
  end

  def test_error_message_if_file_already_exists
    @init.execute 'SamplePassword'
    assert_raise RuntimeError do
      @init.execute 'SamplePassword'
    end
  end

  def test_db_file_encrypted
    @init.execute '5up3r-53cr3t-p@55w0rd!'
    assert_raise TypeError do
      contents = File.open(@db, 'r') { |f| Marshal.load(f) }
    end
  end 

end
