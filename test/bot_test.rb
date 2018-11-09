require_relative "bot"
require "test/unit"

class TestBot < Test::Unit::TestCase 
  
  def test_basic
    assert_equal([3,2], Bot.new([0,0,'N'],['R','M','M','L','M'],[[7,5]]).calculatePosition(),"Basic test failed")
  end

  def test_obstacles
    assert_equal([1,4], Bot.new([3,3,'N'],['L','M','R'],[]).calculatePosition(),"obstacle test failed")
  end 
  
  def test_wrapsArround   
    assert_equal([9,0], Bot.new([0,0,'N'],['R','L','L','M','L'],[[7,5]]).calculatePosition(),"It doesn't work without obstacles")
  end
   def test_wrapsArroundAndObstacle   
    assert_equal([0,0,1], Bot.new([0,0,'N'],['R','L','L','M','L'],[[7,5],[9,1]]).calculatePosition(),"It doesn't work without obstacles")
  end
end


