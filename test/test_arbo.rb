require 'arbo'
require 'test/unit'
require 'mocha/setup'

class ArboTests < Test::Unit::TestCase

  def setup
    @mock_handler = mock('object')
    @arbo = Arbo.new({ :mock => @mock_handler })
  end

  def test_call_command_handler
    args = Array.new
    @mock_handler.expects(:execute).with(args)
    @arbo.go :mock, args
  end

end
