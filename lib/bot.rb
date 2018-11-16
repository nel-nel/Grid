#The rover receives a char array of commands e.g. RMMLM and returns the finishing point after the moves e.g. 2,1,N

#You are given the initial starting point (0,0,N)

class Bot
  #constuctor 
  attr_accessor :coordinates, :moves, :direction
  
  def initialize (coordinates, moves, obstacles)
    @obstacles = obstacles 
    @x = coordinates[0]
    @y = coordinates[1]
    @xtest = coordinates[0]
    @ytest = coordinates[1]
    @direction = coordinates[2] 
    @moves = moves
  end
    
  def calculate_position()
    for move in @moves
      self.change_direction(move)
      if move == 'M'
      	self.change_position()
      end #if
      #check for grid end 
      check_point() 
      if self.no_obstacles() == false      
        return ["О",@x,@y]
        #break
      else
        @x = @xtest
        @y = @ytest      
      end #if 
    end #for
    return [@xtest, @ytest]
  end #calculate_position
    
  def change_direction(move)    
    case move 
    when 'R'
      case @direction
      when 'N'
        @direction = 'E'
      when 'S'
        @direction = 'W'
      when 'E'
        @direction = 'S'
      when 'W'
        @direction = 'N'
      end       
      
    when 'L'
      case @direction
      when 'N'
        @direction = 'W'                 
      when 'S'
        @direction = 'E'     
      when 'E'
        @direction = 'N'          
      when 'W'
        @direction = 'S'     
      end
    when 'M'
      #don't change @direction in that case
    end
  end 
  def change_position()
    case @direction
    when 'N'
        if check_point(@x,@y++)
            @y += 1
        end
    when 'S'
        if check_point(@x,@y--)
            @y -= 1
        end
    when 'E'
        if check_point(@x++,@y)
            @xtest += 1
        end
    when 'W'
        if check_poin(@x--,@y)    
            @x -= 1
        end
    end #case   
  end #change_position()

  def check_point(x,y)
    #check for the ends of the grid
    if x < 0  &&  @direction == 'W' 
      @x= 9      
    elsif x > 10  &&  @direction == 'E' 
      @x=1      
    elsif y < 0  &&  @direction == 'S'   
      @y = 9      
    elsif y > 10  &&  @direction == 'N' 
      @ytest=1      
    else
      return true
    end #if
  end #check_point

  def no_obstacles()
    no_obstacles = true
    for obstacle in @obstacles
      if obstacle[0] == @xtest && obstacle[1] == @ytest
        no_obstacles = false
        break 
      else
        no_obstacles = true 
      end #if  
    end #for
    return no_obstacles
  end #end of no_obstacles()

end #end of class
