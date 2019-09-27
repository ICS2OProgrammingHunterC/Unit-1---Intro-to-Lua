-- Title: MovingObjects
-- Name: Your Name
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade out.

-- hide the satus bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 10

--Background image with width and height
local backgroundImage = display.newImageRect("Images/Galaxy.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

--set the initial x and y position of the beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/2

local octopus = display.newImageRect("Images/octopus.png", 200, 200)
octopus.alpha = 0

octopus.x = display.contentWidth/2
octopus.y = 0

local function MoveShipDown(event)
	octopus.y = octopus.y + scrollSpeed
	octopus.alpha = octopus.alpha + 0.01
end

Runtime:addEventListener("enterFrame", MoveShipDown)

--function: MoveShip
--Input : this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-----------------------------------------------------------------------------------------


