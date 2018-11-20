require_relative "../lib/bot"
require "test/unit"
x = 1
class TestBot < Test::Unit::TestCase 
  
  # def test_basic
  #   assert_equal([2,1], Bot.new([0,0,'N'],['R','M','M','L','M'],[[7,5]]).calculate_position(),"Basic test failed")
  # end

  def test_obstacles
    assert_equal([2,4], Bot.new([3,3,'N'],['L','M','R','М'],[[]]).calculate_position(),"Obstacle test failed")
  end 
  
  # def test_wrapsArround   
  #   assert_equal([9,0], Bot.new([0,0,'N'],['R','L','L','M','L'],[]).calculate_position(),"Wrap arround test failed")
  # end
  #  def test_wrapsArroundAndObstacle   
  #   assert_equal(["O",3,3], Bot.new([3,3,'N'],['L','M'],[[2,3]]).calculate_position(),"Obstacle and wrap arround test failed")
  # end
end
