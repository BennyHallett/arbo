class Arbo

  def initialize(handlers)
    @handlers = handlers
  end

  def go(command, args, password)
    @handlers[command].execute(args, password)
  end

end
