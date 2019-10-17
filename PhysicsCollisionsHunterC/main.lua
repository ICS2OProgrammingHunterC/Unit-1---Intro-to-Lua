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
