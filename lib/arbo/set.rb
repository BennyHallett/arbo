require 'crypt/blowfish'
require 'fileutils'

class SetCommand

  def initialize
    @db = File.expand_path(File.join(Dir.home, '.arbodb'))
  end

  def execute(args, password)
    if password.nil? or password.length == 0
      raise 'Password must be supplied'
    elsif !File.file?(@db)
      raise 'DB doesn\'t yet exist. Run \'arbo init\' to create it.'
    else
      bf = Crypt::Blowfish.new(password)
      backup = "#{@db}.swp"
      bf.decrypt_file @db, backup
      file = File.open(backup, 'r+') do |f|
        begin
          contents = Marshal.load(f)
        rescue TypeError
          raise 'Unable to decrypt password file'
        end

        puts "\nWhat is the password for #{args[0]}"
        new_pw = $stdin.gets

        contents[args[0]] = new_pw
        Marshal.dump(contents, f)
      end
      bf.encrypt_file backup, @db
      FileUtils.rm backup
    end
  end

end
