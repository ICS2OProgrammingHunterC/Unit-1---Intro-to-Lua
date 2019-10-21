-- Physics and Collisions
-- Name: Hunter C
-- Course: ICS2O
-----------------------------------------------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
-------------------------------------------------------------------------------------------
-- OBJECTS
----------------------------------------------------------------------------------------
-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)
	ground.x = display.contentWidth/2
	ground.y = display.contentHeight*7.9/8

	--change the width to be the same as the screen
	ground.width = display.contentWidth

	-- add the physics
	physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

------------------------------------------------------------------------------------------
local beam = display.newImage("Images/beam_long.png")

	-- set the x and y pos
	beam.x = display.contentCenterX/5
	beam.y = display.contentCenterY*1.65

	-- set the width to be half the width of the Ipad and
	-- the height to be 1/10th of the ipad height
	beam.width = display.contentWidth/2
	beam.height = display.contentHeight*1/10

	--rotate the beam to -60 degrees 
	beam:rotate(45)

	--send it to the back layer
	beam:toBack()

	--add the physics
	physics.addBody(beam, "static", {friction = 0.5, bounce = 0.3})
---------------------------------------------------------------------------------------------
local beam2 = display.newImage("Images/beam_long.png")

	-- set the x and y pos
	beam2.x = display.contentWidth*7/8
	beam2.y = display.contentHeight*3.3/4
	-- set the width to be half the width of the Ipad and
	-- the height to be 1/10th of the ipad height
	beam2.width = display.contentWidth/2
	beam2.height = display.contentHeight*1/10

	--rotate the beam to -60 degrees 
	beam2:rotate(-45)

	--send it to the back layer
	beam2:toBack()

	--add the physics
	physics.addBody(beam2, "static", {friction = 0.5, bounce = 0.3})
---------------------------------------------------------------------------------------------
--create the background
local bkg = display.newImage("Images/bkg.png", 0, 0)

	--set the x and y position
	bkg.x = display.contentCenterX
	bkg.y = display.contentCenterY

	-- set the width to the width of the ipad and set the height to the height of the ipad
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	--send to the back
	bkg:toBack()

-------------------------------------------------------------------------------------------------
--FUNCTIONS
---------------------------------------------------------------------------------------------------

-- create the first ball
local function firstBall()

	-- create the first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	-- add the physics
	physics.addBody(ball1, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 25})
end
---------------------------------------------------------------------------------------------------

-- create the second ball
local function secondBall()

	--create the second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding the physics
	physics.addBody(ball2, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 12.5})

	-- scale the body to half the sive of ball1
	ball2:scale(0.5, 0.5)
end
---------------------------------------------------------------------------------------------------

--create the third ball which will be double the size of ball1
local function thirdBall()

	-- create the third ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)

	--adding the physics
	physics.addBody(ball3, {density = 1, friction = 0.5, bounce = 0.3, radius = 50})

	-- scale the body to be double ball1
	ball3:scale(2, 2)
end
---------------------------------------------------------------------------------------------------

-- create the fourth Ball
local function fourthBall()

	-- create the fourth ball
	local ball4 = display.newImage("Images/super_ball.png", 0, 0)

	-- adding the physics
	physics.addBody(ball4, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 37.5})

	-- scale the body to be 1.5x more than ball 1
	ball4:scale(1.5, 1.5)
end
-------------------------------------------------------------------------------
-- create the fifth ball
local function fifthBall()

	-- create the first ball
	local ball5 = display.newImage("Images/super_ball.png", 1028, 0)

	-- add the physics
	physics.addBody(ball5, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 25})
end
---------------------------------------------------------------------------------------------------

-- create the sixth ball
local function sixthBall()

	--create the second ball
	local ball6 = display.newImage("Images/super_ball.png", 1028, 0)

	-- adding the physics
	physics.addBody(ball6, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 12.5})

	-- scale the body to half the sive of ball1
	ball6:scale(0.5, 0.5)
end
---------------------------------------------------------------------------------------------------

--create the seventh ball which will be double the size of ball1
local function seventhBall()

	-- create the third ball
	local ball7 = display.newImage("Images/super_ball.png", 1028, 0)

	--adding the physics
	physics.addBody(ball7, {density = 1, friction = 0.5, bounce = 0.3, radius = 50})

	-- scale the body to be double ball1
	ball7:scale(2, 2)
end
---------------------------------------------------------------------------------------------------

-- create the eighth Ball
local function eighthBall()

	-- create the fourth ball
	local ball8 = display.newImage("Images/super_ball.png", 1028, 0)

	-- adding the physics
	physics.addBody(ball8, {density = 1.0, friction = 0.5, bounce = 0.3, radius = 37.5})

	-- scale the body to be 1.5x more than ball 1
	ball8:scale(1.5, 1.5)
end
---------------------------------------------------------------------------------------------------
--TIMER DELAYS
---------------------------------------------------------------------------------------------------
timer.performWithDelay (0, firstBall)
timer.performWithDelay(500, secondBall)
timer.performWithDelay(1000, thirdBall)
timer.performWithDelay(1500, fourthBall)
timer.performWithDelay (0, fifthBall)
timer.performWithDelay(500, sixthBall)
timer.performWithDelay(1000, seventhBall)
timer.performWithDelay(1500, eightBall)
