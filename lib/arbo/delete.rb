require 'arbo/arbo_db'

class DeleteCommand

  def process(global_options, options, args, crypto)
    raise 'Cannot process set command without crypto' unless crypto
    raise "Set command requires one key argument. You have provided #{args.length}." unless args.length == 1

    key = args.first
  
    db  = ArboDb.new global_options[:file]
    db.delete key, crypto
  end
  
end
