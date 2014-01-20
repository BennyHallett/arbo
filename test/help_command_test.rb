require 'test_helper'
require 'arbo/help'

class HelpCommandTest < Test::Unit::TestCase

  def setup
    @help = HelpCommand.new
  end

  def teardown
  end

  def test_get_general_help
    assert_equal @@help_text, @help.process(Hash.new, Array.new, Array.new)
  end

  def test_get_init_help
    assert_equal @@init_text, @help.process(Hash.new, Array.new, ['init'])
  end

  def test_get_list_help
    assert_equal @@list_text, @help.process(Hash.new, Array.new, ['list'])
  end
end
