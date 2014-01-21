require 'json'

class ArboDb

  def initialize(file = File.join(Dir.home, '.arbodb'))
    @file = file
  end

  def exist?
    return File.exist? @file
  end

  def init(crypto)
    raise "Database already created at #{@file}." unless !exist?
    db = Hash.new.to_json
    contents = crypto.encrypt db
    File.open(@file, 'w') { |f| f.write(contents) }
  end

  def set(key, password, crypto)
    raise "Unable to set password for #{key} when no database exists" unless exist?
    encrypted_contents = File.read(@file)
    contents = crypto.decrypt encrypted_contents
    db = JSON.parse(contents)
    db[key] = password
    File.open(@file, 'w') { |f| f.write(crypto.encrypt(db.to_json)) }
  end
  
  def list(crypto)
    raise "Unable to list keys when no database exists" unless exist?
    encrypted_contents = File.read(@file)
    contents = crypto.decrypt encrypted_contents
    db = JSON.parse(contents)
    db.keys
  end

  def delete(key, crypto)
    raise "Unable to delete key #{key} when no database exists" unless exist?
    encrypted_contents = File.read @file
    contents = crypto.decrypt encrypted_contents
    db = JSON.parse(contents)
    if db.keys.include? key
      db.delete key
    else
      puts "Cannot delete key #{key} when it doesn't exist"
    end
    File.open(@file, 'w') { |f| f.write(crypto.encrypt(db.to_json)) }
  end

  def generate(key, crypto, generator)
    raise "Unable to generate password for #{key} when no database exists" unless exist?
    raise "Unable to generate password for #{key} with no generator" unless generator

    encrypted_contents = File.read @file
    contents = crypto.decrypt encrypted_contents
    db = JSON.parse(contents)
    db[key] = generator.generate
    File.open(@file, 'w')  { |f| f.write(crypto.encrypt(db.to_json)) }
  end

  def get(key, crypto)
    raise "Unable to get password for #{key} when no database exists" unless exist?
    encrypted_contents = File.read @file
    contents = crypto.decrypt encrypted_contents
    db = JSON.parse contents
    if db.keys.include? key
    else
      raise "Unknown key: #{key}."
    end
  end

end
