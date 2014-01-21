require 'arbo/arbo_db'

class GetCommand

  def process(global_options, options, args, crypto)
    raise 'Cannot process get command without crypto' unless crypto
    raise "Get command requires one key argument. You have provided #{args.length}." unless args.length == 1
    
    db  = ArboDb.new global_options[:file]
    key = args.first
    db.get key, crypto
  end
  
end
