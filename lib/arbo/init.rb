class InitCommand

  def process(global_options, options, args, crypto)
    raise 'Cannot process init command without crypto' unless crypto
  end
  
end
