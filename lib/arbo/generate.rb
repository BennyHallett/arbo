require 'arbo/arbo_db'

class GenerateCommand

  def process(global_options, options, args, crypto, generator)
    raise 'Cannot process set command without crypto' unless crypto
    raise 'Cannot process set command without generator' unless generator
    raise "Generate command requires one key argument. You have provided #{args.length}." unless args.length == 1

    #key = args.first
  
    #db  = ArboDb.new global_options[:file]
    #db.set key, pw, crypto
  end
  
end
