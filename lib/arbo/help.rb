class HelpCommand

  def process(global_options, options, args)
    return 'Arbo - the command line password manager.

USAGE: arbo [-f|--file $filepath] $command $arguments...

COMMANDS:

  help:     Displays this help text.
  init:     Initialises the database. Will fail if one already exists.
  set:      Sets the password for a given key.
  get:      Retrieves the password for a given key.
  list:     List all of the keys in the database.
  delete:   Delete a password from the database.
  generate: Generate a random password for a given key.

  For more information on these commands, please use `arbo help $command`

GLOBAL FLAGS:

  -f | --filename:    Specify the database file to use.
                      Default is ~/.arbodb
'
  end
  
end
