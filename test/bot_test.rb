require_relative "../lib/bot"
require "test/unit"

class TestBot < Test::Unit::TestCase 
  
  def test_basic
    assert_equal([2,1], Bot.new([0,0,'N'],['R','M','M','L','M'],[[7,5]]).calculate_position(),"Basic test failed")
  end

  def test_obstacles
    assert_equal([2,3], Bot.new([3,3,'N'],['L','M','R','М'],[[2,4]]).calculate_position(),"obstacle test failed")
  end 
  
  def test_wrapsArround   
    assert_equal([9,0], Bot.new([0,0,'N'],['R','L','L','M','L'],[]).calculate_position(),"It doesn't work without obstacles")
  end
   def test_wrapsArroundAndObstacle   
    assert_equal(["О",9,2], Bot.new([0,0,'N'],['R','L','M','M','L','M','M'],[[8,2]]).calculate_position(),"It doesn't work without obstacles")
  end
end


