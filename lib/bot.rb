#The rover receives a char array of commands e.g. RMMLM and returns the finishing point after the moves e.g. 2,1,N

#You are given the initial starting point (0,0,N)
class Bot
  #constuctor 
  attr_accessor :coordinates, :moves, :direction
    
  def initialize (coordinates, moves, obstacles)
    @obstacles =obstacles 
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
      self.change_position()
      #check for grid end 
      check_point() 
      if self.no_obstacles() == false      
        return [0,@x,@y]
        #break
      else
        @x = @xtest
        @y = @ytest      
      end #if 
    end #for
    return [@xtest,@ytest]
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
        @direction='N'
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
        @direction='S'     
      end
    when 'M'
      #don't change @direction in that case
    end
  end 
  def change_position()
    case @direction
    when 'N'
      @ytest += 1                    
    when 'S'
      @ytest -= 1            
    when 'E'
      @xtest += 1          
    when 'W'
      @xtest -= 1
    end #case   
  end #change_position()

  def check_point()
    #check for the ends of the grid
    if @xtest < 0  &&  @direction == 'W' 
      @xtest = 9      
    elsif @xtest > 10  &&  @direction == 'E' 
      @xtest=1      
    elsif @ytest < 0  &&  @direction == 'S'   
      @ytest = 9      
    elsif @ytest > 10  &&  @direction == 'N' 
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