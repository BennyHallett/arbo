require 'test_helper'
require 'arbo/help'

class HelpCommandTest < Test::Unit::TestCase

  def setup
    @help = HelpCommand.new
  end

  def teardown
  end

  def test_get_general_help
    assert_equal @@help_text, @help.process(Array.new, Array.new, Array.new)
  end
end
