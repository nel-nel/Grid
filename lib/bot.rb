#The rover receives a char array of commands e.g. RMMLM and returns the finishing point after the moves e.g. 2,1,N

#You are given the initial starting point (0,0,N)

class Bot
  #constuctor 
  attr_accessor :coordinates, :moves, :direction
  
  def initialize (coordinates, moves, obstacles)
    @x = coordinates[0]
    @y = coordinates[1]
    @direction = coordinates[2] 
    @moves = moves
    @obstacles = obstacles 
    @stop = false
  end
    
  def calculate_position()
    position = []
    for move in @moves
      self.change_direction(move)
      if move == 'M'
        change_position()
        if @stop == true
          return ["O",@x,@y]                 
        else
          [@x,@y]
        end #if    
      end #if
    end #for
    #return position
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
      when 'M'
      #don't change @direction in that case
      end
    end #case
  end #change_direction

  def change_position()
    case @direction
    when 'N'
      a = @x , b = @y + 1
      self.no_obstacles(a,b)
      if @stop == false 
        #if obstacle, don't change position and return 
        if self.check_point(a,b) == true
          @y += 1
        end #if 
      end #if     
    when 'S'
      a = @x , b = @y - 1
      self.no_obstacles(a,b)
      if @stop == false   
        if self.check_point(a,b) == true
          @y -= 1
        end #if    
      end #if   
    when 'E'
      a = @x + 1 , b = @y
      self.no_obstacles(a,b)
      if @stop == false  
        if self.check_point(a,b) == true
          @x += 1
        end #if
      end #if
    when 'W'
      a = @x - 1 , b = @y
      self.no_obstacles(a,b)
      if @stop == false 
        if self.check_point(a,b) == true  
          @x -= 1
        end #if
      end #if  
    end #case   
  end #change_position()

  def check_point(x,y)
    #check for the ends of the grid
    if x == -1  &&  @direction == 'W' 
      @x = 9
      return false      
    elsif x == 11  &&  @direction == 'E' 
      @x = 1  
      return false     
    elsif y == -1  &&  @direction == 'S'   
      @y = 9  
      return false     
    elsif y == 11  &&  @direction == 'N' 
      @y = 1     
    else
      return true
    end #if
  end #check_point

  def no_obstacles(a,b)
    no_obstacles = true
    for obstacle in @obstacles
      if @obstacles[0] == a && @obstacles[1] == b
        @stop = true
        no_obstacles = false        
      end #if  
    end #for
    return no_obstacles
  end #end of no_obstacles()

end #end of class
