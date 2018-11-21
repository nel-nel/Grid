#The rover receives a char array of commands e.g. RMMLM and returns the finishing point after the moves e.g. 2,1,N

#You are given the initial starting point (0,0,N)

class Bot
  #constuctor 
  attr_accessor :coordinates, :moves, :direction
  
  def initialize (coordinates, moves, obstacles)
    @obstacles = obstacles 
    @x = coordinates[0]
    @y = coordinates[1]
    @direction = coordinates[2] 
    @moves = moves
    @stop = false
  end
    
  def calculate_position()
    for move in @moves
      self.change_direction(move)
      if move == 'M'
      	self.change_position()
      end #if
      #check for grid end  
    end #for
    if @stop ==false
      return [@x,@y] 
    else
      return ["O",@x,@y]
    end 
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
        if check_point(@x,@y+1)
          if no_obstacles(@x,@y+1)
            @y += 1
          else
            return ["O",@x,@y]
          end
        end
    when 'S'
        if check_point(@x,@y-1)
          if no_obstacles(@x,@y-1)
            @y -= 1
          else
            return ["O",@x,@y]
          end            
        end
    when 'E'
        if check_point(@x+1,@y)
          if no_obstacles(@x+1,@y)
            @x += 1
          else
            return ["O",@x, @y]
          end
        end
    when 'W'
        if check_point(@x-1,@y)    
          if no_obstacles(@x-1,@y)
            @x -= 1
          else
            return ["O",@x, @y]
          end
        end
    end #case   
  end #change_position()

  def check_point(x,y)
    #check for the ends of the grid
    if x < 0  &&  @direction == 'W' 
      @x=9 
      false     
    elsif x > 10  &&  @direction == 'E' 
      @x=0      
      false
    elsif y < 0  &&  @direction == 'S'   
      @y = 9      
      false
    elsif y > 10  &&  @direction == 'N' 
      @y=0     
      false 
    else
      true
    end #if
  end #check_point

  def no_obstacles(x,y)
    no_obstacles = true
    for obstacle in @obstacles
      if obstacle[0] == x && obstacle[1] == y
        no_obstacles = false
        @stop = true
        break 
      else
        no_obstacles = true 
      end #if  
    end #for
    return no_obstacles
  end #end of no_obstacles()

end #end of class
