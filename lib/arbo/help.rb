class HelpCommand

  def process(global_options, options, args)
    command = args.first
    command = command.to_sym unless !command

    return @command_help[command] unless !@command_help.keys.include? command
    @help
  end

  def initialize
    @help = 'Arbo - the command line password manager.

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

    @init = 'Arbo - the command line password manager.

THE `INIT` COMMAND

The init command is used to initialize a new instance of an ArboDB. This 
ArboDB will contain all of the passwords that you have entered, in an 
encrypted format, using a master password which is supplied by the user.

The default location for the ArboDB to be created is ~/.arbodb, however 
this command respects the global flag --file (or -f for short), which 
allows users to specify the location of their database.

EXAMPLES:

The following command will initialize a new ArboDB at the default 
location, ~/.arbodb.

  arbo init

Or to specify the location of the ArboDB manually, use either one of

  arbo --file /home/me/work.arbodb
  arbo -f /home/me/personal.arbodb
'

    @list = 'Arbo - the command line password manager.

THE `LIST` COMMAND

The list command is used to list all known keys in the ArboDB file.

EXAMPLES:

  arbo list
'

    @set = 'Arbo - the command line password manager.

THE `SET` COMMAND

The set command can be used to record a password in the ArboDB file. The 
user will be prompted for the password which will be saved in the ArboDB
file, encrypted.

EXAMPLES:

The following command will create a new entry for the `email` key:

  arbo set email
'

    @get = 'Arbo - the command line password manager.

THE `GET` COMMAND

The get command can be used to retrieve a stored password from the ArboDB.
The password is copied to the clipboard, to be pasted into the relevant 
application afterwards.

EXAMPLES:

The following command will retrieve the password for the `email` key:

  arbo get email
'

    @command_help = {
      :init       => @init,
      :list       => @list,
      :set        => @set,
      :get        => @get
    }
  end
  
end
