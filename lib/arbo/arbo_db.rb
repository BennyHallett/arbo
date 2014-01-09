class ArboDb

  def initialize(file = File.join(Dir.home, '.arbodb'))
    @created = false
    @file = file
  end

  def exist?
    return @created
  end

  def init(password)
    raise "Database already created at #{@file}." unless !exist?
    @created = true
    File.open(@file, 'w+') { |f| Marshal.dump(Hash.new, f) }
  end

  def set(key, password, master_password)
    raise "Unable to set password for #{key} when no database exists" unless exist?
  end

end
