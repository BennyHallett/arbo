require 'test/unit'

# Add test libraries you want to use here, e.g. mocha

class Test::Unit::TestCase

  # Add global extensions to the test case class here

  @@help_text = 'Arbo - the command line password manager.

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

  @@init_text = 'Arbo - the command line password manager.

THE `INIT` COMMAND

The init command is used to initialize a new instance of an ArboDB. This 
ArboDB will contain all of the passwords that you have entered, in an 
encrypted format, using a master password which is supplied by the user.

The default location for the ArboDB to be created is ~/.arbodb, however 
this command respects the global flag --file (or -f for short), which 
allows users to specify the location of their database.

EXAMPLES:

The following command will initialize a new ArboDB at the default location, ~/.arbodb.

  arbo init

Or to specify the location of the ArboDB manually, use either one of

  arbo --file /home/me/work.arbodb
  arbo -f /home/me/personal.arbodb
'

  @@list_text = 'Arbo - the command line password manager.

THE `LIST` COMMAND

The list command is used to list all known keys in the ArboDB file.

EXAMPLES:

  arbo list
'
  
end
