require 'arbo/arbo_db'

class SetCommand

  def process(global_options, options, args, crypto)
    raise 'Cannot process init command without crypto' unless crypto
    #db  = ArboDb.new global_options[:file]
    #db.init crypto
  end
  
end
