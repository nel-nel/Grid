## Develop code that moves a rover around on a grid.
Rules:

You are given the initial starting point (0,0,N) of a rover.
0,0 are X,Y co-ordinates of the bottom left point on a grid of (10,10).
N is the direction it is facing (i.e. N,S,E,W).
L and R allow the rover to rotate left and right.
M allows the rover to move one point in the current direction.
The rover receives a char array of commands e.g. RMMLM and returns the finishing point after the moves e.g. 2,1,N
The rover wraps around if it reaches the end of the grid, e.g on position (0,0,W) the move command will result in (9,0,W).
Alternatively you can implement the end of the grid as turning 180 degrees backwards, e.g on position (0,0,W) the move command will result in (0,0,E).
The grid may have obstacles. If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point and reports it with O infront, e.g. O,2,2,N with obstacle on (2,3).
Implementation:

There is no need to read/write to the console.
The design of the code is up to you. But you need to have an entry point that will receive the commands. How you initialize the state of the code is again up to you.
Write specs, again up to you how many and what kind.

#Specifications
1.Just run the main class and you will see the results from the unit tests. There is no input from console, so I haven't validated the input, only the results. Every case is inilialized as an object of the class Bot with parameters: coordinates and direction, moves and obstacles' parameters. 
2.The grid wraps around when the rover riches the end. The Grid is 10x10 with 0,0 start.

The unit tests are: 
1.Basic
 [0,0,'N'],['R','M','M','L','M'],[[7,5]] -->[3,2]
 
2.Obstacles
[3,3,'N'],['L','M','R'],[] -->[1,4]

3.Wraps around
[0,0,'N'],['R','L','L','M','L'],[[7,5]] -->[9,0]

4.Wraps Arround And Obstacle   
[0,0,'N'],['R','L','L','M','L'],[[7,5],[9,1]] --> [0,0,1]



