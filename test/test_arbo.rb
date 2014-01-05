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
    pw = 'Secret'
    @mock_handler.expects(:execute).with(args, pw)
    @arbo.go :mock, args, pw
  end

end
