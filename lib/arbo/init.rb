require 'crypt/blowfish'
require 'fileutils'

class InitCommand

  def initialize
    @db = File.expand_path(File.join(Dir.home, '.arbodb'))
  end

  def execute(args)
    if args == nil or args.size == 0
      raise 'Password must be supplied'
    end
    password = args[0]
    
    if password.nil? or password.length == 0
      raise 'Password must be supplied'
    elsif File.file?(@db)
      raise 'DB file already exists'
    else
      file = File.open(@db, 'w+') { |f| Marshal.dump(Hash.new, f) }
      bf = Crypt::Blowfish.new(password)
      backup = "#{@db}.swp"
      bf.encrypt_file @db, backup
      FileUtils.mv backup, @db
    end
  end

end
