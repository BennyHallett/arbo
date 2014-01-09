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
    @master_pw = 'SuperSecretMasterPassword'
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
    @db.init @master_pw
    assert @db.exist?
  end

  def test_not_create_db_if_already_created
    @db.init @master_pw
    assert_raises RuntimeError do
      @db.init @master_pw
    end
  end

  def test_db_file_is_created_on_init
    File.expects(:open).with(@file, 'w+')
    @db.init @master_pw
  end

  def test_cannot_set_on_non_existant_db
    assert_raise RuntimeError do
      @db.set @key, @pw, @master_pw
    end
  end
end
