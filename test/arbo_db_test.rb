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
    File.expects(:open).with(@file, 'w')
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

  def test_set_decrypts_and_encrypts
    when_i_have_an_empty_db_file
  
    i_expect_the_file_to_be_decrypted_then_encrypted_again
    @db.set @key, @pw, @crypto
  end

  def test_sets_writes_to_file
    when_i_have_an_empty_db_file
    initial_size = File.size @file
   
    i_expect_the_file_to_be_decrypted_then_encrypted_again
    i_expect_the_file_to_be_opened_for_reading_and_writing

    @db.set @key, @pw, @crypto 
    
    assert(initial_size != File.size(@file), "Current file size #{File.size(@file)} should not match original size : #{initial_size}") 
  end

  def test_list_uninitialized_db_throws_error
    assert_raise RuntimeError do
      @db.list @crypto
    end
  end
  
  def test_list_empty_db_returns_no_keys
    when_i_have_an_empty_db_file

    @crypto.expects(:decrypt)
    keys = @db.list @crypto
    assert_equal 0, keys.length
  end

  def test_list_db_with_one_entry_returns_one_key
    when_i_have_an_empty_db_file
    i_expect_the_file_to_be_decrypted_then_encrypted_again
    i_expect_the_file_to_be_opened_for_reading_and_writing
    @db.set @key, @pw, @crypto

    File.expects(:open).with(@file, 'r')
    @crypto.expects(:decrypt)
    keys = @db.list @crypto
    assert_equal 1, keys.length
    assert_equal @key, keys.first
  end

  def i_expect_the_file_to_be_opened_for_reading_and_writing
    File.expects(:open).with(@file, 'r')
    File.expects(:open).with(@file, 'w')
  end

  def when_i_have_an_empty_db_file
    @crypto.expects(:encrypt)
    @db.init @crypto
  end

  def i_expect_the_file_to_be_decrypted_then_encrypted_again
    @crypto.expects(:encrypt)
    @crypto.expects(:decrypt)
  end
end
