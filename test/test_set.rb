require 'arbo/set'
require 'test/unit'
require 'mocha/setup'
require 'fakefs/safe'

class SetCommandTests < Test::Unit::TestCase

  def setup
    @set = SetCommand.new
    @db = File.expand_path(File.join(Dir.home, '.arbodb'))
    @pw = 'Master-Password'
    FakeFS.activate!
    FileUtils.mkdir_p(Dir.home)
    init = InitCommand.new
    init.execute Array.new, @pw
  end

  def teardown
    if File.file?(@db)
      FileUtils.rm(@db)
    end
    FakeFS.deactivate!
  end

  def test_add_new_entry
    $stdin.expects(:gets).returns('Secret-Test-Account-Password')
    @set.execute ['Test-Account'], @pw
  end
  
  def test_add_new_entry_with_wrong_master_password
    assert_raise RuntimeError do
       @set.execute ['Test-Account'], 'Wrong-Master-Password'
    end
  end

end
