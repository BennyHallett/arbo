class Arbo

  def initialize(handlers)
    @handlers = handlers
  end

  def go(command, args)
    @handlers[command].execute(args)
  end

end
