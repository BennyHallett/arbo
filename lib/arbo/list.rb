require 'arbo/arbo_db'

class ListCommand

  def process(global_options, options, args, crypto)
    raise 'Cannot process set command without crypto' unless crypto
    
    db  = ArboDb.new global_options[:file]
    db.list crypto
  end
  
end
