class ArboDb

  def initialize(file = File.join(Dir.home, '.arbodb'))
    @file = file
  end

  def exist?
    return File.exist? @file
  end

  def init(crypto)
    raise "Database already created at #{@file}." unless !exist?
    crypto.encrypt
    File.open(@file, 'w+') { |f| Marshal.dump(Hash.new, f) }
  end

  def set(key, password, crypto)
    raise "Unable to set password for #{key} when no database exists" unless exist?
  end

end
