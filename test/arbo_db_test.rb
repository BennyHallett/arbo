require 'test_helper'
require 'arbo/arbo_db'
require 'mocha/setup'
require 'fileutils'

class ArboDbTest < Test::Unit::TestCase

  def setup
    @file = '/tmp/tmpdb'
    @db = ArboDb.new @file
    @key = 'My Email Account'
    @pw = 'EmailPassword'
    @crypto = mock('object')
  end

  def teardown
    if File.exist? @file
      FileUtils.rm @file
    end
  end

  def test_exist_is_false_if_db_doesnt_exist
    assert !@db.exist?
  end

  def test_create_db
    @crypto.expects(:encrypt)
    @db.init @crypto 
    assert @db.exist?
  end

  def test_not_create_db_if_already_created
    @crypto.expects(:encrypt)
    @db.init @crypto
    assert_raises RuntimeError do
      @db.init @crypto
    end
  end

  def test_db_file_is_created_on_init
    File.expects(:open).with(@file, 'w+')
    @crypto.expects(:encrypt)
    @db.init @crypto
  end

  def test_db_file_is_encrpyted_on_init
    @crypto.expects(:encrypt)
    @db.init @crypto
  end

  def test_cannot_set_on_non_existant_db
    assert_raise RuntimeError do
      @db.set @key, @pw, @crypto
    end
  end
end
