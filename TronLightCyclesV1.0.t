%TronLightCyclesV0.6
%This will be a copy of the game tron light cycles
%Meeussen,Giliam
%Revised Jan. 14, 2011
%Version 1.0
%Previous Versions
%V0.1 Only had game objectives and physics
%V0.2 Added scoring system
%V0.3 Added a menu
%V0.5 Added a background to the game, instructions, commenting, recognition that the buttons were pressed and fixed some glitches and got rid of some useless code
%Data Dictionary
var p1x1, p1x2, p1y1, p1y2, p1d : int   %Player 1 locations and direction of travel
var p2x1, p2x2, p2y1, p2y2, p2d : int   %Player 2 locations and direction of travel
var scorep1, scorep2, roundp1, roundp2 : int    %Keeping track of who the winner is, the score, and who won the most recent round
var ready, gameSpeed, randomgSpeed : int    %Ready lets you play the game, gameSpeed is the speed of the game, randomgSpeed allows you to choose a random speed
var p1name, p2name : string %This is the names of the player 1 and player 2
var mx, my, mb : int    %This is the mouse coordinates and whether it is pressed
var sc, nc, fc, ec : int := 27    %These are the colours of the buttons
var count : int %This is how many loops the main game has been through


var squares : array - 10100 .. 35500 of int %This keeps track of the squares that have been occupied

var chars : array char of boolean   %The keyboard variable

setscreen ("graphics:500;370")  %Sets the screensize
View.Set ("offscreenonly")  %Useless right now

gameSpeed := 100    %Sets the default game speed to normal
nc := 23    %Sets the normal button to the default activated button

loop    %The entire game loop

    scorep1 := 0    %Sets the beginning score of player 1 to 0
    scorep2 := 0    %Sets the beginning score of player 2 to 0
    ready := 0  %Sets the ready to 0 to make sure the game does not exit the menu loop
    cls

    loop    %The menu loop

	mousewhere (mx, my, mb) %Keeps track of where the mouse is
	drawfillbox (0, 0, maxx, maxy, black)   %Draws the background
	drawfillbox (maxx div 2 - 62, 50, maxx div 2 + 62, 100, grey)   %Draws the play button
	drawfillbox (21, 150, 79, 180, sc)    %Draws the slow gamespeed button
	drawfillbox (120, 150, 183, 180, nc)  %Draws the normal gamespeed button
	drawfillbox (216, 150, 279, 180, fc)  %Draws the fast gamespeed button
	drawfillbox (320, 150, 383, 180, ec)  %Draws the epic gamespeed button
	drawfillbox (424, 150, 487, 180, grey)  %Draws the random gamespeed button
	%Sets the background colour, coulour and location for "TRON"
	colourback (black)
	colour (42)
	locate (4, 12)
	put "TRON"  %Writes "TRON"
	%Sets the background colour, coulour and location for "Light Cycles"
	colour (78)
	locate (5, 14)
	put "Light Cycles"  %Writes "Light Cycles"
	%Sets the background colour, colour and location for "PLAY"
	colour (white)
	colourback (grey)
	locate (19, 30)
	put "PLAY"  %Writes "PLAY"
	%Sets the background colour, colour and location for after the "PLAY"
	colourback (black)
	locate (19, 40)
	put " " %Makes the background switch to the right colour
	%Sets the background colour, colour and location for "SLOW"
	colour (white)
	colourback (sc)
	locate (13, 5)
	put "SLOW"  %Writes "SLOW"
	%Sets the background colour, colour and location for after the "SLOW"
	colourback (black)
	locate (13, 11)
	put " " %Makes the background switch to the right colour
	%Sets the background colour, colour and location for "NORMAL"
	colour (white)
	colourback (nc)
	locate (13, 16)
	put " NORMAL"   %Writes "NORMAL"
	%Sets the background colour, colour and location for after the "NORMAL"
	colourback (black)
	locate (13, 24)
	put " " %Makes the background switch to the right colour
	%Sets the background colour, colour and location for "FAST"
	colour (white)
	colourback (fc)
	locate (13, 28)
	put "  FAST"    %Writes "FAST"
	%Sets the background colour, colour and location for after the "FAST"
	colourback (black)
	locate (13, 36)
	put " " %Makes the background switch to the right colour
	%Sets the background colour, colour and location for "EPIC"
	colour (white)
	colourback (ec)
	locate (13, 41)
	put "  EPIC"    %Writes "EPIC"
	%Sets the background colour, colour and location for after the "EPIC"
	colourback (black)
	locate (13, 49)
	put " " %Makes the background switch to the right colour
	%Sets the background colour, colour and location for "RANDOM"
	colour (white)
	colourback (grey)
	locate (13, 54)
	put " RANDOM"   %Writes "RANDOM"
	%Sets the background colour, colour and location for after the "RANDOM"
	colourback (black)
	locate (13, 62)
	put " " %Makes the background switch to the right colour
	if mx > maxx div 2 - 62 and my > 50 and mx < maxx div 2 + 62 and my < 100 and mb = 1 then   %This tests if the play button has been pressed
	    ready := 1  %This assigns the ready a value of 1 for later
	end if
	if mx > 20 and my > 150 and mx < 80 and my < 180 and mb = 1 then    %This tests if the slow button has been pressed
	    gameSpeed := 150    %Sets the game speed to slow
	    %Unboldens the other buttons
	    nc := 27
	    fc := 27
	    ec := 27
	    sc := 23    %Boldens the slow button
	end if
	if mx > 120 and my > 150 and mx < 180 and my < 180 and mb = 1 then  %This tests if the normal button has been pressed
	    gameSpeed := 75    %Sets the game speed to normal
	    %Unboldens the other buttons
	    sc := 27
	    fc := 27
	    ec := 27
	    nc := 23    %Boldens the normal button
	end if
	if mx > 220 and my > 150 and mx < 280 and my < 180 and mb = 1 then  %This tests if the fast button has been pressed
	    gameSpeed := 50 %Sets the game speed to fast
	    %Unboldens the other buttons
	    sc := 27
	    nc := 27
	    ec := 27
	    fc := 23    %Boldens the fast button
	end if
	if mx > 320 and my > 150 and mx < 380 and my < 180 and mb = 1 then  %This tests if the epic button has been pressed
	    gameSpeed := 10 %Sets the game speed to epic
	    %Unboldens the other buttons
	    sc := 27
	    nc := 27
	    fc := 27
	    ec := 23    %Boldens the epic button
	end if
	if mx > 420 and my > 150 and mx < 480 and my < 180 and mb = 1 then  %This tests if the random button has been pressed
	    randint (randomgSpeed, 1, 3)    %This picks a random int from 1 to 3
	    if randomgSpeed = 1 then    %This tests if the random int is 1
		gameSpeed := 150    %Sets the game speed to slow
		%Unboldens the other buttons
		nc := 27
		fc := 27
		ec := 27
		sc := 23    %Boldens the slow button
	    elsif randomgSpeed = 2 then %This tests if the random int is 2
		gameSpeed := 75    %Sets the game speed to normal
		%Unboldens the other buttons
		sc := 27
		fc := 27
		ec := 27
		nc := 23    %Boldens the normal button
	    else    %Everything else(3)
		gameSpeed := 50 %Sets the game speed to fast
		%Unboldens the other buttons
		sc := 27
		nc := 27
		ec := 27
		fc := 23    %Boldens the fast button
	    end if
	    delay (500) %Slows down the rate at which this button can be pressed, and makes it only pressed once easily
	end if
	View.Update %Views the menu
	exit when ready = 1 %Exits the menu when ready is 1/play has been pressed

    end loop

    cls %Clears the screen of the menu
    put "Enter player 1 name. " ..  %Prompts the user for player 1 name
    View.Update %Veiws the prompt
    get p1name  %Lets you enter the name
    View.Update %Lets you see the name you have entered
    put "Enter player 2 name. " ..  %Prompts the user for player 2 name
    View.Update %Views the prompt
    get p2name  %Lets you enter the name
    View.Update %Lets you see the name you have entered

    loop    %Creates a loop that will not let you enter the same player 2 name as player 1

	if p1name = p2name then %Tests if player 1 name is the same as player 2 name
	    put "Enter a different player 2 name. " ..  %Prompts you to enter a different player 2 name
	    View.Update %Views the prompt
	    get p2name  %Lets you enter a new player 2 name
	    View.Update %Lets you see the name the name you have entered
	end if
	exit when p1name not= p2name    %Exits the loop when player 1's name is different than player 2's

    end loop

    cls %Clears the name entering screen
    drawfillbox (0, 0, maxx, maxy, black)   %Draws the background
    put p1name, "'s controls are w for up, a for left, d for right, s for"    %Informs the player 1 of their controls
    put "down."
    put p2name, "'s controls are the arrow keys for each of the directions."    %Informs the player 2 of their controls
    put "Beat the enemy player by being the last one to survive, by notrunning into a trail or wall."  %Tells the players their objectives
    View.Update %Views the instructions
    delay (5000)    %Shows the instructions for 5 seconds

    loop    %This loop sets the game up

	%Sets player 2's starting position and gives them no direction
	p2x1 := 330
	p2y1 := 170
	p2x2 := 340
	p2y2 := 180
	p2d := 0
	%Sets player 1's starting position and gives them no direction
	p1x1 := 160
	p1y1 := 170
	p1x2 := 170
	p1y2 := 180
	p1d := 0
	%Sets the winner of the round to no one for both players
	roundp2 := 0
	roundp1 := 0
	%Sets all of the squares to being considered unoccupied
	for count1 : -10100 .. 35500
	    squares (count1) := 0
	end for
	%Sets the count of the main game loop to 1
	count := 1
	colourback (white)  %Sets the background colour of text to white
	colour (black)  %Sets the colour of text to black
	cls %Clears the name choosing screen

	loop %This is the main game loop, it loops the program for a constant read of the controls

	    Input.KeyDown (chars) %Keeps track of the keyboard

	    if count = 1 then   %Tests if it is the first loop
		put p1name, ": ", scorep1, "   ", p2name, ": ", scorep2   %Displays the player names and score of each player
		%These drawlines draw the grid of the game
		drawline (0, 350, maxx, 350, black)
		drawline (0, 340, maxx, 340, grey)
		drawline (0, 330, maxx, 330, grey)
		drawline (0, 320, maxx, 320, grey)
		drawline (0, 310, maxx, 310, grey)
		drawline (0, 300, maxx, 300, grey)
		drawline (0, 290, maxx, 290, grey)
		drawline (0, 280, maxx, 280, grey)
		drawline (0, 270, maxx, 270, grey)
		drawline (0, 260, maxx, 260, grey)
		drawline (0, 250, maxx, 250, grey)
		drawline (0, 240, maxx, 240, grey)
		drawline (0, 230, maxx, 230, grey)
		drawline (0, 220, maxx, 220, grey)
		drawline (0, 210, maxx, 210, grey)
		drawline (0, 200, maxx, 200, grey)
		drawline (0, 190, maxx, 190, grey)
		drawline (0, 180, maxx, 180, grey)
		drawline (0, 170, maxx, 170, grey)
		drawline (0, 160, maxx, 160, grey)
		drawline (0, 150, maxx, 150, grey)
		drawline (0, 140, maxx, 140, grey)
		drawline (0, 130, maxx, 130, grey)
		drawline (0, 120, maxx, 120, grey)
		drawline (0, 110, maxx, 110, grey)
		drawline (0, 100, maxx, 100, grey)
		drawline (0, 90, maxx, 90, grey)
		drawline (0, 80, maxx, 80, grey)
		drawline (0, 70, maxx, 70, grey)
		drawline (0, 60, maxx, 60, grey)
		drawline (0, 50, maxx, 50, grey)
		drawline (0, 40, maxx, 40, grey)
		drawline (0, 30, maxx, 30, grey)
		drawline (0, 20, maxx, 20, grey)
		drawline (0, 10, maxx, 10, grey)
		drawline (10, 0, 10, 350, grey)
		drawline (20, 0, 20, 350, grey)
		drawline (30, 0, 30, 350, grey)
		drawline (40, 0, 40, 350, grey)
		drawline (50, 0, 50, 350, grey)
		drawline (60, 0, 60, 350, grey)
		drawline (70, 0, 70, 350, grey)
		drawline (80, 0, 80, 350, grey)
		drawline (90, 0, 90, 350, grey)
		drawline (100, 0, 100, 350, grey)
		drawline (110, 0, 110, 350, grey)
		drawline (120, 0, 120, 350, grey)
		drawline (130, 0, 130, 350, grey)
		drawline (140, 0, 140, 350, grey)
		drawline (150, 0, 150, 350, grey)
		drawline (160, 0, 160, 350, grey)
		drawline (170, 0, 170, 350, grey)
		drawline (180, 0, 180, 350, grey)
		drawline (190, 0, 190, 350, grey)
		drawline (180, 0, 180, 350, grey)
		drawline (190, 0, 190, 350, grey)
		drawline (200, 0, 200, 350, grey)
		drawline (210, 0, 210, 350, grey)
		drawline (220, 0, 220, 350, grey)
		drawline (230, 0, 230, 350, grey)
		drawline (240, 0, 240, 350, grey)
		drawline (250, 0, 250, 350, grey)
		drawline (260, 0, 260, 350, grey)
		drawline (270, 0, 270, 350, grey)
		drawline (280, 0, 280, 350, grey)
		drawline (290, 0, 290, 350, grey)
		drawline (300, 0, 300, 350, grey)
		drawline (310, 0, 310, 350, grey)
		drawline (320, 0, 320, 350, grey)
		drawline (330, 0, 330, 350, grey)
		drawline (340, 0, 340, 350, grey)
		drawline (350, 0, 350, 350, grey)
		drawline (360, 0, 360, 350, grey)
		drawline (370, 0, 370, 350, grey)
		drawline (380, 0, 380, 350, grey)
		drawline (390, 0, 390, 350, grey)
		drawline (400, 0, 400, 350, grey)
		drawline (410, 0, 410, 350, grey)
		drawline (420, 0, 420, 350, grey)
		drawline (430, 0, 430, 350, grey)
		drawline (440, 0, 440, 350, grey)
		drawline (450, 0, 450, 350, grey)
		drawline (460, 0, 460, 350, grey)
		drawline (470, 0, 470, 350, grey)
		drawline (480, 0, 480, 350, grey)
		drawline (490, 0, 490, 350, grey)
	    end if
	    if p2x1 < 0 or p2x2 > 500 or p2y1 < 0 or p2y2 > 350 then %Tests to see if player 2 ran into a wall
		roundp1 := 1 %Sets the winner of the round to player 1
	    end if
	    if p1x1 < 0 or p1x2 > 500 or p1y1 < 0 or p1y2 > 350 then %Tests to see if player 1 ran into a wall
		roundp2 := 1 %Sets the winner of the round to player 2
	    end if
	    if chars (KEY_UP_ARROW) then %Tests to see which direction the cycle should move for player 2
		p2d := 1 %Saves the most recent direction of movement for player 2
	    end if
	    if chars (KEY_DOWN_ARROW) then  %See above if statement
		p2d := 2
	    end if
	    if chars (KEY_RIGHT_ARROW) then %See above if statement
		p2d := 3
	    end if
	    if chars (KEY_LEFT_ARROW) then %See above if statement
		p2d := 4
	    end if
	    if chars ('w') then %Tests to see which direction the cycle should move for player 1
		p1d := 1 %Saves the most recent direction of movement for player 1
	    end if
	    if chars ('s') then %See above if statement
		p1d := 2
	    end if
	    if chars ('d') then %See above if statement
		p1d := 3
	    end if
	    if chars ('a') then %See above if statement
		p1d := 4
	    end if
	    if p2d = 0 or p1d = 0 then  %Tests if either of them has not pressed an arrowkey yet
		p2d := 0    %Does not let player 2 start
		p1d := 0    %Deos not let player 1 start
	    end if
	    if p2d = 1 then %Tests for the direction of player 2
		p2y1 := p2y1 + 10 %Makes it move upwards
		p2y2 := p2y2 + 10
	    end if
	    if p2d = 2 then %See above if statement
		p2y1 := p2y1 - 10 %Down
		p2y2 := p2y2 - 10
	    end if
	    if p2d = 3 then %See above if statement
		p2x1 := p2x1 + 10 %Right
		p2x2 := p2x2 + 10
	    end if
	    if p2d = 4 then %See above if statement
		p2x1 := p2x1 - 10 %Left
		p2x2 := p2x2 - 10
	    end if
	    if p1d = 1 then %Tests for the direction of player 1
		p1y1 := p1y1 + 10 %Makes it move upwards
		p1y2 := p1y2 + 10
	    end if
	    if p1d = 2 then %See above if statement
		p1y1 := p1y1 - 10 %Down
		p1y2 := p1y2 - 10
	    end if
	    if p1d = 3 then %See above if statement
		p1x1 := p1x1 + 10 %Right
		p1x2 := p1x2 + 10
	    end if
	    if p1d = 4 then %See above if statement
		p1x1 := p1x1 - 10 %Left
		p1x2 := p1x2 - 10
	    end if
	    exit when roundp2 = 1 or roundp1 = 1    %Exits the loop if someone has won the round
	    if squares (p2x1 + p2y1 * 100) = 0 and p2d > 0 then %Tests to see if the square the player 2 is in has never been occupied and if they have moved
		squares (p2x1 + p2y1 * 100) := 1    %Gives the value of the square player 2 is in the status of occupied
	    elsif squares (p2x1 + p2y1 * 100) = 1 then  %Tests if the square player 2 is in has been occupied
		roundp1 := 1    %Sets the winner of the round to player 1
	    end if
	    if squares (p1x1 + p1y1 * 100) = 0 and p1d > 0 then %Tests to see if the square the player 1 is in has never been occupied and if they have moved
		squares (p1x1 + p1y1 * 100) := 1    %Gives the value of the square player 1 is in the status of occupied
	    elsif squares (p1x1 + p1y1 * 100) = 1 then  %Tests if the square player 1 is in has been occupied
		roundp2 := 1    %Sets the winner of the round to player 2
	    end if
	    drawfillbox (p2x1, p2y1, p2x2, p2y2, 42)    %Draws the most recent position of player 2
	    drawfillbox (p1x1, p1y1, p1x2, p1y2, 78)    %Draws the most recent position of player 1
	    View.Update %Views the most recent version of the screen
	    delay (gameSpeed)
	    if p2d > 0 then %Tests if player 2 has moved
		squares (17330) := 1    %Sets the starting position of player 2 to occupied
	    end if
	    if p1d > 0 then %Tests if player 1 has moved
		squares (17160) := 1    %Sets the starting position of player 1 to occupied
	    end if
	    count := count + 1  %Increases the count by 1

	end loop

	if roundp2 = 1 and roundp1 = 0 then %Tests if player 2 has won the round
	    scorep2 := scorep2 + 1  %Adds 1 to player 2's score
	end if
	if roundp1 = 1 and roundp2 = 0 then %Tests if player 1 has won the round
	    scorep1 := scorep1 + 1  %Adds 1 to player 1's score
	end if
	if roundp2 = 1 and roundp1 = 1 then %Tests if there was a tie
	    drawfillbox (0, 0, maxx, maxy, black)   %Draws the background
	    %Sets the text to white, and the background colour of the text to black, and locates the text to the centre right
	    colour (white)
	    colourback (black)
	    locate (maxrow div 2, (maxcol div 2) - 2)
	    put "TIE!"  %Writes "TIE!"
	    View.Update %Views the tie screen
	end if
	exit when scorep2 = 10 or scorep1 = 10  %Exits the loop when someone reaches a score of 10
	delay (1000)    %Shows the tie screen/shows the final image of when someone died

    end loop

    cls %Clears the screen
    drawfillbox (0, 0, maxx, maxy, black)   %Draws the background
    %Sets the text to white, and the background colour of the text to black, and locates the text to the centre right
    colour (white)
    colourback (black)
    locate (maxrow div 2, (maxcol div 2) - 5)
    if scorep1 = 10 then    %Tests if player 1 has a score of 10
	put p1name, " WINS!!!"  %Writes "player 1 wins!!!"
    end if
    if scorep2 = 10 then    %Tests if player 2 has a score of 10
	put p2name, " WINS!!!"  %Writes "player 2 wins!!!"
    end if
    View.Update %Views the victory screen
    delay (5000)    %Lets the victory screen show for 5 seconds

end loop


