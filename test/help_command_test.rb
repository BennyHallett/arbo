require 'test_helper'
require 'arbo/help'

class HelpCommandTest < Test::Unit::TestCase

  def setup
    @help = HelpCommand.new
  end

  def teardown
  end

  def test_get_general_help
    help_command_for_arg_should_return_value nil, @@help_text
  end

  def test_get_init_help
    help_command_for_arg_should_return_value 'init', @@init_text
  end

  def test_get_list_help
    help_command_for_arg_should_return_value 'list', @@list_text
  end

  def test_get_set_help
    help_command_for_arg_should_return_value 'set', @@set_text
  end

  def help_command_for_arg_should_return_value(command, value)
    if command
      arg_array = [command]
    else
      arg_array = Array.new
    end

    assert_equal(value, @help.process(Hash.new, Array.new, arg_array))
  end

end
